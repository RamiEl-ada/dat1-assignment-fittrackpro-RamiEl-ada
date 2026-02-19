.open fittrackpro.db
.mode column

-- 2.1 
INSERT INTO payments(member_id, amount, payment_date, payment_method, payment_type)
VALUES (11, 50.00, DATETIME('now'), 'Credit Card', 'Monthly membership fee');

-- 2.2 
SELECT
    STRFTIME('%Y-%m', payment_date) as month,
    SUM(amount) as total_revenue
FROM payments
WHERE payment_type = 'Monthly membership fee'
GROUP BY STRFTIME('%Y-%m', payment_date)
HAVING month > '2024-10' 
    and month < '2025-03';

-- 2.3 
SELECT
    payment_id,
    amount,
    payment_date,
    payment_method
FROM payments
WHERE payment_type = 'Day pass';

