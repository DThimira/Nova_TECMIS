CREATE TABLE STUDENT (
    NIC VARCHAR(20) PRIMARY KEY,
    Reg_no VARCHAR(20) NOT NULL UNIQUE,
    First_name VARCHAR(50) NOT NULL,
    Last_name VARCHAR(50) NOT NULL,
    States VARCHAR(20),
    Dep_ID INT,
    Course_code VARCHAR(10),
    Attendance INT,
    Marks_ID INT,
    Medical_ID INT
);

-- Inserting 10 Active Students for 2022
INSERT INTO STUDENT (NIC, Reg_no, First_name, Last_name, States, Dep_ID, Course_code, Attendance, Marks_ID, Medical_ID) VALUES
('200212345701', 'TG/2022/001', 'Kamal', 'Perera', 'Active', 1, 'ICT101', 85, NULL, NULL),
('200112345702', 'TG/2022/002', 'Nimali', 'Silva', 'Active', 1, 'ICT102', 90, NULL, NULL),
('200012345703', 'TG/2022/003', 'Amara', 'Fernando', 'Active', 1, 'ICT103', 95, NULL, NULL),
('199912345704', 'TG/2022/004', 'Saman', 'Jayawardena', 'Active', 1, 'ICT104', 75, NULL, NULL),
('199812345705', 'TG/2022/005', 'Ruwan', 'De Silva', 'Active', 1, 'ICT105', 80, NULL, NULL),
('199712345706', 'TG/2022/006', 'Chathura', 'Kumara', 'Active', 1, 'ICT106', 88, NULL, NULL),
('199612345707', 'TG/2022/007', 'Dilani', 'Senanayake', 'Active', 1, 'ICT107', 78, NULL, NULL),
('199512345708', 'TG/2022/008', 'Ishani', 'Fernando', 'Active', 1, 'ICT108', 83, NULL, NULL),
('199412345709', 'TG/2022/009', 'Sanjeewa', 'Perera', 'Active', 1, 'ICT109', 72, NULL, NULL),
('199312345710', 'TG/2022/010', 'Kasuni', 'Jayasinghe', 'Active', 1, 'ICT110', 91, NULL, NULL);

-- Inserting 5 Repeat Students for 2020 and 2021
INSERT INTO STUDENT (NIC, Reg_no, First_name, Last_name, States, Dep_ID, Course_code, Attendance, Marks_ID, Medical_ID) VALUES
('199812345711', 'TG/2020/001', 'Sunil', 'Weerasinghe', 'Repeat', 1, 'ICT101', 60, NULL, NULL),
('199912345712', 'TG/2020/002', 'Anusha', 'Ratnayake', 'Repeat', 1, 'ICT102', 50, NULL, NULL),
('200112345713', 'TG/2021/001', 'Vishan', 'Perera', 'Repeat', 1, 'ICT103', 55, NULL, NULL),
('200212345714', 'TG/2021/002', 'Chathura', 'Fernando', 'Repeat', 1, 'ICT104', 45, NULL, NULL),
('199912345715', 'TG/2021/003', 'Nisha', 'Senanayake', 'Repeat', 1, 'ICT105', 52, NULL, NULL);