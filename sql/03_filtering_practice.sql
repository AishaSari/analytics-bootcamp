-- 1
SELECT *
FROM products
WHERE unit_price > 1000;

-- 2
SELECT *
FROM products
WHERE unit_price BETWEEN 500 AND 2000;

-- 3
SELECT *
FROM customers
WHERE country = 'Taiwan';

-- 4
SELECT *
FROM customers
WHERE country IN ('Taiwan', 'Japan');

-- 5
SELECT *
FROM customers
WHERE country <> 'Taiwan';

-- 6
SELECT *
FROM products
WHERE category = 'Office';

-- 7
SELECT *
FROM products
WHERE category IN ('Office', 'Electronics');

-- 8
SELECT *
FROM products
WHERE product_name LIKE '%Laptop%';

-- 9
SELECT *
FROM products
WHERE product_name LIKE 'Wireless%';

-- 10
SELECT *
FROM customers
WHERE email IS NULL;

-- 11
SELECT *
FROM orders
WHERE shipped_date IS NULL;

-- 12
SELECT *
FROM products
WHERE category = 'Electronics'
  AND unit_price > 1000;

-- 13
SELECT *
FROM products
WHERE category = 'Office'
   OR unit_price < 100;

-- 14
SELECT *
FROM customers
WHERE NOT country = 'Japan';

-- 15
SELECT *
FROM products
WHERE product_name LIKE '%Pro%';

-- 16
SELECT *
FROM products
WHERE product_name LIKE '%Mouse%';

-- 17
SELECT *
FROM orders
WHERE order_date BETWEEN '2024-01-01' AND '2024-03-31';

-- 18
SELECT *
FROM customers
WHERE country IN ('Taiwan', 'Japan', 'South Korea');

-- 19
SELECT *
FROM products
WHERE category <> 'Office';

-- 20
SELECT *
FROM products
WHERE is_active = 1
  AND unit_price <= 1000;