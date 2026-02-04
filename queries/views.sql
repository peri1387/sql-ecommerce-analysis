-- ====================================
-- E-COMMERCE DATABASE - VIEWS (Προβολές)
-- ====================================
-- Author: Andrianos Periklis
-- Date: January 2026
-- DBMS: MySQL
-- ====================================

USE ecommerce_db;

-- ====================================
-- VIEW 1: Sales Manager Dashboard
-- ====================================
-- User: Sales Manager
-- Goal: Orders overview with customer details

CREATE OR REPLACE VIEW vw_sales_manager_dashboard AS
SELECT 
    o.order_id,
    DATE_FORMAT(o.order_date, '%d/%m/%Y') AS order_date,
    o.status,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    c.email,
    c.city,
    o.total_amount,
    DATEDIFF(CURDATE(), o.order_date) AS days_since_order
FROM Orders o
INNER JOIN Customers c ON o.customer_id = c.customer_id
ORDER BY o.order_date DESC;

-- How to use:
-- SELECT * FROM vw_sales_manager_dashboard WHERE status = 'Pending';
-- SELECT * FROM vw_sales_manager_dashboard WHERE days_since_order < 7;


-- ====================================
-- VIEW 2: Inventory Manager Dashboard
-- ====================================
-- User: Inventory Manager
-- Goal: Basic inventory status overview

CREATE OR REPLACE VIEW vw_inventory_manager_dashboard AS
SELECT 
    p.product_name,
    c.category_name,
    p.stock_quantity,
    p.price,
    COALESCE(SUM(oi.quantity), 0) AS total_sold,
    
    -- Simple stock status
    CASE 
        WHEN p.stock_quantity = 0 THEN 'OUT OF STOCK'
        WHEN p.stock_quantity < 10 THEN 'CRITICAL'
        WHEN p.stock_quantity < 20 THEN 'LOW'
        ELSE 'OK'
    END AS stock_status
    
FROM Products p
INNER JOIN Categories c ON p.category_id = c.category_id
LEFT JOIN Order_Items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name, c.category_name, p.stock_quantity, p.price
ORDER BY p.stock_quantity ASC;

-- How to use:
-- SELECT * FROM vw_inventory_manager_dashboard WHERE stock_status = 'CRITICAL';
-- SELECT * FROM vw_inventory_manager_dashboard WHERE stock_quantity < 15;


-- ====================================
-- VIEW 3: Customer Service Dashboard
-- ====================================
-- User: Customer Service
-- Goal: Basic customer information

CREATE OR REPLACE VIEW vw_customer_service_dashboard AS
SELECT 
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    c.email,
    c.phone,
    c.city,
    COUNT(o.order_id) AS total_orders,
    COALESCE(SUM(o.total_amount), 0) AS total_spent,
    MAX(o.order_date) AS last_order_date,
    
    -- Customer tier
    CASE 
        WHEN COALESCE(SUM(o.total_amount), 0) >= 1500 THEN 'VIP'
        WHEN COALESCE(SUM(o.total_amount), 0) >= 800 THEN 'Gold'
        WHEN COALESCE(SUM(o.total_amount), 0) >= 400 THEN 'Silver'
        ELSE 'Regular'
    END AS customer_tier
    
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name, c.email, c.phone, c.city
ORDER BY total_spent DESC;

-- How to use:
-- SELECT * FROM vw_customer_service_dashboard WHERE email = 'customer@email.gr';
-- SELECT * FROM vw_customer_service_dashboard WHERE customer_tier = 'VIP';


-- ====================================
-- VIEW 4: Marketing Manager Dashboard
-- ====================================
-- User: Marketing Manager
-- Goal: Basic product analysis

CREATE OR REPLACE VIEW vw_marketing_manager_dashboard AS
SELECT 
    p.product_name,
    c.category_name,
    p.price,
    COUNT(DISTINCT oi.order_id) AS times_ordered,
    COALESCE(SUM(oi.quantity), 0) AS units_sold,
    COALESCE(ROUND(SUM(oi.subtotal), 2), 0) AS total_revenue,
    
    -- Reviews
    (SELECT COUNT(*) FROM Reviews r WHERE r.product_id = p.product_id) AS review_count,
    (SELECT ROUND(AVG(rating), 1) FROM Reviews r WHERE r.product_id = p.product_id) AS avg_rating,
    
    -- Simple performance category
    CASE 
        WHEN COALESCE(SUM(oi.subtotal), 0) >= 2000 THEN 'Top Seller'
        WHEN COALESCE(SUM(oi.subtotal), 0) >= 500 THEN 'Good'
        ELSE 'Low Sales'
    END AS performance
    
FROM Products p
INNER JOIN Categories c ON p.category_id = c.category_id
LEFT JOIN Order_Items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name, c.category_name, p.price
ORDER BY total_revenue DESC;

-- How to use:
-- SELECT * FROM vw_marketing_manager_dashboard WHERE performance = 'Top Seller';
-- SELECT * FROM vw_marketing_manager_dashboard WHERE avg_rating >= 4.5;


-- ====================================
-- VIEW 5: Finance Manager Dashboard
-- ====================================
-- User: Finance Manager
-- Goal: Basic financial overview

CREATE OR REPLACE VIEW vw_finance_manager_dashboard AS
SELECT 
    DATE_FORMAT(o.order_date, '%Y-%m') AS month,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_revenue,
    ROUND(AVG(o.total_amount), 2) AS avg_order_value,
    
    -- Revenue by status
    SUM(CASE WHEN o.status = 'Delivered' THEN o.total_amount ELSE 0 END) AS delivered_revenue,
    SUM(CASE WHEN o.status = 'Pending' THEN o.total_amount ELSE 0 END) AS pending_revenue
    
FROM Orders o
GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
ORDER BY month DESC;

-- How to use:
-- SELECT * FROM vw_finance_manager_dashboard WHERE month LIKE '2024%';
-- SELECT SUM(total_revenue) FROM vw_finance_manager_dashboard WHERE month >= '2024-01';
-- ====================================
