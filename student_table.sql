CREATE TABLE student (
    Reg_no VARCHAR(20) NOT NULL UNIQUE,
    First_name VARCHAR(50) NOT NULL,
    Last_name VARCHAR(50) NOT NULL,
    Department VARCHAR(109),
    Address VARCHAR(100),
    Email VARCHAR(100),
    Dob DATE,
    Status ENUM('Proper', 'Repeat', 'Suspended') NOT NULL DEFAULT 'Proper', -- Added Status column
    PRIMARY KEY (Reg_no)
);

INSERT INTO student(Reg_no, First_name, Last_name, Department, Address, Email, Dob, Status) VALUES
('TG/2022/001', 'Kamal', 'Perera', 'ICT', 'No. 12, Main Street, Colombo 07', 'k.perera001@gmail.com', '2002-01-15', 'Proper'),
('TG/2022/002', 'Nimali', 'Silva', 'ICT', 'No. 45, Galle Road, Galle', 'n.silva002@gmail.com', '2002-02-20', 'Proper'),
('TG/2022/003', 'Amara', 'Fernando', 'ICT', 'No. 23, Kandy Road, Kandy', 'a.fernando003@gmail.com', '2002-03-10', 'Proper'),
('TG/2022/004', 'Saman', 'Jayawardena', 'ICT', 'No. 78, Station Road, Kurunegala', 's.jayawardena004@gmail.com', '2002-04-25', 'Proper'),
('TG/2022/005', 'Ruwan', 'De Silva', 'ICT', 'No. 5, Peradeniya Road, Peradeniya', 'r.desilva005@gmail.com', '2002-05-30', 'Proper'),
('TG/2022/006', 'Chathura', 'Kumara', 'ICT', 'No. 90, Main Street, Negombo', 'c.kumara006@gmail.com', '2002-06-15', 'Proper'),
('TG/2022/007', 'Dilani', 'Senanayake', 'ICT', 'No. 3, Galle Face, Colombo 03', 'd.senanayake007@gmail.com', '2002-07-20', 'Proper'),
('TG/2022/008', 'Ishani', 'Fernando', 'ICT', 'No. 77, Church Street, Jaffna', 'i.fernando008@gmail.com', '2002-08-05', 'Proper'),
('TG/2022/009', 'Sanjeewa', 'Perera', 'ICT', 'No. 40, Hill Street, Matara', 's.perera009@gmail.com', '2002-09-12', 'Proper'),
('TG/2022/010', 'Kasuni', 'Jayasinghe', 'ICT', 'No. 15, Old Road, Batticaloa', 'k.jayasinghe010@gmail.com', '2002-10-30', 'Proper'),

('TG/2020/001', 'Sunil', 'Weerasinghe', 'ICT', 'No. 56, New Road, Anuradhapura', 's.weerasinghe001@gmail.com', '2000-03-15', 'Repeat'),
('TG/2020/002', 'Anusha', 'Ratnayake', 'ICT', 'No. 21, Main Street, Badulla', 'a.ratnayake002@gmail.com', '2000-02-20', 'Repeat'),
('TG/2021/001', 'Vishan', 'Perera', 'ICT', 'No. 34, Lake Road, Trincomalee', 'v.perera001@gmail.com', '2001-03-10', 'Repeat'),
('TG/2021/002', 'Chathura', 'Fernando', 'ICT', 'No. 67, Cross Street, Nuwara Eliya', 'c.fernando002@gmail.com', '2001-04-25', 'Repeat'),
('TG/2021/003', 'Nisha', 'Senanayake', 'ICT', 'No. 89, Hilltop, Ratnapura', 'n.senanayake003@gmail.com', '2001-05-30', 'Repeat'),

('TG/2022/011', 'Anil', 'Kumar', 'ICT', 'No. 21, 1st Lane, Colombo 04', 'anil.kumar011@gmail.com', '2002-04-12', 'Suspended'),
('TG/2022/012', 'Kavindi', 'Perera', 'ICT', 'No. 45, Galle Road, Colombo 07', 'k.perera012@gmail.com', '2002-05-15', 'Suspended');

