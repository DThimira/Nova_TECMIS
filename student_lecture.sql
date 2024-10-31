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