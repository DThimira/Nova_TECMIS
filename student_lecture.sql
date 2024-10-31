CREATE TABLE student_lecture (
    Reg_no VARCHAR(20),
    Lecture_id VARCHAR(20),
    FOREIGN KEY (Lecture_id) REFERENCES lecture (Lecture_id) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE,
    FOREIGN KEY (Reg_no) REFERENCES student (Reg_no) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);





INSERT INTO student_lecture (Reg_no, Lecture_id) VALUES
('TG/2022/1001', 'L001'),
('TG/2022/1002', 'L002'),
('TG/2022/1003', 'L003'),
('TG/2022/1004', 'L004'),
('TG/2022/1005', 'L005'),
('TG/2022/1006', 'L006'),
('TG/2022/1007', 'L007'),
('TG/2022/1008', 'L008'),
('TG/2022/1009', 'L009'),
('TG/2022/1010', 'L010'),
('TG/2022/1011', 'L011');

