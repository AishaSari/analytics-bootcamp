-- Challenge 1
SELECT 
    product_id,
    product_name
FROM products
WHERE is_active = 1
ORDER BY unit_price DESC;

-- Challenge 2
SELECT
    customer_name,
    country
FROM customers
ORDER BY country, customer_name;


-- Challenge 3
SELECT
    product_id,
    product_name,
    unit_price
FROM products
WHERE unit_price > 1000;


-- Challenge 4
SELECT
    customer_name,
    country
FROM customers
WHERE country = "Taiwan";


-- Challenge 5
SELECT 
    product_id,
    product_name 
FROM products
WHERE is_active = 0;


/* 
I chose product_id in certain challenges even if it wasn't required because I think it makes it easy to identify the product.
I wasn't sure if I should have renamed the columns or not.
After checking the solutions, I realized that I should have written SELECT DISTINCT country in Challenge 2 instead of just SELECT.
Another thing I learned is to use single quotes for string values in SQL. I used double quotes in Challenge 4, but it still worked.
Lastly, I should have included unit price in Challenge 1.
And also sort everything just to make it look nice and organized.
*/