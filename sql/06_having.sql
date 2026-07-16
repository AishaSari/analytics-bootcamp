-- Exercise 1
-- Find categories that have more than 5 products.
SELECT
    category_id,
    COUNT(*) AS product_count
FROM products
GROUP BY category_id
HAVING COUNT(*) > 5;


-- Exercise 2
-- Find categories where the average product price is greater than 100.
SELECT
    category_id,
    AVG(unit_price) AS average_price
FROM products
GROUP BY category_id
HAVING AVG(unit_price) > 100;


-- Exercise 3
-- Find categories whose most expensive product costs more than 500.
SELECT
    category_id,
    MAX(unit_price) AS highest_price
FROM products
GROUP BY category_id
HAVING highest_price > 500;


-- Exercise 4
-- Find categories whose cheapest product costs less than 20.
SELECT
    category_id,
    MIN(unit_price) AS lowest_price
FROM products
GROUP BY category_id
HAVING lowest_price < 20;


-- Exercise 5
-- Find categories that have at least 3 active products.
SELECT
    category_id,
    COUNT(*) AS active_products
FROM products
WHERE is_active = 1
GROUP BY category_id
HAVING COUNT(*) >= 3;


-- Exercise 6
-- Find categories where the average price of active products is greater than 150.
SELECT
    category_id,
    AVG(unit_price) AS average_price
FROM products
WHERE is_active = 1
GROUP BY category_id
HAVING AVG(unit_price) > 150;


-- Exercise 7
-- Find categories that have more than 2 inactive products.
SELECT
    category_id,
    COUNT(*) AS inactive_products
FROM products
WHERE is_active = 0
GROUP BY category_id
HAVING COUNT(*) > 2;


-- Exercise 8
-- Find categories where the total price of all products exceeds 1000.
SELECT
    category_id,
    SUM(unit_price) AS total_price
FROM products
GROUP BY category_id
HAVING SUM(unit_price) > 1000;



-- Challenge 1
/* 
Find categories with:
• at least 5 active products
• average price above 100
Show:
category_id,
• active_product_count,
• average_price 
*/
SELECT
    category_id,
    COUNT(*) AS active_product_count,
    AVG(unit_price) AS average_price
FROM products
WHERE is_active = 1
GROUP BY category_id
HAVING active_product_count >=5 and average_price > 100;


-- Challenge 2
SELECT
    category_id,
    SUM(unit_price) AS total_price,
    AVG(unit_price) AS average_price
FROM products
GROUP BY category_id
HAVING total_price > 1000 and average_price > 150;