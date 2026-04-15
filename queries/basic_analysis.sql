-- Basic SQL queries for e-commerce analysis

-- =====================================
-- Basic SQL Analysis Queries
-- =====================================

-- 1. Total orders per customer
-- Purpose: Shows how many orders each customer has placed.
-- Skills: JOIN, COUNT, GROUP BY, ORDER BY
SELECT c.id, c.name, COUNT(o.id) AS total_orders
FROM customers c
JOIN orders o ON o.customer_id = c.id
GROUP BY c.id, c.name
ORDER BY total_orders DESC;

-- 2. Total spending per customer
-- Purpose: Calculates the total amount spent by each customer.
-- Skills: JOIN, SUM, GROUP BY, ORDER BY
SELECT c.id, c.name, SUM(o.amount) AS total_spent
FROM customers c
JOIN orders o ON o.customer_id = c.id
GROUP BY c.id, c.name
ORDER BY total_spent DESC;

-- 3. Customers with more than 1 order
-- Purpose: Identifies repeat customers.
-- Skills: JOIN, COUNT, GROUP BY, HAVING
SELECT c.id, c.name, COUNT(o.id) AS total_orders
FROM customers c
JOIN orders o ON o.customer_id = c.id
GROUP BY c.id, c.name
HAVING COUNT(o.id) > 1
ORDER BY total_orders DESC;

-- 4. Customers who bought expensive products
-- Purpose: Finds customers who purchased products with a price greater than 100.
-- Skills: DISTINCT, multiple JOINs, WHERE
SELECT DISTINCT c.id, c.name
FROM customers c
JOIN orders o ON o.customer_id = c.id
JOIN order_items oi ON oi.order_id = o.id
JOIN products p ON p.id = oi.product_id
WHERE p.price > 100;

-- 5. Customers with no orders
-- Purpose: Finds inactive customers with no purchase history.
-- Skills: LEFT JOIN, NULL filtering
SELECT c.id, c.name
FROM customers c
LEFT JOIN orders o ON o.customer_id = c.id
WHERE o.id IS NULL;
