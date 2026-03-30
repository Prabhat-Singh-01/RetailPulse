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