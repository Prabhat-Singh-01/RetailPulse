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