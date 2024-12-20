CREATE TABLE student_course (
    Reg_no VARCHAR(20),
    Course_code VARCHAR(20),
    PRIMARY KEY (Reg_no, Course_code),
    FOREIGN KEY (Reg_no) REFERENCES student(Reg_no),
    FOREIGN KEY (Course_code) REFERENCES COURSE(Course_code)
);





INSERT INTO student_course (Reg_no, Course_code) VALUES 
    ('TG/2022/001', 'ICT1242'),
    ('TG/2022/001', 'ICT1253'),
    ('TG/2022/001', 'ICT1212'),
    ('TG/2022/001', 'ICT1222'),
    ('TG/2022/001', 'TMS1233'),
    ('TG/2022/001', 'ICT1233'),
    ('TG/2022/001', 'ENG1212'),
    ('TG/2022/001', 'TCS1222'),
    ('TG/2022/002', 'ICT1242'),
    ('TG/2022/002', 'ICT1253'),
    ('TG/2022/002', 'ICT1212'),
    ('TG/2022/002', 'ICT1222'),
    ('TG/2022/002', 'TMS1233'),
    ('TG/2022/002', 'ICT1233'),
    ('TG/2022/002', 'ENG1212'),
    ('TG/2022/002', 'TCS1222'),
    ('TG/2022/003', 'ICT1242'),
    ('TG/2022/003', 'ICT1253'),
    ('TG/2022/003', 'ICT1212'),
    ('TG/2022/003', 'ICT1222'),
    ('TG/2022/003', 'TMS1233'),
    ('TG/2022/003', 'ICT1233'),
    ('TG/2022/003', 'ENG1212'),
    ('TG/2022/003', 'TCS1222'),
    ('TG/2022/004', 'ICT1242'),
    ('TG/2022/004', 'ICT1253'),
    ('TG/2022/004', 'ICT1212'),
    ('TG/2022/004', 'ICT1222'),
    ('TG/2022/004', 'TMS1233'),
    ('TG/2022/004', 'ICT1233'),
    ('TG/2022/004', 'ENG1212'),
    ('TG/2022/004', 'TCS1222'),
    ('TG/2022/005', 'ICT1242'),
    ('TG/2022/005', 'ICT1253'),
    ('TG/2022/005', 'ICT1212'),
    ('TG/2022/005', 'ICT1222'),
    ('TG/2022/005', 'TMS1233'),
    ('TG/2022/005', 'ICT1233'),
    ('TG/2022/005', 'ENG1212'),
    ('TG/2022/005', 'TCS1222'),
    ('TG/2022/006', 'ICT1242'),
    ('TG/2022/006', 'ICT1253'),
    ('TG/2022/006', 'ICT1212'),
    ('TG/2022/006', 'ICT1222'),
    ('TG/2022/006', 'TMS1233'),
    ('TG/2022/006', 'ICT1233'),
    ('TG/2022/006', 'ENG1212'),
    ('TG/2022/006', 'TCS1222'),
    ('TG/2022/007', 'ICT1242'),
    ('TG/2022/007', 'ICT1253'),
    ('TG/2022/007', 'ICT1212'),
    ('TG/2022/007', 'ICT1222'),
    ('TG/2022/007', 'TMS1233'),
    ('TG/2022/007', 'ICT1233'),
    ('TG/2022/007', 'ENG1212'),
    ('TG/2022/007', 'TCS1222'),
    ('TG/2022/008', 'ICT1242'),
    ('TG/2022/008', 'ICT1253'),
    ('TG/2022/008', 'ICT1212'),
    ('TG/2022/008', 'ICT1222'),
    ('TG/2022/008', 'TMS1233'),
    ('TG/2022/008', 'ICT1233'),
    ('TG/2022/008', 'ENG1212'),
    ('TG/2022/008', 'TCS1222'),
    ('TG/2022/009', 'ICT1242'),
    ('TG/2022/009', 'ICT1253'),
    ('TG/2022/009', 'ICT1212'),
    ('TG/2022/009', 'ICT1222'),
    ('TG/2022/009', 'TMS1233'),
    ('TG/2022/009', 'ICT1233'),
    ('TG/2022/009', 'ENG1212'),
    ('TG/2022/009', 'TCS1222'),
    ('TG/2022/010', 'ICT1242'),
    ('TG/2022/010', 'ICT1253'),
    ('TG/2022/010', 'ICT1212'),
    ('TG/2022/010', 'ICT1222'),
    ('TG/2022/010', 'TMS1233'),
    ('TG/2022/010', 'ICT1233'),
    ('TG/2022/010', 'ENG1212'),
    ('TG/2022/010', 'TCS1222'),
    ('TG/2020/001', 'ICT1242'),
    ('TG/2020/001', 'ICT1253'),
    ('TG/2020/001', 'ICT1212'),
    ('TG/2020/001', 'ICT1222'),
    ('TG/2020/001', 'TMS1233'),
    ('TG/2020/001', 'ICT1233'),
    ('TG/2020/001', 'ENG1212'),
    ('TG/2020/001', 'TCS1222'),
    ('TG/2020/002', 'ICT1242'),
    ('TG/2020/002', 'ICT1253'),
    ('TG/2020/002', 'ICT1212'),
    ('TG/2020/002', 'ICT1222'),
    ('TG/2020/002', 'TMS1233'),
    ('TG/2020/002', 'ICT1233'),
    ('TG/2020/002', 'ENG1212'),
    ('TG/2020/002', 'TCS1222'),
    ('TG/2021/001', 'ICT1242'),
    ('TG/2021/001', 'ICT1253'),
    ('TG/2021/001', 'ICT1212'),
    ('TG/2021/001', 'ICT1222'),
    ('TG/2021/001', 'TMS1233'),
    ('TG/2021/001', 'ICT1233'),
    ('TG/2021/001', 'ENG1212'),
    ('TG/2021/001', 'TCS1222'),
    ('TG/2021/002', 'ICT1242'),
    ('TG/2021/002', 'ICT1253'),
    ('TG/2021/002', 'ICT1212'),
    ('TG/2021/002', 'ICT1222'),
    ('TG/2021/002', 'TMS1233'),
    ('TG/2021/002', 'ICT1233'),
    ('TG/2021/002', 'ENG1212'),
    ('TG/2021/002', 'TCS1222'),
    ('TG/2021/003', 'ICT1242'),
    ('TG/2021/003', 'ICT1253'),
    ('TG/2021/003', 'ICT1212'),
    ('TG/2021/003', 'ICT1222'),
    ('TG/2021/003', 'TMS1233'),
    ('TG/2021/003', 'ICT1233'),
    ('TG/2021/003', 'ENG1212'),
    ('TG/2021/003', 'TCS1222');
