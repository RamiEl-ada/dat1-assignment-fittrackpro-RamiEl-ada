.open fittrackpro.db
.mode column

-- 7.1 
SELECT
    staff_id,
    first_name,
    last_name,
    position as role
FROM staff;

-- 7.2 
SELECT
    s.staff_id as trainer_id,
    CONCAT(s.first_name, ' ', s.last_name ) as trainer_name,
    COUNT(pts.session_id) as session_count
FROM staff as s
INNER JOIN personal_training_sessions as pts
ON s.staff_id = pts.staff_id
WHERE session_date BETWEEN '2025-01-20' AND '2025-02-19'


