CREATE DATABASE NovaTecmis;
USE NovaTecmis;


CREATE USER 'Admin'@'localhost' IDENTIFIED BY 'admin1234';
GRANT ALL PRIVILEGES ON NovaTecmis.* TO 'Admin'@'localhost' WITH GRANT OPTION;


CREATE USER 'Dean'@'localhost' IDENTIFIED BY 'dean1234';
GRANT ALL PRIVILEGES ON NovaTecmis.* TO 'Dean'@'localhost';


CREATE USER 'Lecturer'@'localhost' IDENTIFIED BY 'lecture1234';
GRANT SELECT, INSERT, UPDATE, DELETE ON NovaTecmis.* TO 'Lecturer'@'localhost';


CREATE USER 'TechnicalOfficer'@'localhost' IDENTIFIED BY 'tech1234';
GRANT SELECT, INSERT, UPDATE ON NovaTecmis.attendance TO 'TechnicalOfficer'@'localhost';


CREATE USER 'Student'@'localhost' IDENTIFIED BY 'stu1234';
GRANT SELECT ON NovaTecmis.attendance_summary TO 'Student'@'localhost';
GRANT SELECT ON NovaTecmis.Student_Grades TO 'Student'@'localhost';


FLUSH PRIVILEGES;



---------------------------------------
Passwords
A$dM!n_2024@# for Admin
D#eAn_2024$! for Dean
L#eC_tURe!_2024 for Lecturer
T@ChNi_C0FF!2024 for Technical Officer
Stu#D3nT@2024! for Student


SELECT User, Host FROM mysql.user;
SELECT DISTINCT User FROM mysql.user;