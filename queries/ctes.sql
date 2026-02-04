-- ====================================
-- E-COMMERCE DATABASE - CTEs (Common Table Expressions)
-- ====================================
-- Author: Andrianos Periklis
-- Date: January 2026
-- DBMS: MySQL
-- ====================================

USE ecommerce_db;

-- ====================================
-- CTE 1: Monthly Sales Report με Trends & Growth Analysis
-- ====================================
-- Goal: Sales performance by month with growth metrics
-- Business Value: Identify seasonal patterns, forecast future sales
-- Complexity: Multiple CTEs, Window Functions, Percentage Calculations

WITH MonthlySales AS (
    -- Step 1: Aggregate sales data by month
    SELECT 
        DATE_FORMAT(o.order_date, '%Y-%m') AS sales_month,
        YEAR(o.order_date) AS year,
        MONTH(o.order_date) AS month,
        COUNT(DISTINCT o.order_id) AS total_orders,
        COUNT(DISTINCT o.customer_id) AS unique_customers,
        SUM(oi.subtotal) AS total_revenue,
        ROUND(AVG(o.total_amount), 2) AS avg_order_value,
        SUM(oi.quantity) AS total_items_sold
    FROM Orders o
    INNER JOIN Order_Items oi ON o.order_id = oi.order_id
    WHERE o.status IN ('Delivered', 'Shipped')
    GROUP BY sales_month, year, month
),
SalesWithGrowth AS (
    -- Step 2: Calculate month-over-month growth using LAG()
    SELECT 
        sales_month,
        total_orders,
        unique_customers,
        total_revenue,
        avg_order_value,
        total_items_sold,
        LAG(total_revenue) OVER (ORDER BY sales_month) AS prev_month_revenue,
        LAG(total_orders) OVER (ORDER BY sales_month) AS prev_month_orders
    FROM MonthlySales
)
-- Step 3: Final results with growth percentages
SELECT 
    sales_month,
    total_orders,
    unique_customers,
    CONCAT('€', FORMAT(total_revenue, 2)) AS total_revenue,
    CONCAT('€', FORMAT(avg_order_value, 2)) AS avg_order_value,
    total_items_sold,
    CASE 
        WHEN prev_month_revenue IS NULL THEN 'N/A'
        ELSE CONCAT(
            ROUND(((total_revenue - prev_month_revenue) / prev_month_revenue * 100), 2), 
            '%'
        )
    END AS revenue_growth,
    CASE 
        WHEN prev_month_orders IS NULL THEN 'N/A'
        ELSE CONCAT(
            ROUND(((total_orders - prev_month_orders) / prev_month_orders * 100), 2), 
            '%'
        )
    END AS orders_growth
FROM SalesWithGrowth
ORDER BY sales_month;

-- Comments:
-- - LAG() window function gives previous month's values for growth calculation
-- - Calculates revenue and orders growth percentages
-- - Useful for: Identifying seasonal trends, forecasting, performance tracking

-- ====================================
-- CTE 2: Customer Analysis & Segmentation
-- ====================================
-- Goal: Customer segmentation based on purchase history
-- Business Value: Targeted marketing, VIP identification
-- Complexity: Simple aggregation with customer tiers
WITH CustomerStats AS (
    -- Step 1: Aggregate customer data
    SELECT 
        c.customer_id,
        CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
        c.email,
        c.city,
        COUNT(o.order_id) AS total_orders,
        COALESCE(SUM(o.total_amount), 0) AS total_spent,
        COALESCE(ROUND(AVG(o.total_amount), 2), 0) AS avg_order_value,
        MAX(o.order_date) AS last_order_date
    FROM Customers c
    LEFT JOIN Orders o ON c.customer_id = o.customer_id 
        AND o.status IN ('Delivered', 'Shipped')
    GROUP BY c.customer_id, c.first_name, c.last_name, c.email, c.city
)
-- Step 2: Customer Tier Classification
SELECT 
    customer_name,
    email,
    city,
    total_orders,
    CONCAT('€', FORMAT(total_spent, 2)) AS total_spent,
    CONCAT('€', FORMAT(avg_order_value, 2)) AS avg_order_value,
    
    -- Customer Tier
    CASE 
        WHEN total_spent >= 1500 THEN 'VIP'
        WHEN total_spent >= 800 THEN 'Gold'
        WHEN total_spent >= 400 THEN 'Silver'
        WHEN total_spent > 0 THEN 'Bronze'
        ELSE 'New Customer'
    END AS customer_tier,
    
    -- Activity Status
    CASE 
        WHEN last_order_date IS NULL THEN 'Never Ordered'
        WHEN DATEDIFF(CURDATE(), last_order_date) <= 30 THEN 'Active'
        WHEN DATEDIFF(CURDATE(), last_order_date) <= 90 THEN 'At Risk'
        ELSE 'Inactive'
    END AS activity_status,
    
    -- Last Order
    CASE 
        WHEN last_order_date IS NULL THEN 'Never'
        ELSE DATE_FORMAT(last_order_date, '%d/%m/%Y')
    END AS last_order_date
    
FROM CustomerStats
ORDER BY total_spent DESC;

-- Comments:
-- - Simple customer tier classification based on total spent
-- - Customer Tiers: VIP, Gold, Silver, Bronze
-- - Activity Status: Active, At Risk, Inactive
-- - Useful for: Targeted campaigns, VIP programs, retention

-- ====================================
-- CTE 3: Simple Inventory Check
-- ====================================
-- Goal: Monitor stock levels and identify low stock items
-- Business Value: Prevent stockouts, simple reorder alerts
-- Complexity: Basic stock analysis

WITH InventoryStatus AS (
    -- Simple stock check based on sales
    SELECT 
        p.product_name,
        c.category_name,
        p.stock_quantity AS current_stock,
        p.price,
        COUNT(DISTINCT oi.order_id) AS times_sold,
        COALESCE(SUM(oi.quantity), 0) AS total_units_sold,
        
        -- Stock Status
        CASE 
            WHEN p.stock_quantity = 0 THEN 'OUT OF STOCK'
            WHEN p.stock_quantity < 10 THEN 'CRITICAL'
            WHEN p.stock_quantity < 20 THEN 'LOW'
            WHEN p.stock_quantity < 30 THEN 'MODERATE'
            ELSE 'SUFFICIENT'
        END AS stock_status,
        
        -- Suggested Reorder Quantity
        CASE 
            WHEN p.stock_quantity < 20 THEN 30 - p.stock_quantity
            ELSE 0
        END AS suggested_reorder_qty
        
    FROM Products p
    INNER JOIN Categories c ON p.category_id = c.category_id
    LEFT JOIN Order_Items oi ON p.product_id = oi.product_id
    LEFT JOIN Orders o ON oi.order_id = o.order_id 
        AND o.status IN ('Delivered', 'Shipped')
    GROUP BY p.product_id, p.product_name, c.category_name, 
             p.stock_quantity, p.price
)
-- Results
SELECT 
    product_name,
    category_name,
    current_stock,
    stock_status,
    times_sold,
    total_units_sold,
    suggested_reorder_qty,
    CONCAT('€', FORMAT(price * suggested_reorder_qty, 2)) AS estimated_cost
FROM InventoryStatus
ORDER BY 
    FIELD(stock_status, 'OUT OF STOCK', 'CRITICAL', 'LOW', 'MODERATE', 'SUFFICIENT'),
    current_stock ASC;

-- Comments:
-- - Simple stock check: if stock < 10 → CRITICAL, < 20 → LOW
-- - Suggested reorder: we reorder up to 30 units
-- - No sales velocity - simple logic based on thresholds
-- - Useful for: Daily stock checks, quick reorder decisions

-- ====================================
-- CTE 4: Supplier Performance & Profit Margin Analysis
-- ====================================
-- Goal: Analyze suppliers based on profit margins and sales performance
-- Business Value: Negotiate better prices, identify best suppliers
-- Complexity: Join 5 tables, calculate margins, supplier scoring

WITH SupplierProductMetrics AS (
    -- Step 1: Metrics per product-supplier combination
    SELECT 
        s.supplier_id,
        s.supplier_name,
        s.country,
        p.product_id,
        p.product_name,
        c.category_name,
        ps.supply_price,
        p.price AS selling_price,
        (p.price - ps.supply_price) AS profit_per_unit,
        ROUND(((p.price - ps.supply_price) / p.price * 100), 2) AS profit_margin_pct,
        COALESCE(SUM(oi.quantity), 0) AS units_sold,
        COALESCE(SUM(oi.subtotal), 0) AS revenue_generated,
        COALESCE(SUM(oi.quantity) * ps.supply_price, 0) AS cost_of_goods_sold
    FROM Suppliers s
    INNER JOIN Product_Suppliers ps ON s.supplier_id = ps.supplier_id
    INNER JOIN Products p ON ps.product_id = p.product_id
    INNER JOIN Categories c ON p.category_id = c.category_id
    LEFT JOIN Order_Items oi ON p.product_id = oi.product_id
    LEFT JOIN Orders o ON oi.order_id = o.order_id AND o.status IN ('Delivered', 'Shipped')
    GROUP BY s.supplier_id, s.supplier_name, s.country, p.product_id, p.product_name, 
             c.category_name, ps.supply_price, p.price
),
SupplierSummary AS (
    -- Step 2: Aggregated metrics per supplier
    SELECT 
        supplier_id,
        supplier_name,
        country,
        COUNT(DISTINCT product_id) AS products_supplied,
        SUM(units_sold) AS total_units_sold,
        ROUND(SUM(revenue_generated), 2) AS total_revenue,
        ROUND(SUM(cost_of_goods_sold), 2) AS total_cogs,
        ROUND(SUM(revenue_generated - cost_of_goods_sold), 2) AS total_gross_profit,
        ROUND(AVG(profit_margin_pct), 2) AS avg_profit_margin_pct,
        ROUND(MIN(profit_margin_pct), 2) AS min_profit_margin_pct,
        ROUND(MAX(profit_margin_pct), 2) AS max_profit_margin_pct
    FROM SupplierProductMetrics
    GROUP BY supplier_id, supplier_name, country
),
SupplierRanking AS (
    -- Step 3: Ranking suppliers
    SELECT 
        *,
        RANK() OVER (ORDER BY total_gross_profit DESC) AS profit_rank,
        RANK() OVER (ORDER BY avg_profit_margin_pct DESC) AS margin_rank,
        RANK() OVER (ORDER BY total_units_sold DESC) AS volume_rank,
        -- Overall score (lower is better)
        (RANK() OVER (ORDER BY total_gross_profit DESC) +
         RANK() OVER (ORDER BY avg_profit_margin_pct DESC) +
         RANK() OVER (ORDER BY total_units_sold DESC)) / 3.0 AS overall_score
    FROM SupplierSummary
    WHERE total_units_sold > 0  -- Μόνο προμηθευτές με πωλήσεις
)
-- Step 4: Final ranked report
SELECT 
    RANK() OVER (ORDER BY overall_score) AS overall_rank,
    supplier_name,
    country,
    products_supplied,
    total_units_sold,
    CONCAT('€', FORMAT(total_revenue, 2)) AS total_revenue,
    CONCAT('€', FORMAT(total_cogs, 2)) AS total_cogs,
    CONCAT('€', FORMAT(total_gross_profit, 2)) AS total_gross_profit,
    CONCAT(avg_profit_margin_pct, '%') AS avg_profit_margin,
    profit_rank,
    margin_rank,
    volume_rank,
    CASE 
        WHEN overall_score <= 2 THEN 'A+ (Strategic Partner)'
        WHEN overall_score <= 4 THEN 'A (Preferred)'
        WHEN overall_score <= 6 THEN 'B (Good)'
        ELSE 'C (Review)'
    END AS supplier_grade
FROM SupplierRanking
ORDER BY overall_rank;

-- Comments:
-- - Calculates profit margins per supplier-product
-- - 3 ranking criteria: Profit, Margin %, Volume
-- - Overall score for total ranking
-- - Supplier grading: A+, A, B, C
-- - Useful for: Supplier negotiations, sourcing decisions, cost optimization


-- ====================================
-- CTE 5: Frequently Bought Together
-- ====================================
-- Goal: Find products that are bought together in the same orders
-- Business Value: Cross-selling suggestions, bundle offers
-- Complexity: Simple self-join for product pairs

WITH ProductPairs AS (
    -- Step 1: Find product pairs in the same orders
    SELECT 
        p1.product_name AS product_1,
        p2.product_name AS product_2,
        COUNT(DISTINCT oi1.order_id) AS times_bought_together,
        ROUND(AVG(p1.price + p2.price), 2) AS combined_price
    FROM Order_Items oi1
    INNER JOIN Order_Items oi2 
        ON oi1.order_id = oi2.order_id 
        AND oi1.product_id < oi2.product_id  -- Αποφυγή duplicates
    INNER JOIN Products p1 ON oi1.product_id = p1.product_id
    INNER JOIN Products p2 ON oi2.product_id = p2.product_id
    INNER JOIN Orders o ON oi1.order_id = o.order_id
    WHERE o.status IN ('Delivered', 'Shipped')
    GROUP BY p1.product_name, p2.product_name
    HAVING times_bought_together >= 2  -- Τουλάχιστον 2 φορές μαζί
)
-- Step 2: Final results with recommendations
SELECT 
    product_1,
    product_2,
    times_bought_together,
    CONCAT('€', FORMAT(combined_price, 2)) AS bundle_price,
    CONCAT('€', FORMAT(combined_price * 0.90, 2)) AS discounted_price_10off,
    CASE 
        WHEN times_bought_together >= 5 THEN 'Strong Association'
        WHEN times_bought_together >= 3 THEN 'Good Pair'
        ELSE 'Occasional Pair'
    END AS recommendation_type
FROM ProductPairs
ORDER BY times_bought_together DESC
LIMIT 15;

-- Comments:
-- - Simple pattern: which 2 products appear together in orders
-- - Self-join on the same table (Order_Items) to find pairs
-- - Useful for: "Frequently bought together", bundle suggestions
-- - Practical example: Laptop + Mouse, Headphones + Speaker

-- ====================================
-- SUMMARY STATISTICS for all CTEs
-- ====================================

-- Quick summary for verification
SELECT 'CTE Analysis Summary' AS info;

SELECT 
    'Total Monthly Records' AS metric,
    CAST(COUNT(DISTINCT DATE_FORMAT(order_date, '%Y-%m')) AS CHAR(50)) AS value
FROM Orders
UNION ALL
SELECT 
    'Customer Segments',
    CAST(COUNT(DISTINCT 
        CASE 
            WHEN total >= 1500 THEN 'VIP'
            WHEN total >= 800 THEN 'Gold'
            WHEN total >= 400 THEN 'Silver'
            ELSE 'Bronze'
        END
    ) AS CHAR(50))
FROM (
    SELECT customer_id, SUM(total_amount) AS total
    FROM Orders
    WHERE status IN ('Delivered', 'Shipped')
    GROUP BY customer_id
) AS customer_totals
UNION ALL
SELECT 
    'Products Needing Reorder',
    CAST(COUNT(*) AS CHAR(50))
FROM Products
WHERE stock_quantity < 20
UNION ALL
SELECT 
    'Active Suppliers',
    CAST(COUNT(DISTINCT supplier_id) AS CHAR(50))
FROM Product_Suppliers;
