CREATE TABLE medical (
    Medical_Id VARCHAR(20) PRIMARY KEY,
    Start_date DATE,
    End_date DATE,
    Description VARCHAR(100),
    Reg_no VARCHAR(20),
    Tech_id VARCHAR(20),
    FOREIGN KEY (Reg_no) REFERENCES student(Reg_no) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE,
    FOREIGN KEY (Tech_id) REFERENCES teach_officer(Tech_id) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);




INSERT INTO medical (Medical_Id, Start_date, End_date, Description, Reg_no, Tech_id) VALUES
('M001', '2023-01-05', '2023-01-10', 'Flu and fever', 'TG/2022/1001', 'TO001'),
('M002', '2023-02-15', '2023-02-20', 'Fractured arm', 'TG/2022/1002', 'TO002'),
('M003', '2023-03-01', '2023-03-07', 'Chickenpox', 'TG/2022/1003', 'TO003'),
('M004', '2023-04-10', '2023-04-14', 'Migraine', 'TG/2022/1004', 'TO004'),
('M005', '2023-05-20', '2023-05-25', 'Allergic reaction', 'TG/2022/1005', 'TO005'),
('M006', '2023-06-01', '2023-06-05', 'Dengue fever', 'TG/2022/1006', 'TO006'),
('M007', '2023-07-15', '2023-07-18', 'Severe cold', 'TG/2022/1007', 'TO007'),
('M008', '2023-08-05', '2023-08-10', 'Back pain', 'TG/2022/1008', 'TO008'),
('M009', '2023-09-10', '2023-09-12', 'Food poisoning', 'TG/2022/1009', 'TO009'),
('M010', '2023-10-15', '2023-10-20', 'Typhoid fever', 'TG/2022/1010', 'TO010');
