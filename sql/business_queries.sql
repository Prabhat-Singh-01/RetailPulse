--Category 1: Sales Analysis

-- Q1. Total Revenue Generated
SELECT ROUND(SUM(payment_value)::numeric, 2) AS total_revenue
FROM order_payments;

-- Q2. Monthly Revenue Trend
SELECT 
    DATE_TRUNC('month', o.order_purchase_timestamp) AS month,
    ROUND(SUM(op.payment_value)::numeric, 2) AS monthly_revenue
FROM orders o
JOIN order_payments op ON o.order_id = op.order_id
GROUP BY month
ORDER BY month;

-- Q3. Top 10 Revenue Generating Product Categories
SELECT 
    ct.product_category_name_english AS category,
    ROUND(SUM(oi.price)::numeric, 2) AS total_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN category_name_translation ct ON p.product_category_name = ct.product_category_name
GROUP BY category
ORDER BY total_revenue DESC
LIMIT 10;

-- Q4. Total Orders Per Year
SELECT 
    EXTRACT(YEAR FROM order_purchase_timestamp) AS year,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY year
ORDER BY year;


--Category 2: Customer Analysis

-- Q5. Top 10 Cities by Number of Customers
SELECT 
    customer_city,
    COUNT(customer_unique_id) AS total_customers
FROM customers
GROUP BY customer_city
ORDER BY total_customers DESC
LIMIT 10;

-- Q6. Repeat vs New Customers
SELECT 
    CASE 
        WHEN order_count > 1 THEN 'Repeat Customer'
        ELSE 'New Customer'
    END AS customer_type,
    COUNT(*) AS total
FROM (
    SELECT customer_unique_id, COUNT(o.order_id) AS order_count
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    GROUP BY customer_unique_id
) subquery
GROUP BY customer_type;

-- Q7. Average Order Value Per Customer State
SELECT 
    c.customer_state,
    ROUND(AVG(op.payment_value)::numeric, 2) AS avg_order_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_payments op ON o.order_id = op.order_id
GROUP BY c.customer_state
ORDER BY avg_order_value DESC;

-- Category 3: Delivery Analysis


-- Q8. Average Delivery Time (in days)
SELECT 
    ROUND(AVG(EXTRACT(EPOCH FROM (
        order_delivered_customer_date - order_purchase_timestamp
    )) / 86400)::numeric, 2) AS avg_delivery_days
FROM orders
WHERE order_delivered_customer_date IS NOT NULL;

-- Q9. Late Deliveries Count
SELECT 
    COUNT(*) AS late_deliveries
FROM orders
WHERE order_delivered_customer_date > order_estimated_delivery_date;

-- Q10. Top 10 States with Most Late Deliveries
SELECT 
    c.customer_state,
    COUNT(*) AS late_deliveries
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.order_delivered_customer_date > o.order_estimated_delivery_date
GROUP BY c.customer_state
ORDER BY late_deliveries DESC
LIMIT 10;

--Category 4: Review & Seller Analysis

-- Q11. Average Review Score Overall
SELECT 
    ROUND(AVG(review_score)::numeric, 2) AS avg_review_score
FROM order_reviews;

-- Q12. Review Score Distribution
SELECT 
    review_score,
    COUNT(*) AS total_reviews
FROM order_reviews
GROUP BY review_score
ORDER BY review_score;

-- Q13. Correlation — Late Delivery vs Review Score
SELECT 
    CASE 
        WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date 
        THEN 'Late' 
        ELSE 'On Time' 
    END AS delivery_status,
    ROUND(AVG(r.review_score)::numeric, 2) AS avg_review_score
FROM orders o
JOIN order_reviews r ON o.order_id = r.order_id
WHERE o.order_delivered_customer_date IS NOT NULL
GROUP BY delivery_status;

-- Q14. Top 10 Sellers by Revenue
SELECT 
    oi.seller_id,
    s.seller_city,
    ROUND(SUM(oi.price)::numeric, 2) AS total_revenue
FROM order_items oi
JOIN sellers s ON oi.seller_id = s.seller_id
GROUP BY oi.seller_id, s.seller_city
ORDER BY total_revenue DESC
LIMIT 10;

--Category 5: Payment Analysis

-- Q15. Most Popular Payment Methods
SELECT 
    payment_type,
    COUNT(*) AS total_transactions,
    ROUND(SUM(payment_value)::numeric, 2) AS total_value
FROM order_payments
GROUP BY payment_type
ORDER BY total_transactions DESC;
