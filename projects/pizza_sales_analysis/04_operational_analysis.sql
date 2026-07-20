/*
Project: Pizza Sales Analysis

Objective:
Analyze sales patterns over time to identify busy periods,
revenue trends, and operational demand patterns.
*/


-- =========================================================
-- 1. MONTHLY PERFORMANCE
-- =========================================================

-- Task 1:
-- Find the total number of orders for each month.
SELECT
    strftime('%Y-%m', date) AS month,
    COUNT(*) AS total_orders
FROM orders
GROUP BY month;

-- Task 2:
-- Find the total revenue generated in each month.

SELECT
    strftime('%Y-%m', o.date) AS month,
    SUM(od.quantity * p.price) AS total_revenue
FROM orders AS o
INNER JOIN order_details AS od
    ON o.order_id = od.order_id
INNER JOIN pizzas AS p
    ON od.pizza_id = p.pizza_id
GROUP BY month;

-- Task 3:
-- Find the total number of pizzas sold in each month.

SELECT
    strftime('%Y-%m', o.date) AS month,
    SUM(od.quantity) AS pizzas_sold
FROM orders AS o
INNER JOIN order_details AS od
    ON o.order_id = od.order_id
GROUP BY month;


-- =========================================================
-- 2. WEEKDAY PERFORMANCE
-- =========================================================

-- Task 4:
-- Find the total number of orders for each day of the week.

SELECT     
    CASE strftime('%w', date)
        WHEN '0' THEN 'Sunday'
        WHEN '1' THEN 'Monday'
        WHEN '2' THEN 'Tuesday'
        WHEN '3' THEN 'Wednesday'
        WHEN '4' THEN 'Thursday'
        WHEN '5' THEN 'Friday'
        WHEN '6' THEN 'Saturday'
    END AS day_of_week,
    COUNT(*) AS total_orders
FROM orders
GROUP BY strftime('%w', date)
ORDER BY
    CASE day_of_week
        WHEN 'Monday' THEN 1
        WHEN 'Tuesday' THEN 2
        WHEN 'Wednesday' THEN 3
        WHEN 'Thursday' THEN 4
        WHEN 'Friday' THEN 5
        WHEN 'Saturday' THEN 6
        WHEN 'Sunday' THEN 7
    END;


-- Task 5:
-- Find the total revenue generated on each day of the week.

SELECT
    CASE strftime('%w', o.date)
        WHEN '0' THEN 'Sunday'
        WHEN '1' THEN 'Monday'
        WHEN '2' THEN 'Tuesday'
        WHEN '3' THEN 'Wednesday'
        WHEN '4' THEN 'Thursday'
        WHEN '5' THEN 'Friday'
        WHEN '6' THEN 'Saturday'
    END AS day_of_week,
    SUM(od.quantity * p.price) AS total_revenue
FROM orders AS o
INNER JOIN order_details AS od
    ON o.order_id = od.order_id
INNER JOIN pizzas AS p
    ON od.pizza_id = p.pizza_id
GROUP BY strftime('%w', o.date)
ORDER BY
    CASE day_of_week
        WHEN 'Monday' THEN 1
        WHEN 'Tuesday' THEN 2
        WHEN 'Wednesday' THEN 3
        WHEN 'Thursday' THEN 4
        WHEN 'Friday' THEN 5
        WHEN 'Saturday' THEN 6
        WHEN 'Sunday' THEN 7
    END;


-- Task 6:
-- Find the average amount of money spent per order for each day of the week.

SELECT
    CASE weekday_number
        WHEN '0' THEN 'Sunday'
        WHEN '1' THEN 'Monday'
        WHEN '2' THEN 'Tuesday'
        WHEN '3' THEN 'Wednesday'
        WHEN '4' THEN 'Thursday'
        WHEN '5' THEN 'Friday'
        WHEN '6' THEN 'Saturday'
    END AS day_of_week,
    AVG(order_total) AS average_order_value
FROM (
    SELECT
        od.order_id,
        strftime('%w', o.date) AS weekday_number,
        SUM(od.quantity * p.price) AS order_total
    FROM orders AS o
    INNER JOIN order_details AS od
        ON o.order_id = od.order_id
    INNER JOIN pizzas AS p
        ON od.pizza_id = p.pizza_id
    GROUP BY od.order_id
) AS order_totals
GROUP BY weekday_number
ORDER BY
    CASE day_of_week
        WHEN 'Monday' THEN 1
        WHEN 'Tuesday' THEN 2
        WHEN 'Wednesday' THEN 3
        WHEN 'Thursday' THEN 4
        WHEN 'Friday' THEN 5
        WHEN 'Saturday' THEN 6
        WHEN 'Sunday' THEN 7
    END;

-- =========================================================
-- 3. HOURLY PERFORMANCE
-- =========================================================

-- Task 7:
-- Find the total number of orders placed during each hour 
-- of the day across the entire dataset.

SELECT     
    strftime('%H', time) AS hour,
    COUNT(*) AS total_orders
FROM orders
GROUP BY hour
ORDER BY hour;

-- Task 8:
-- Find the total revenue generated during each hour.

SELECT
    strftime('%H', o.time) AS hour,
    SUM(od.quantity * p.price) AS total_revenue
FROM orders AS o
INNER JOIN order_details AS od
    ON o.order_id = od.order_id
INNER JOIN pizzas AS p
    ON od.pizza_id = p.pizza_id
GROUP BY hour
ORDER BY hour;

-- Task 9:
-- Find the average number of pizzas purchased per order during each hour.

SELECT
    strftime('%H', o.time) AS hour,
    AVG(order_quantity) AS average_pizzas_per_order
FROM (
    SELECT
        od.order_id,
        SUM(od.quantity) AS order_quantity
    FROM order_details AS od
    GROUP BY od.order_id
) AS order_quantities
INNER JOIN orders AS o
    ON order_quantities.order_id = o.order_id
GROUP BY hour
ORDER BY hour;



-- =========================================================
-- 4. PEAK DEMAND ANALYSIS
-- =========================================================

-- Task 10:
-- Find the 10 busiest combinations of weekday and hour
-- based on total number of orders.

SELECT     
    CASE strftime('%w', date)
        WHEN '0' THEN 'Sunday'
        WHEN '1' THEN 'Monday'
        WHEN '2' THEN 'Tuesday'
        WHEN '3' THEN 'Wednesday'
        WHEN '4' THEN 'Thursday'
        WHEN '5' THEN 'Friday'
        WHEN '6' THEN 'Saturday'
    END AS day_of_week,
    strftime('%H', time) AS hour,
    COUNT(*) AS total_orders
FROM orders
GROUP BY
    day_of_week,
    hour
ORDER BY total_orders DESC
LIMIT 10;

-- Task 11:
-- Find the 10 weekday-and-hour combinations that generated
-- the most revenue.

SELECT     
    CASE strftime('%w', o.date)
        WHEN '0' THEN 'Sunday'
        WHEN '1' THEN 'Monday'
        WHEN '2' THEN 'Tuesday'
        WHEN '3' THEN 'Wednesday'
        WHEN '4' THEN 'Thursday'
        WHEN '5' THEN 'Friday'
        WHEN '6' THEN 'Saturday'
    END AS day_of_week,
    strftime('%H', o.time) AS hour,
    SUM(od.quantity * p.price) AS total_revenue
FROM orders AS o
INNER JOIN order_details AS od
    ON o.order_id = od.order_id
INNER JOIN pizzas AS p
    ON od.pizza_id = p.pizza_id
GROUP BY
    day_of_week,
    hour
ORDER BY total_revenue DESC
LIMIT 10;

-- Task 12:
-- Among the three busiest hours of the day by total orders,
-- find the total number of pizzas sold for each category.


;

SELECT
    pt.category,
    SUM(od.quantity) AS pizzas_sold
FROM orders AS o
INNER JOIN order_details AS od
    ON o.order_id = od.order_id
INNER JOIN pizzas AS p
    ON od.pizza_id = p.pizza_id
INNER JOIN pizza_types AS pt
    ON p.pizza_type_id = pt.pizza_type_id
WHERE strftime('%H', o.time) IN (
    SELECT
        strftime('%H', o.time) AS hour
    FROM orders AS o
    GROUP BY hour
    ORDER BY COUNT(*) DESC
    LIMIT 3
)
GROUP BY pt.category
ORDER BY pizzas_sold DESC;


