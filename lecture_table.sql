
CREATE TABLE lecture (
    Lecture_id VARCHAR(20) PRIMARY KEY,
    F_name VARCHAR(50),
    L_name VARCHAR(50),
    Department VARCHAR(50),
    Address VARCHAR(50),
    Email VARCHAR(50),
    Position VARCHAR(50),
    Gender VARCHAR(20),
    Age INT
);







INSERT INTO lecture (Lecture_id, F_name, L_name, Department, Address, Email, Position, Gender, Age) VALUES
('L001', 'Amila', 'Wickramarathna', 'ET', '123 Galle Road, Colombo', 'amila.wikr@example.com', 'Senior Lecturer', 'Male', 45),
('L002', 'Navodi', 'Somathilaka', 'BST', '456 Bandaranaike Mawatha, Kandy', 'navodi.soma@example.com', 'Assistant Professor', 'Female', 38),
('L003', 'Ranil', 'Kelaniya', 'IT', '789 Mahaweli Street, Nuwara Eliya', 'ranil.kelaniya@example.com', 'Professor', 'Male', 50),
('L004', 'Charitha', 'Devapriya', 'ET', '321 Ratnapura Road, Galle', 'charitha.deva@example.com', 'Lecturer', 'Female', 34),
('L005', 'Dinusha', 'Jayasinghe', 'BST', '654 Ratmalana Road, Colombo', 'dinusha.jaya@example.com', 'Senior Lecturer', 'Female', 40),
('L006', 'Aruna', 'Peiris', 'IT', '987 Western Highway, Negombo', 'aruna.peiris@example.com', 'Associate Professor', 'Male', 47),
('L007', 'Shihan', 'Samarawira', 'ET', '159 Parakramabahu Mawatha, Kalutara', 'shihan.sam@example.com', 'Lecturer', 'Male', 30),
('L008', 'Sachini', 'Welgama', 'BST', '753 Kelaniya Road, Colombo', 'sachini.welgama@example.com', 'Professor', 'Female', 55),
('L009', 'Indika', 'Pathiraja', 'IT', '951 Kurunegala Road, Kurunegala', 'indika.pati@example.com', 'Assistant Lecturer', 'Male', 33),
('L010', 'Lahiru', 'Hevawitharana', 'ET', '852 Waskaduwa Road, Moratuwa', 'lahiru.hewa@example.com', 'Lecturer', 'Male', 42),
('L011', 'Malith', 'Kumarasinghe', 'BST', '753 Pannipitiya Road, Maharagama', 'malith.kuma@example.com', 'Senior Lecturer', 'Male', 41);
