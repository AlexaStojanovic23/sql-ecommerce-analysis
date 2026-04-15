-- Advanced SQL queries for e-commerce analysis

-- =====================================
-- Advanced SQL Analysis Queries
-- =====================================

-- 1. Active customers (EXISTS)
-- Purpose: Finds customers who have at least one order.
-- Skills: EXISTS, correlated subquery
SELECT c.id, c.name
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.id
);

-- 2. Inactive customers (NOT EXISTS)
-- Purpose: Finds customers with no orders.
-- Skills: NOT EXISTS, correlated subquery
SELECT c.id, c.name
FROM customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.id
);

-- 3. Products that were never sold
-- Purpose: Identifies products that have never been purchased.
-- Skills: NOT EXISTS, subquery
SELECT p.id, p.name
FROM products p
WHERE NOT EXISTS (
    SELECT 1
    FROM order_items oi
    WHERE oi.product_id = p.id
);

-- 4. Order value categorization (CASE)
-- Purpose: Categorizes orders into value groups.
-- Skills: CASE, GROUP BY, aggregation
SELECT 
    CASE 
        WHEN amount IS NULL THEN 'Unknown'
        WHEN amount < 100 THEN 'Low'
        WHEN amount BETWEEN 100 AND 200 THEN 'Medium'
        ELSE 'High'
    END AS order_category,
    COUNT(*) AS total_orders
FROM orders
GROUP BY 
    CASE 
        WHEN amount IS NULL THEN 'Unknown'
        WHEN amount < 100 THEN 'Low'
        WHEN amount BETWEEN 100 AND 200 THEN 'Medium'
        ELSE 'High'
    END;

-- 5. High-value customers who bought a Laptop
-- Purpose: Finds customers who purchased a specific product and spent more than 300.
-- Skills: EXISTS, multiple JOINs, aggregation, HAVING
SELECT c.id, c.name, SUM(o.amount) AS total_spent
FROM customers c
JOIN orders o ON c.id = o.customer_id
WHERE EXISTS (
    SELECT 1
    FROM orders o2
    JOIN order_items oi ON o2.id = oi.order_id
    JOIN products p ON p.id = oi.product_id
    WHERE o2.customer_id = c.id
      AND p.name = 'Laptop'
)
GROUP BY c.id, c.name
HAVING SUM(o.amount) > 300;
