-- Exercise 1
-- Show every product along with its category.
SELECT
    p.product_id,
    p.product_name,
    cat.category_name
FROM products AS p
INNER JOIN categories AS cat
    ON p.category_id = cat.category_id;


-- Exercise 2
-- Show each product's name, category, and price.
-- Sort from the most expensive product to the cheapest.
SELECT
    p.product_name,
    cat.category_name,
    p.unit_price
FROM products AS p
INNER JOIN categories AS cat
    ON p.category_id = cat.category_id
ORDER BY p.unit_price DESC;


-- Exercise 3
-- Show every order with the customer's name,
-- order date, and order status.
-- Display the newest orders first.
SELECT
    o.order_id,
    cust.customer_name,
    o.order_date,
    o.status
FROM orders AS o
INNER JOIN customers AS cust
    ON o.customer_id = cust.customer_id
ORDER BY o.order_date DESC;


-- Exercise 4
-- Show all shipped orders along with
-- the customer who placed them.
SELECT
    cust.customer_name,
    o.order_id,
    o.shipped_date
FROM orders AS o
INNER JOIN customers AS cust
    ON o.customer_id = cust.customer_id
WHERE o.shipped_date IS NOT NULL;


-- Exercise 5
-- Show every product that has been ordered.
-- Display:
-- - order_item_id
-- - product_name
-- - quantity
-- - unit_price
SELECT
    oi.order_item_id,
    p.product_name,
    oi.quantity,
    oi.unit_price
FROM order_items AS oi
INNER JOIN products AS p
    ON oi.product_id = p.product_id;


-- Exercise 6
-- Generate an order details report.
-- Display:
-- - order_id
-- - customer_name
-- - product_name
-- - quantity
SELECT
    o.order_id,
    cust.customer_name,
    p.product_name,
    oi.quantity
FROM products AS p
INNER JOIN order_items AS oi
    ON p.product_id = oi.product_id
INNER JOIN orders AS o
    ON oi.order_id = o.order_id
INNER JOIN customers AS cust
    ON o.customer_id = cust.customer_id;


-- Exercise 7
-- Calculate the total value of each ordered product.
-- Display:
-- - order_id
-- - product_name
-- - quantity
-- - unit_price
-- - total_price
SELECT
    o.order_id,
    p.product_name,
    oi.quantity,
    oi.unit_price,
    oi.quantity * oi.unit_price AS total_price
FROM products AS p
INNER JOIN order_items AS oi
    ON p.product_id = oi.product_id
INNER JOIN orders AS o
    ON oi.order_id = o.order_id
ORDER BY total_price DESC;


-- Exercise 8
-- Count how many products belong to each category.
-- Sort from the category with the most products
-- to the category with the fewest.
SELECT
    cat.category_name,
    COUNT(*) AS product_count
FROM categories AS cat
INNER JOIN products AS p
    ON cat.category_id = p.category_id
GROUP BY
    cat.category_id,
    cat.category_name
ORDER BY product_count DESC;


-- Exercise 9
-- Count how many orders each customer has placed.
-- Sort from the customer with the most orders
-- to the customer with the fewest.
SELECT
    cust.customer_name,
    COUNT(*) AS order_count
FROM customers AS cust
INNER JOIN orders AS o
    ON cust.customer_id = o.customer_id
GROUP BY
    cust.customer_id,
    cust.customer_name
ORDER BY order_count DESC;


-- Challenge 1
-- Find the top 5 best-selling products
-- based on total quantity sold.
SELECT
    p.product_name,
    SUM(oi.quantity) AS total_quantity_sold
FROM products AS p
INNER JOIN order_items AS oi
    ON p.product_id = oi.product_id
GROUP BY
    p.product_id,
    p.product_name
ORDER BY total_quantity_sold DESC
LIMIT 5;


-- Challenge 2
-- Generate a sales report.
-- Display:
-- - customer_name
-- - order_date
-- - product_name
-- - quantity
-- - unit_price
-- - total_price
-- - status
-- Sort by customer name, then order date.
SELECT
    cust.customer_name,
    o.order_date,
    p.product_name,
    oi.quantity,
    oi.unit_price,
    oi.unit_price * oi.quantity AS total_price,
    o.status
FROM products AS p
INNER JOIN order_items AS oi
    ON oi.product_id = p.product_id
INNER JOIN orders AS o
    ON oi.order_id = o.order_id
INNER JOIN customers AS cust
    ON o.customer_id = cust.customer_id
ORDER BY
    cust.customer_name,
    o.order_date;