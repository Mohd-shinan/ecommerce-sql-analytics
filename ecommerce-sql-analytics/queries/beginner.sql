CREATE DATABASE sales_analysis;
USE sales_analysis;
DESCRIBE ecommerce_sales;
#Display all sales records-- 
SELECT *FROM ecommerce_sales;

#Display selected columns
SELECT
    order_id,
    customer_id,
    product_category,
    revenue
FROM ecommerce_sales;

#Find sales from a specific region
SELECT * FROM ecommerce_sales WHERE region = 'South';

#Find orders with revenue greater than ₹1,000
SELECT * FROM ecommerce_sales WHERE revenue > 1000;

#Management wants to know which payment methods customers use.
SELECT DISTINCT payment_method FROM ecommerce_sales;

#Display the 10 highest-revenue orders
SELECT * FROM ecommerce_sales ORDER BY revenue DESC LIMIT 10;

#dentify all orders where revenue is greater than ₹2,000.
SELECT
    order_id,
    customer_id,
    product_category,
    revenue
FROM ecommerce_sales WHERE revenue > 2000 ORDER BY revenue DESC;

#Find orders from the North region where revenue exceeds ₹2,000.
SELECT
    order_id,
    customer_id,
    region,
    revenue
FROM ecommerce_sales WHERE region = 'North' AND revenue > 2000;

#Management wants to analyze Electronics, Clothing and Home sales.
SELECT
    order_id,
    product_category,
    quantity,
    revenue
FROM ecommerce_sales
WHERE product_category IN (
    'Electronics',
    'Clothing',
    'Home'
);
