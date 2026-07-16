-- Exercise 1
SELECT
    category_id,
    COUNT(*) AS product_count
FROM products
GROUP BY category_id
HAVING COUNT(*) > 5;

-- Exercise 2
SELECT
    category_id,
    AVG(unit_price) AS average_price
FROM products
GROUP BY category_id
HAVING AVG(unit_price) > 100;