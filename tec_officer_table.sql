CREATE TABLE tec_officer (
    Tech_id INT PRIMARY KEY,
    F_name VARCHAR(50),
    L_name VARCHAR(50),
    Gender CHAR(1) CHECK (Gender IN ('M', 'F')),
    email VARCHAR(100),
    Address VARCHAR(200)
    
);
INSERT INTO tec_officer (Tech_id, F_name, L_name, Gender, email, Address) 
VALUES
    (100, 'Anushka', 'Perera', 'F', 'anushka.perera@gamil.lk', '12 Galle Rd, Colombo'),
    (101, 'Kamal', 'Fernando', 'M', 'kamal.fernando@gmail.lk', '45 Kandy Rd, Kandy'),
    (103, 'Nimali', 'Jayasinghe', 'F', 'nimali.jayasinghe@gmail.lk', '78 Negombo St, Negombo'),
    (104, 'Pradeep', 'Kumar', 'M', 'pradeep.kumar@gmail.lk', '33 Matara Rd, Matara'),
    (105, 'Saman', 'Gunaratne', 'M', 'saman.gunaratne@gmail.lk', '56 Jaffna Rd, Jaffna');