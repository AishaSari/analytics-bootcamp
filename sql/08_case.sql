-- Exercise 1
-- Label products as Cheap, Medium, or Expensive.
SELECT
    product_id,
    product_name,
    unit_price,
    CASE
        WHEN unit_price < 500 THEN 'Cheap'
        WHEN unit_price BETWEEN 500 AND 2000 THEN 'Medium'
    ELSE 'Expensive'
END AS price_category
FROM products;

-- Exercise 2
-- Show whether each product is Active or Inactive.
SELECT
    product_id,
    product_name,
    CASE
        WHEN is_active = 1 THEN 'Active'
    ELSE 'Inactive'
END AS activity_status
FROM products;

-- 3
-- Classify customers by total orders:
--- New / Regular / Loyal
SELECT
    customer_id,
    COUNT(*) AS total_orders,
    CASE
        WHEN COUNT(*) = 1 THEN 'New'
        WHEN COUNT(*) BETWEEN 2 AND 4 THEN 'Regular'
    ELSE 'Loyal'
END AS frequency
FROM orders
GROUP BY customer_id;

-- Challenge
-- For each category, show:
-- category name
-- total number of products
-- average product price
---a label of Low Value, Medium Value, or High Value based on the average price
SELECT
    cat.category_id,
    cat.category_name,
    COUNT(*) AS total_products,
    AVG(p.unit_price) AS average_price,
    CASE
        WHEN AVG(p.unit_price) < 500 THEN 'Low Value'
        WHEN AVG(p.unit_price) BETWEEN 500 AND 1500 THEN 'Medium Value'
        ELSE 'High Value'
    END AS value_category
FROM categories AS cat
INNER JOIN products AS p
    ON cat.category_id = p.category_id
GROUP BY 
    cat.category_id;
    cat.category_name;
