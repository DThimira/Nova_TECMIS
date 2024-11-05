CREATE TABLE tec_officer_contact (
    Tech_id INT,
    Contact_number VARCHAR(15),
    FOREIGN KEY (Tech_id) REFERENCES tec_officer(Tech_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);




INSERT INTO tec_officer_contact (Tech_id, contact_number) 
VALUES
    (100, '+94 77 123 4567'),
    (100, '+94 77 987 6543'),
    (101, '+94 71 234 5678'),
    (101, '+94 71 876 5432'),
    (102, '+94 72 345 6789'),
    (103, '+94 72 654 3210'),
    (104, '+94 76 456 7890'),
    (104, '+94 76 123 4567'),
    (105, '+94 75 098 7654');
