.open fittrackpro.db
.mode column

-- 4.1 
SELECT
    cs.class_id,
    c.name as class_name,
    CONCAT(s.first_name, ' ', s.last_name) as instructor_name
FROM staff as s
LEFT JOIN class_schedule as cs
ON s.staff_id = cs.staff_id
INNER JOIN classes as c
ON c.class_id = cs.class_id
GROUP BY c.class_id;

-- 4.2 
SELECT
    cs.class_id,
    c.name,
    cs.start_time,
    cs.end_time,
    c.capacity - COUNT(ca.member_id) as available_spots
FROM classes as c
INNER JOIN class_schedule as cs
ON c.class_id= cs.class_id
LEFT JOIN class_attendance as ca
ON ca.schedule_id = cs.schedule_id
WHERE cs.start_time > '2025-02-01'
    AND cs.end_time <'2025-02-02'
GROUP BY cs.schedule_id;
-- 4.3 
INSERT INTO class_attendance(schedule_id, member_id, attendance_status)
VALUES(1, 11, 'Registered');

-- 4.4 
DELETE FROM class_schedule
WHERE schedule_id = 7
AND member_id = 3;

-- 4.5 
SELECT 
    c.class_id,
    c.name as class_name,
    COUNT(ca.attendance_status) as registration_count
FROM classes as c
INNER JOIN class_schedule as cs
ON c.class_id = cs.class_id
INNER JOIN class_attendance as ca
ON cs.schedule_id = ca.schedule_id
GROUP BY name
ORDER BY registration_count DESC;

-- 4.6 
SELECT AVG(class_total) as member_per_class
FROM
(   SELECT
        member_id,
        COUNT(member_id) as class_total
    FROM class_attendance
    GROUP BY member_id
);
