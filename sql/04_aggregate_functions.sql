-- PART A: Basic (1-10)
-- 1
SELECT COUNT(*)
FROM products;

-- 2
SELECT COUNT(*)
FROM customers;

-- 3
SELECT COUNT(*)
FROM orders;

-- 4
SELECT COUNT(*)
FROM products
WHERE is_active = 1;

-- 5
SELECT COUNT(*)
FROM products
WHERE is_active = 0;

-- 6
SELECT COUNT(*)
FROM products
WHERE unit_price > 500;

-- 7
SELECT MAX(unit_price)
FROM products;

-- 8
SELECT MIN(unit_price)
FROM products;

-- 9
SELECT AVG(unit_price)
FROM products;

-- 10
SELECT SUM(unit_price)
FROM products;


-- PART B: Intermediate (11-20)
-- 11
SELECT COUNT(*)
FROM products
WHERE category_id = 1;

-- 12
SELECT COUNT(*)
FROM products
WHERE category_id = 4;

-- 13
SELECT AVG(unit_price)
FROM products
WHERE category_id = 1;

-- 14
SELECT MAX(unit_price)
FROM products
WHERE is_active = 1;

-- 15
SELECT MIN(unit_price)
FROM products
WHERE is_active = 1;

-- 16
SELECT COUNT(*)
FROM orders
WHERE shipped_date IS NULL;

-- 17
SELECT COUNT(*)
FROM orders
WHERE shipped_date IS NOT NULL;

-- 18
SELECT SUM(unit_price)
FROM products
WHERE unit_price > 500;

-- 19
SELECT AVG(unit_price)
FROM products
WHERE is_active = 1;

-- 20
SELECT MAX(unit_price)
FROM products
WHERE is_active = 0;