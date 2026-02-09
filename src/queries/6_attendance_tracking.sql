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
FROM attendance

-- 6.3 


-- 6.4 

