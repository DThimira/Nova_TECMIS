CREATE TABLE medical (
    Medical_Id VARCHAR(20) PRIMARY KEY,
    Start_date DATE,
    End_date DATE,
    Description VARCHAR(100),
    Reg_no VARCHAR(20),
    Tech_id INT,
    FOREIGN KEY (Reg_no) REFERENCES student(Reg_no) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE,
    FOREIGN KEY (Tech_id) REFERENCES tec_officer(Tech_id) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);



INSERT INTO medical (Medical_id, Start_date, End_date, Description, Reg_no, Tech_id) VALUES
('M001', '2024-09-05', '2024-09-10', 'Flu and fever', 'TG/2022/001', '104'),
('M002', '2024-08-15', '2024-08-20', 'Fractured arm', 'TG/2022/002', '100'),
('M003', '2024-10-01', '2024-10-07', 'Chickenpox', 'TG/2020/002', '102'),
('M004', '2024-09-10', '2024-09-13', 'Migraine', 'TG/2022/004', '103'),
('M005', '2024-11-01', '2024-11-05', 'Allergic reaction', 'TG/2022/005', '105'),
('M006', '2024-09-23', '2024-10-04', 'Dengue fever', 'TG/2022/004', '100'),
('M007', '2024-09-16', '2024-09-18', 'Severe cold', 'TG/2022/002', '101'),
('M008', '2024-08-23', '2024-08-28', 'Back pain', 'TG/2022/008', '102'),
('M009', '2024-09-10', '2024-09-12', 'Food poisoning', 'TG/2021/001', '105'),
('M010', '2024-10-15', '2024-10-18', 'Typhoid fever', 'TG/2022/010', '104');