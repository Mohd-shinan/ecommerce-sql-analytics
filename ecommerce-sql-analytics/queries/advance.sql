#Management wants to identify customers whose total spending is higher than the average spending per customer.
SELECT
    customer_id,
    ROUND(SUM(revenue), 2) AS total_spending
FROM ecommerce_sales
GROUP BY customer_id
HAVING SUM(revenue) > (
    SELECT AVG(customer_total)
    FROM (
        SELECT
            customer_id,
            SUM(revenue) AS customer_total
        FROM ecommerce_sales
        GROUP BY customer_id
    ) AS customer_summary
)
ORDER BY total_spending DESC;

#Management wants a separate sales summary for each category.
SELECT
    product_category,
    total_orders,
    total_units,
    ROUND(total_revenue, 2) AS total_revenue
FROM (
    SELECT
        product_category,
        COUNT(order_id) AS total_orders,
        SUM(quantity) AS total_units,
        SUM(revenue) AS total_revenue
    FROM ecommerce_sales
    GROUP BY product_category
) AS category_sales
ORDER BY total_revenue DESC;

#Management wants to identify the five customers who have generated the highest revenue for the business.

SELECT
    customer_id,
    total_orders,
    ROUND(total_spending, 2) AS total_spending
FROM (
    SELECT
        customer_id,
        COUNT(order_id) AS total_orders,
        SUM(revenue) AS total_spending
    FROM ecommerce_sales
    GROUP BY customer_id
) AS customer_sales
ORDER BY total_spending DESC
LIMIT 5;

#Management wants to rank customers from highest to lowest based on their total spending to identify the most valuable customers.

SELECT
    c1.customer_id,
    ROUND(c1.total_spending, 2) AS total_spending,
    (
        SELECT COUNT(DISTINCT c2.total_spending) + 1
        FROM (
            SELECT
                customer_id,
                SUM(revenue) AS total_spending
            FROM ecommerce_sales
            GROUP BY customer_id
        ) AS c2
        WHERE c2.total_spending > c1.total_spending
    ) AS customer_rank
FROM (
    SELECT
        customer_id,
        SUM(revenue) AS total_spending
    FROM ecommerce_sales
    GROUP BY customer_id
) AS c1
ORDER BY customer_rank, c1.customer_id;

DESCRIBE ecommerce_sales;

CREATE OR REPLACE VIEW customer_sales_summary AS
SELECT
    customer_id,
    COUNT(order_id) AS total_orders,
    SUM(quantity) AS total_quantity,
    ROUND(SUM(revenue), 2) AS total_spending,
    ROUND(AVG(revenue), 2) AS average_order_value
FROM ecommerce_sales
GROUP BY customer_id;

SELECT * FROM customer_sales_summary ORDER BY total_spending DESC LIMIT 10;SHOW FULL TABLES WHERE Table_type = 'VIEW';

SHOW FULL TABLES WHERE Table_type = 'VIEW';