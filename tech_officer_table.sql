CREATE TABLE COURSE (
    Course_code VARCHAR(20),
    C_name VARCHAR(100),
    Credit CHAR(6),
    Course_hours CHAR(4),
    theory BOOLEAN,
    practical BOOLEAN,
    department VARCHAR(20),
    Lecturer_id VARCHAR(20),
    PRIMARY KEY (Course_code)
);
 
INSERT INTO COURSE (Course_code, C_name, Credit, Course_hours, theory, practical,department, Lecturer_id)
VALUES 
    ('ICT1242', 'Computer Architecture', 2, 30, TRUE, FALSE, 'ICT', 'L002'), 
    ('ICT1253', 'Computer Networks', 3, 30, TRUE, TRUE, 'ICT', 'L003'),
    ('ICT1212', 'Database Management Systems', 2, 30, TRUE, FALSE, 'ICT', 'L004'),
    ('ICT1222', 'Database Management Systems Practicum', 2, 30, TRUE, FALSE, 'ICT', 'L004'),
    ('TMS1233', 'Discrete Mathematics', 3, 30, TRUE, FALSE, 'ICT', 'L005'),
    ('ICT1233', 'Server-Side Web Development', 3, 30, TRUE, TRUE, 'ICT', 'L001'),
    ('ENG1212', 'English', 3, 30, TRUE, FALSE, 'MS', 'L006'),
    ('TCS1222', 'Fundamentals Of Management', 3, 30, TRUE, FALSE, 'MS', 'L008');