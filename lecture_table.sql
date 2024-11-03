
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





INSERT INTO lecture (Lecture_id, F_name, L_name, Department, Address, Email, Position, Gender, Age) 
VALUES
('L001', 'Amila', 'Wickramarathna', 'ICT', '123 Galle Road, Colombo', 'amila.wikr@gmail.com', 'Senior Lecturer', 'Male', 45),
('L002', 'Navodi', 'Somathilaka', 'ICT', '456 Bandaranaike Mawatha, Kandy', 'navodi.soma@gmail.com', 'Assistant Professor', 'Female', 38),
('L003', 'Ranil', 'Kelaniya', 'ICT', '789 Mahaweli Street, Nuwara Eliya', 'ranil.kelaniya@gmail.com', 'Dean', 'Male', 50),
('L004', 'Charitha', 'Devapriya', 'ICT', '321 Ratnapura Road, Galle', 'charitha.deva@gmail.com', 'Lecturer', 'Female', 34),
('L005', 'Dinusha', 'Jayasinghe', 'ICT', '654 Ratmalana Road, Colombo', 'dinusha.jaya@gmail.com', 'Senior Lecturer', 'Female', 40),
('L006', 'Aruna', 'Peiris', 'MS', '987 Western Highway, Negombo', 'aruna.peiris@gmail.com', 'Associate Professor', 'Male', 47),
('L007', 'Shihan', 'Samarawira', 'ET', '159 Parakramabahu Mawatha, Kalutara', 'shihan.sam@gmail.com', 'Lecturer', 'Male', 30),
('L008', 'Sachini', 'Welgama', 'MS', '753 Kelaniya Road, Colombo', 'sachini.welgama@gmail.com', 'Professor', 'Female', 35),
('L009', 'Indika', 'Pathiraja', 'BST', '951 Kurunegala Road, Kurunegala', 'indika.pati@gmail.com', 'Assistant Lecturer', 'Male', 33),
('L010', 'Lahiru', 'Hevawitharana', 'ET', '852 Waskaduwa Road, Moratuwa', 'lahiru.hewa@gmail.com', 'Lecturer', 'Male', 42);

