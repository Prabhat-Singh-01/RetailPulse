-- Q15. Most Popular Payment Methods
SELECT 
    payment_type,
    COUNT(*) AS total_transactions,
    ROUND(SUM(payment_value)::numeric, 2) AS total_value
FROM order_payments
GROUP BY payment_type
ORDER BY total_transactions DESC;