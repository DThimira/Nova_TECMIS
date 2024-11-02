-- Create table student

CREATE TABLE student (
    Reg_no VARCHAR(20) NOT NULL UNIQUE,
    First_name VARCHAR(50) NOT NULL,
    Last_name VARCHAR(50) NOT NULL,
    States VARCHAR(20),
    Department VARCHAR(109),
    Address VARCHAR(100),
    Email VARCHAR(100),
    Dob DATE,
	PRIMARY KEY (Reg_no)
);
-- Inserting Students

INSERT INTO student(Reg_no, First_name, Last_name, States, Department, Address, Email, Dob) VALUES
('TG/2022/001', 'Kamal', 'Perera', 'Active', 'ICT', 'No. 12, Main Street, Colombo 07', 'k.perera001@gmail.com', '2002-01-15'),
('TG/2022/002', 'Nimali', 'Silva', 'Active', 'ICT', 'No. 45, Galle Road, Galle', 'n.silva002@gmail.com', '2002-02-20'),
('TG/2022/003', 'Amara', 'Fernando', 'Active', 'ICT', 'No. 23, Kandy Road, Kandy', 'a.fernando003@gmail.com', '2002-03-10'),
('TG/2022/004', 'Saman', 'Jayawardena', 'Active', 'ICT', 'No. 78, Station Road, Kurunegala', 's.jayawardena004@gmail.com', '2002-04-25'),
('TG/2022/005', 'Ruwan', 'De Silva', 'Active', 'ICT', 'No. 5, Peradeniya Road, Peradeniya', 'r.desilva005@gmail.com', '2002-05-30'),
('TG/2022/006', 'Chathura', 'Kumara', 'Active', 'ICT', 'No. 90, Main Street, Negombo', 'c.kumara006@gmail.com', '2002-06-15'),
('TG/2022/007', 'Dilani', 'Senanayake', 'Active', 'ICT', 'No. 3, Galle Face, Colombo 03', 'd.senanayake007@gmail.com', '2002-07-20'),
('TG/2022/008', 'Ishani', 'Fernando', 'Active', 'ICT', 'No. 77, Church Street, Jaffna', 'i.fernando008@gmail.com', '2002-08-05'),
('TG/2022/009', 'Sanjeewa', 'Perera', 'Active', 'ICT', 'No. 40, Hill Street, Matara', 's.perera009@gmail.com', '2002-09-12'),
('TG/2022/010', 'Kasuni', 'Jayasinghe', 'Active', 'ICT', 'No. 15, Old Road, Batticaloa', 'k.jayasinghe010@gmail.com', '2002-10-30'),
('TG/2020/001', 'Sunil', 'Weerasinghe', 'Repeat', 'ICT', 'No. 56, New Road, Anuradhapura', 's.weerasinghe001@gmail.com', '2000-03-15'),
('TG/2020/002', 'Anusha', 'Ratnayake', 'Repeat', 'ICT', 'No. 21, Main Street, Badulla', 'a.ratnayake002@gmail.com', '2000-02-20'),
('TG/2021/001', 'Vishan', 'Perera', 'Repeat', 'ICT', 'No. 34, Lake Road, Trincomalee', 'v.perera001@gmail.com', '2001-03-10'),
('TG/2021/002', 'Chathura', 'Fernando', 'Repeat', 'ICT', 'No. 67, Cross Street, Nuwara Eliya', 'c.fernando002@gmail.com', '2001-04-25'),
('TG/2021/003', 'Nisha', 'Senanayake', 'Repeat', 'ICT', 'No. 89, Hilltop, Ratnapura', 'n.senanayake003@gmail.com', '2001-05-30');
