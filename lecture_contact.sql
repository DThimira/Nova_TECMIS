CREATE TABLE lecture_contact (
    Lecture_id VARCHAR(20),
    Contact_number VARCHAR(15),
    FOREIGN KEY (Lecture_id) REFERENCES lecture(Lecture_id) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);



INSERT INTO lecture_contact (Lecture_id, Contact_number) VALUES
('L001', '+94771234567'),
('L001', '+94712345678'),
('L002', '+94781234567'),
('L003', '+94791234567'),
('L004', '+94761234567'),
('L005', '+94771234568'),
('L006', '+94781234568'),
('L007', '+94791234568'),
('L007', '+94791230568'),
('L008', '+94761234569'),
('L009', '+94771234569'),
('L010', '+94781234569');
