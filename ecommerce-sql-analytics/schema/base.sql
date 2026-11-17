CREATE DATABASE sales_analysis;

USE sales_analysis;
SELECT count(*) FROM ecommerce_sales;
SELECT * FROM ecommerce_sales LIMIT 10;
DESCRIBE ecommerce_sales;

SELECT 
    order_id,
    COUNT(*) AS duplicate_count
FROM ecommerce_sales
GROUP BY order_id
HAVING COUNT(*) > 1;

SELECT
    COUNT(*) AS total_records,
    SUM(order_id IS NULL) AS missing_order_id,
    SUM(order_date IS NULL) AS missing_order_date,
    SUM(customer_id IS NULL) AS missing_customer_id,
    SUM(product_category IS NULL) AS missing_category,
    SUM(region IS NULL) AS missing_region,
    SUM(quantity IS NULL) AS missing_quantity,
    SUM(unit_price IS NULL) AS missing_price,
    SUM(discount IS NULL) AS missing_discount,
    SUM(payment_method IS NULL) AS missing_payment,
    SUM(delivery_days IS NULL) AS missing_delivery,
    SUM(customer_rating IS NULL) AS missing_rating,
    SUM(revenue IS NULL) AS missing_revenue
FROM ecommerce_sales;

SELECT
    MIN(order_date) AS first_order,
    MAX(order_date) AS last_order,
    SUM(revenue) AS total_revenue,
    AVG(revenue) AS average_revenue,
    MIN(revenue) AS minimum_revenue,
    MAX(revenue) AS maximum_revenue
FROM ecommerce_sales;