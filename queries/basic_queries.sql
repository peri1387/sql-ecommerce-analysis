-- ====================================
-- E-COMMERCE DATABASE - QUERIES με JOINs
-- ====================================
-- Author: Andrianos Periklis
-- Date: January 2026
-- DBMS: MySQL
-- ====================================

USE ecommerce_db;

-- ====================================
-- QUERY 1: Top 10 Best-Selling Products
-- ====================================
-- Goal: Find out the top 10 best-selling products by revenue
-- JOINs: 3 (Products ← Order_Items → Orders)
-- Techniques: INNER JOIN, GROUP BY, SUM, COUNT, ORDER BY, LIMIT

SELECT 
    p.product_id,
    p.product_name,
    c.category_name,
    COUNT(DISTINCT oi.order_id) AS total_orders,
    SUM(oi.quantity) AS total_quantity_sold,
    ROUND(SUM(oi.subtotal), 2) AS total_revenue,
    ROUND(AVG(oi.unit_price), 2) AS avg_selling_price
FROM Products p
INNER JOIN Order_Items oi ON p.product_id = oi.product_id
INNER JOIN Orders o ON oi.order_id = o.order_id
INNER JOIN Categories c ON p.category_id = c.category_id
WHERE o.status IN ('Delivered', 'Shipped')
GROUP BY p.product_id, p.product_name, c.category_name
ORDER BY total_revenue DESC
LIMIT 10;

-- Comments:
-- Useful for inventory management and marketing campaigns.
-- We filter only delivered/shipped orders for accurate results.


-- ====================================
-- QUERY 2: VIP Customers (spending > €1000)
-- ====================================
-- Goal: VIP customers for loyalty programs
-- JOINs: 2 (Customers → Orders → Order_Items)
-- Techniques: INNER JOIN, GROUP BY, SUM, HAVING, ORDER BY

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    c.email,
    c.city,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.subtotal) AS total_spent,
    ROUND(AVG(o.total_amount), 2) AS avg_order_value,
    MAX(o.order_date) AS last_order_date
FROM Customers c
INNER JOIN Orders o ON c.customer_id = o.customer_id
INNER JOIN Order_Items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.first_name, c.last_name, c.email, c.city
HAVING total_spent > 1000
ORDER BY total_spent DESC;

-- Comments:
-- The HAVING clause filters after GROUP BY (unlike WHERE which filters before).
-- Useful for targeted marketing and VIP programs.

-- ====================================
-- QUERY 3: Average Ratings per Category
-- ====================================
-- Goal: Find out which categories have the best ratings
-- JOINs: 2 (Categories → Products → Reviews)
-- Techniques: INNER JOIN, GROUP BY, AVG, COUNT, ROUND

SELECT
    c.category_name,
    COUNT(DISTINCT p.product_id) AS products_in_category,
    COUNT(r.review_id) AS total_reviews,
    ROUND(AVG(r.rating), 2) AS avg_rating,
    MIN(r.rating) AS lowest_rating,
    MAX(r.rating) AS highest_rating,
    ROUND(AVG(p.price), 2) AS avg_product_price
FROM Categories c
INNER JOIN Products p ON c.category_id = p.category_id
LEFT JOIN Reviews r ON p.product_id = r.product_id
GROUP BY c.category_id, c.category_name
HAVING total_reviews > 0
ORDER BY avg_rating DESC, total_reviews DESC;

-- Comments:
-- We use LEFT JOIN because some products may not have reviews.
-- This helps us understand which categories are most popular.
-- The avg_product_price gives context for price-quality relationships.

-- ====================================
-- QUERY 4: Supplier Performance Analysis
-- ====================================
-- Goal: Supplier analysis for supply chain optimization
-- JOINs: 1 (Suppliers → Product_Suppliers → Products)
-- Techniques: INNER JOIN, GROUP BY, COUNT, AVG, MIN, MAX

SELECT
    s.supplier_id,
    s.supplier_name,
    s.country,
    s.city,
    COUNT(DISTINCT ps.product_id) AS products_supplied,
    ROUND(AVG(ps.supply_price), 2) AS avg_supply_price,
    ROUND(MIN(ps.supply_price), 2) AS min_supply_price,
    ROUND(MAX(ps.supply_price), 2) AS max_supply_price,
    MAX(ps.last_supply_date) AS most_recent_supply
FROM Suppliers s
INNER JOIN Product_Suppliers ps ON s.supplier_id = ps.supplier_id
GROUP BY s.supplier_id, s.supplier_name, s.country, s.city
ORDER BY products_supplied DESC, avg_supply_price ASC;

-- Comments:
-- This query shows which suppliers are most important (most products supplied).
-- We can evaluate supply prices and identify suppliers for negotiations.
-- Useful for supplier relationship management and procurement decisions.

-- ====================================
-- QUERY 5: Complete Order Details
-- ====================================
-- Goal: Complete order details for customer service & reporting
-- JOINs: 4 (Orders → Customers, Order_Items → Products → Categories)
-- Techniques: Multiple INNER JOINs, CONCAT, DATE_FORMAT

SELECT
    o.order_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    c.email AS customer_email,
    c.city AS customer_city,
    DATE_FORMAT(o.order_date, '%d/%m/%Y %H:%i') AS order_datetime,
    o.status AS order_status,
    p.product_name,
    cat.category_name,
    oi.quantity,
    oi.unit_price,
    oi.subtotal,
    o.total_amount AS order_total
FROM Orders o
INNER JOIN Customers c ON o.customer_id = c.customer_id
INNER JOIN Order_Items oi ON o.order_id = oi.order_id
INNER JOIN Products p ON oi.product_id = p.product_id
INNER JOIN Categories cat ON p.category_id = cat.category_id
WHERE o.order_date >= '2024-12-01'
ORDER BY o.order_date DESC, o.order_id, p.product_name;

-- Comments:
-- This is a "master query" that gives a complete view of orders.
-- 4 JOINs connect 5 tables for comprehensive reporting.
-- Useful for customer service, accounting, and business intelligence.
-- The DATE_FORMAT makes the date more readable.

-- ====================================
-- QUERY 6: Products with No Sales
-- ====================================
-- Goal: Identify products that have not been sold
-- JOINs: 1 LEFT JOIN
-- Techniques: LEFT JOIN, IS NULL, Anti-join pattern

SELECT
    p.product_id,
    p.product_name,
    c.category_name,
    p.price,
    p.stock_quantity,
    p.created_date,
    DATEDIFF(CURDATE(), p.created_date) AS days_in_catalog
FROM Products p
INNER JOIN Categories c ON p.category_id = c.category_id
LEFT JOIN Order_Items oi ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL
ORDER BY p.created_date DESC;

-- Comments:
-- We use LEFT JOIN and WHERE IS NULL to find orphan records.
-- These products need attention: possible discount or removal.
-- The days_in_catalog tells us how long they've been available without sales.

-- ====================================
-- VERIFICATION & STATISTICS
-- ====================================
-- Total Database Statistics
-- Goal: Quick overview of key metrics in the e-commerce database
-- Techniques: UNION ALL, Aggregate Functions
SELECT 
    'Total Revenue (Delivered Orders)' AS metric,
    CAST(CONCAT('€', FORMAT(SUM(total_amount), 2)) AS CHAR(50)) AS value
FROM Orders 
WHERE status = 'Delivered'
UNION ALL
SELECT 
    'Average Order Value',
    CAST(CONCAT('€', FORMAT(AVG(total_amount), 2)) AS CHAR(50))
FROM Orders
UNION ALL
SELECT 
    'Total Customers with Orders',
    CAST(COUNT(DISTINCT customer_id) AS CHAR(50))
FROM Orders
UNION ALL
SELECT 
    'Total Products Sold',
    CAST(SUM(quantity) AS CHAR(50))
FROM Order_Items oi
INNER JOIN Orders o ON oi.order_id = o.order_id
WHERE o.status = 'Delivered'
UNION ALL
SELECT 
    'Average Rating',
    CAST(ROUND(AVG(rating), 2) AS CHAR(50))
FROM Reviews;
