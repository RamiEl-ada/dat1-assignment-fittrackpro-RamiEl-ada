.open fittrackpro.db
.mode column

-- 6.1 
INSERT INTO attendance(member_id,location_id,check_in_time)
VALUES(7, 1, '2025-02-14 16:30:00');
-- 6.2 
SELECT 
    STRFTIME('%Y-%m-%d', check_in_time) as visit_date,
    check_in_time,
    check_out_time
FROM attendance;

-- 6.3 
SELECT
CASE strftime('%w', check_in_time)
    WHEN '0' THEN 'Sunday'
    WHEN '1' THEN 'Monday'
    WHEN '2' THEN 'Tuesday'
    WHEN '3' THEN 'Wednesday'
    WHEN '4' THEN 'Thursday'
    WHEN '5' THEN 'Friday'
    WHEN '6' THEN 'Saturday'
    END as day_of_week,
    COUNT(member_id) AS visit_count
FROM attendance
GROUP BY day_of_week
ORDER BY visit_count DESC
LIMIT 1;

-- 6.4 

