CREATE TABLE medical (
    Medical_Id VARCHAR(20) PRIMARY KEY,
    Start_date DATE,
    End_date DATE,
    Description VARCHAR(100),
    Reg_no VARCHAR(20),
    Tech_id VARCHAR(20),
    FOREIGN KEY (Reg_no) REFERENCES student(Reg_no) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Tech_id) REFERENCES teach_officer(Tech_id) ON DELETE CASCADE ON UPDATE CASCADE
);
