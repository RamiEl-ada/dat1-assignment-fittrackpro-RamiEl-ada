.open fittrackpro.db
.mode column

-- 5.1 
SELECT 
    ms.member_id,
    m.first_name,
    m.last_name,
    ms.type as membership_type,
    m.join_date
FROM memberships as ms
LEFT JOIN members as m
ON ms.member_id = m.member_id
WHERE ms.status = 'Active';

-- 5.2 
SELECT 
    ms.type as membership_type,
    ROUND(AVG((JULIANDAY(a.check_out_time) - JULIANDAY(a.check_in_time))* 24 * 60),2) as avg_visit_duration_minutes
FROM memberships as ms
INNER JOIN attendance as a
ON ms.member_id = a.member_id
GROUP BY membership_type;

-- 5.3 
SELECT
    m.member_id,
    m.first_name,
    m.last_name,
    m.email,
    ms.end_date
FROM members as m
INNER JOIN memberships as ms
ON m.member_id and ms.member_id
WHERE ms.end_date BETWEEN '2025-01-01' AND '2025-12-31'
GROUP BY m.member_id
