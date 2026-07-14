-- Exercise 1
SELECT
    customer_name, country
FROM customers;


-- Exercise 2
SELECT DISTINCT country
FROM customers;


-- Exercise 3
SELECT *
FROM products
LIMIT 3;


-- Exercise 4
SELECT 
    product_name AS product,
    unit_price AS price
FROM products;


-- Exercise 5
SELECT 
    product_name,
    unit_price
FROM products
ORDER BY unit_price DESC;


-- Exercise 6
SELECT 
    product_name 
FROM products
WHERE is_active = 1;