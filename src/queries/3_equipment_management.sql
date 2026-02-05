.open fittrackpro.db
.mode column

-- 3.1 
SELECT 
    equipment_id,
    name,
    next_maintenance_date
FROM equipment
where next_maintenance_date < '2025-01-31'
    and next_maintenance_date >='2025-01-01';

-- 3.2 
SELECT
    type as equipment_type,
    COUNT(name) as count
FROM equipment
GROUP BY type;

-- 3.3 
SELECT
    type as equipment_type,
    ROUND(AVG(JULIANDAY('NOW') - JULIANDAY(purchase_date))) as avg_age_days
FROM equipment
GROUP BY type
