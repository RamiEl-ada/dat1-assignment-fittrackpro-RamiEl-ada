.open fittrackpro.db
.mode column

-- 1.1
SELECT 
    member_id,
    first_name,
    last_name,
    email,
    join_date
FROM members;

-- 1.2
UPDATE members
SET email = 'emily.jones.updated@email.com', 
    phone_number = '07000 100005'
WHERE member_id = 5;

-- 1.3
SELECT COUNT(DISTINCT(member_id)) as member_count
FROM members;

-- 1.4
SELECT 
    m.member_id,
    m.first_name,
    m.last_name,
    COUNT(ca.attendance_status) as registration_count
FROM members as m
INNER JOIN class_attendance as ca
    ON m.member_id = ca.member_id
GROUP BY 
    m.member_id
ORDER BY 
    registration_count DESC
LIMIT 1;

-- 1.5
SELECT 
    m.member_id,
    m.first_name,
    m.last_name,
    COUNT(ca.attendance_status) as registration_count
FROM members as m
INNER JOIN class_attendance as ca
    ON m.member_id = ca.member_id
GROUP BY 
    m.member_id
ORDER BY 
    registration_count ASC
LIMIT 1;

-- 1.6
SELECT 
    COUNT(DISTINCT(attendance_status)) as Count
FROM class_attendance 
WHERE attendance_status = 'Attended'
HAVING Count <= 2;
