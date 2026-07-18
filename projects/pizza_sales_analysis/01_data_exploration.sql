/*
Project: Pizza Sales Analysis

Objective:
Explore the pizza sales dataset, verify the table structure,
check data quality, and confirm that the table relationships work.
*/


-- =========================================================
-- 1. DATABASE AND TABLE PREVIEW
-- =========================================================

-- Preview all tables in the database.
SELECT
    name
FROM sqlite_master
WHERE type = 'table';


-- Preview the orders table.
SELECT *
FROM orders
LIMIT 10;


-- Preview the order_details table.
SELECT *
FROM order_details
LIMIT 10;


-- Preview the pizzas table.
SELECT *
FROM pizzas
LIMIT 10;


-- Preview the pizza_types table.
SELECT *
FROM pizza_types
LIMIT 10;


-- =========================================================
-- 2. TABLE ROW COUNTS
-- =========================================================

-- Count the total number of orders.
SELECT
    COUNT(*) AS total_orders
FROM orders;


-- Count the total number of order detail records.
SELECT
    COUNT(*) AS total_order_details
FROM order_details;


-- Count the total number of pizza variations.
SELECT
    COUNT(*) AS total_pizzas
FROM pizzas;


-- Count the total number of pizza types.
SELECT
    COUNT(*) AS total_pizza_types
FROM pizza_types;


-- =========================================================
-- 3. BASIC DATA RANGE CHECKS
-- =========================================================

-- Find the earliest and latest order dates.
SELECT
    MIN(date) AS earliest_order_date,
    MAX(date) AS latest_order_date
FROM orders;


-- Find the minimum and maximum pizza prices.
SELECT
    MIN(price) AS lowest_price,
    MAX(price) AS highest_price
FROM pizzas;


-- =========================================================
-- 4. NULL VALUE CHECKS
-- =========================================================

-- Count records with a missing quantity.
SELECT
    COUNT(*) AS null_quantity_count
FROM order_details
WHERE quantity IS NULL;


-- Count records with a missing pizza price.
SELECT
    COUNT(*) AS null_price_count
FROM pizzas
WHERE price IS NULL;


-- Count records with a missing pizza ID.
SELECT
    COUNT(*) AS null_pizza_id_count
FROM order_details
WHERE pizza_id IS NULL;


-- =========================================================
-- 5. RELATIONSHIP CHECKS
-- =========================================================

-- Check the relationship between order_details and pizzas.
SELECT
    od.order_details_id,
    od.order_id,
    od.pizza_id,
    od.quantity,
    p.size,
    p.price
FROM order_details AS od
INNER JOIN pizzas AS p
    ON od.pizza_id = p.pizza_id
LIMIT 20;


-- Check the relationship between pizzas and pizza_types.
SELECT
    p.pizza_id,
    pt.name AS pizza_name,
    pt.category,
    p.size,
    p.price
FROM pizzas AS p
INNER JOIN pizza_types AS pt
    ON p.pizza_type_id = pt.pizza_type_id
LIMIT 20;


-- =========================================================
-- 6. UNMATCHED RECORD CHECKS
-- =========================================================

-- Count order detail records whose pizza_id does not exist in pizzas.
SELECT
    COUNT(*) AS unmatched_pizza_id_count
FROM order_details AS od
LEFT JOIN pizzas AS p
    ON od.pizza_id = p.pizza_id
WHERE p.pizza_id IS NULL;


-- Count pizza records whose pizza_type_id does not exist in pizza_types.
SELECT
    COUNT(*) AS unmatched_pizza_type_id_count
FROM pizzas AS p
LEFT JOIN pizza_types AS pt
    ON p.pizza_type_id = pt.pizza_type_id
WHERE pt.pizza_type_id IS NULL;