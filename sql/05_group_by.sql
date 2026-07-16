-- Warm-up Exercises
-- 1. Count the number of products in each category.
SELECT
    category_id,
    COUNT(*) AS product_count
FROM products
GROUP BY category_id;


-- 2. Find the average product price in each category.
SELECT
    category_id,
    AVG(unit_price) AS average_price
FROM products
GROUP BY category_id;

-- 3. Find the most expensive product price in each category.
SELECT
    category_id,
    MAX(unit_price) as highest_price
FROM products
GROUP BY category_id;

-- 4. Find the cheapest product price in each category.
SELECT
    category_id,
    MIN(unit_price) AS lowest
FROM products
GROUP BY category_id;

-- 5. Count active products in each category.
SELECT
    category_id,
    COUNT(*) AS product_count
FROM products
WHERE is_active = 1
GROUP BY category_id;

-- 6. Find the average price of active products in each category.
SELECT
    category_id,
    AVG(unit_price) AS average_price
FROM products
WHERE is_active = 1
GROUP BY category_id;

-- 7. Find the total value of products in each category.
SELECT
    category_id,
    SUM(unit_price) AS total_price
FROM products
GROUP BY category_id;

-- 8. Show the categories ordered by the number of products, highest first.
SELECT
    category_id,
    COUNT(*) AS product_count
FROM products
GROUP BY category_id
ORDER BY product_count DESC;


-- Intermediate Exercises
-- 9. Count orders by shipped status.
/* 
Expected output idea:
shipped_date	order_count
NULL	           12
2026-01-01	        1 
*/
SELECT 
    shipped_date,
    COUNT(*) AS order_count
FROM orders
GROUP BY shipped_date;

-- 10. Find the average price for active and inactive products separately.
SELECT
    is_active,
    COUNT(*) AS product_count,
    AVG(unit_price) AS average_price
FROM products
GROUP BY is_active;

-- 11. Find the highest price for active and inactive products separately.
SELECT
    is_active,
    COUNT(*) AS product_count,
    MAX(unit_price) AS highest_price
FROM products
GROUP BY is_active;

-- 12. Find the total value of products grouped by active status.
SELECT 
    is_active,
    SUM(unit_price) as total_price
FROM products
GROUP BY is_active;


-- 13. Count products by category, but only active ones.
SELECT
    category_id,
    COUNT(*) AS product_count
FROM products
WHERE is_active = 1
GROUP BY category_id;


-- 14. Find the average price by category, but only for products over $100.
SELECT
    category_id,
    AVG(unit_price) AS average_price
FROM products
WHERE unit_price > 100
GROUP BY category_id;

-- 15. Find the maximum price by category for active products.
SELECT
    category_id,
    MAX(unit_price) AS highest_price
FROM products
WHERE is_active = 1
GROUP BY category_id;

-- 16. Count products by category and sort from largest to smallest.
SELECT
    category_id,
    COUNT(*) AS product_count
FROM products
GROUP BY category_id
ORDER BY product_count DESC;