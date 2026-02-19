.open fittrackpro.db
.mode column

-- 8.1 
SELECT
    pts.session_id,
    CONCAT(m.first_name, ' ', m.last_name) as member_name,
    pts.session_date,
    pts.start_time
FROM personal_training_sessions as pts
INNER JOIN members as m
ON pts.member_id = m.member_id
WHERE pts.staff_id = 2;