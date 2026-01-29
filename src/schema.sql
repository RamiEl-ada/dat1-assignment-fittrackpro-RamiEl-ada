.open fittrackpro.db
.mode column

DROP TABLE IF EXISTS locations;
DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS staff;
DROP TABLE IF EXISTS equipment;
DROP TABLE IF EXISTS classes;
DROP TABLE IF EXISTS class_schedule;
DROP TABLE IF EXISTS memberships;
DROP TABLE IF EXISTS attendance;
DROP TABLE IF EXISTS class_attendance;
DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS personal_training_sessions;
DROP TABLE IF EXISTS member_health_metrics;
DROP TABLE IF EXISTS equipment_maintenance_log;

CREATE TABLE locations(
    location_id INT PRIMARY KEY NOT NULL,
    name VARCHAR(30),
    address VARCHAR(60),
    phone_number CHAR(12) NOT NULL,
    email VARCHAR(325) NOT NULL
        CHECK (email LIKE '%@fittrackpro.com%'),
    opening_hours CHAR(11) NOT NULL
);

CREATE TABLE members (
    member_id INT PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(50),
    email VARCHAR(325),
    phone_number CHAR(12),
    date_of_birth DATE,
    join_date DATE,
    emergency_contact_name VARCHAR(120), 
    emergency_contact_phone CHAR(12)
);

CREATE TABLE staff (
    staff_id INT PRIMARY KEY NOT NULL,
    first_name VARCHAR(30),
    last_name VARCHAR(50),
    email VARCHAR(325) NOT NULL
        CHECK (email LIKE '%@fittrackpro.com%'),
    phone_number CHAR(12) NOT NULL,
    position VARCHAR(100) NOT NULL,
    hire_date DATE NOT NULL,
    location_id INT NOT NULL,
    FOREIGN KEY(location_id) REFERENCES locations(location_id)
);

CREATE TABLE equipment (
    equipment_id INT PRIMARY KEY NOT NULL,
    name VARCHAR(300) NOT NULL,
    type VARCHAR(50) NOT NULL,
    purchase_date DATE NOT NULL,
    last_maintenance_date DATE NOT NULL,
    next_maintenance_date DATE NOT NULL,
    location_id INT NOT NULL,
    FOREIGN KEY(location_id) REFERENCES locations(location_id)
);

CREATE TABLE classes (
    class_id INT PRIMARY KEY,
    name VARCHAR(300),
    description VARCHAR(300),
    capacity INT,
    duration INT,
    location_id INT,
    FOREIGN KEY(location_id) REFERENCES locations(location_id)
);

CREATE TABLE class_schedule (
    schedule_id INT PRIMARY KEY NOT NULL,
    class_id INT NOT NULL,
    staff_id INT NOT NULL,
    start_time DATETIME,
    end_time DATETIME,
    FOREIGN KEY(class_id) REFERENCES classes(class_id),
    FOREIGN KEY(staff_id) REFERENCES staff(staff_id)
);

CREATE TABLE memberships (
    membership_id INT PRIMARY KEY,
    member_id INT,
    type VARCHAR(20),
    start_date DATE,
    end_date DATE,
    status VARCHAR(8),
    FOREIGN KEY(member_id) REFERENCES members(member_id)
);

CREATE TABLE attendance (
    attendance_id INT PRIMARY KEY,
    member_id INT,
    location_id INT,
    check_in_time DATETIME,
    check_out_time DATETIME,
    FOREIGN KEY(member_id) REFERENCES members(member_id),
    FOREIGN KEY(location_id) REFERENCES locations(location_id)
);

CREATE TABLE class_attendance (
    class_attendance_id INT PRIMARY KEY,
    schedule_id INT,
    member_id INT,
    attendance_status VARCHAR(25),
    FOREIGN KEY(schedule_id) REFERENCES class_schedule(schedule_id),
    FOREIGN KEY(member_id) REFERENCES members(member_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    member_id INT,
    amount FLOAT,
    payment_date DATETIME,
    payment_method VARCHAR(25),
    payment_type VARCHAR(40),
    FOREIGN KEY(member_id) REFERENCES members(member_id)
);

CREATE TABLE personal_training_sessions (
    session_id INT PRIMARY KEY,
    member_id INT,
    staff_id INT,
    session_date DATE,
    start_time TIME,
    end_time TIME,
    notes VARCHAR(400),
    FOREIGN KEY(member_id) REFERENCES members(member_id)
);

CREATE TABLE member_health_metrics (
    metric_id INT PRIMARY KEY,
    member_id INT,
    measurement_date DATE,
    weight FLOAT,
    body_fat_percentage FLOAT,
    muscle_mass FLOAT,
    bmi FLOAT,
    FOREIGN KEY(member_id) REFERENCES members(member_id)
);

CREATE TABLE equipment_maintenance_log (
    log_id INT PRIMARY KEY,
    equipment_id INT,
    maintenance_date DATE,
    description VARCHAR(400),
    staff_id INT,
    FOREIGN KEY(staff_id) REFERENCES staff(staff_id),
    FOREIGN KEY(equipment_id) REFERENCES staff(staff_id)
);