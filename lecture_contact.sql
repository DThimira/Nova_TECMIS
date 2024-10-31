CREATE TABLE lecture_contact
(
Lecture_id VARCHAR(20),
Contact_number INT(10),

FOREIGN KEY(Lecture_id) REFERENCES lecture(Lecture_id) ON DELETE CASCADE ON UPDATE CASCADE

);

