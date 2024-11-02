-- Creating the database
CREATE DATABASE NovaTecmis;
USE NovaTecmis;

-- Admin: All privileges with Grant Option
CREATE USER 'Admin'@'localhost' IDENTIFIED BY 'A$dM!n_2024@#';
GRANT ALL PRIVILEGES ON FacultyManagementSystem.* TO 'Admin'@'localhost' WITH GRANT OPTION;

-- Dean: All privileges without Grant Option
CREATE USER 'Dean'@'localhost' IDENTIFIED BY 'D#eAn_2024$!';
GRANT ALL PRIVILEGES ON FacultyManagementSystem.* TO 'Dean'@'localhost';

-- Lecturer: All privileges without Grant and user creation
CREATE USER 'Lecturer'@'localhost' IDENTIFIED BY 'L#eC_tURe!_2024';
GRANT SELECT, INSERT, UPDATE, DELETE ON FacultyManagementSystem.* TO 'Lecturer'@'localhost';

-- Create the Attendance table

-- Technical Officer: Read, write, and update permissions for attendance-related tables/views
CREATE USER 'TechnicalOfficer'@'localhost' IDENTIFIED BY 'T@ChNi_C0FF!2024';
GRANT SELECT, INSERT, UPDATE ON FacultyManagementSystem.Attendance TO 'TechnicalOfficer'@'localhost';]

-----CREATE TABLE FinalAttendance 
-----CREATE TABLE FinalGrades
-- Student: Read permission for final attendance and final marks/Grades tables/views
CREATE USER 'Student'@'localhost' IDENTIFIED BY 'Stu#D3nT@2024!';
GRANT SELECT ON FacultyManagementSystem.FinalAttendance TO 'Student'@'localhost';
GRANT SELECT ON FacultyManagementSystem.FinalGrades TO 'Student'@'localhost';

-- Apply the changes
FLUSH PRIVILEGES;

Passwords
A$dM!n_2024@# for Admin
D#eAn_2024$! for Dean
L#eC_tURe!_2024 for Lecturer
T@ChNi_C0FF!2024 for Technical Officer
Stu#D3nT@2024! for Student


SELECT User, Host FROM mysql.user;
SELECT DISTINCT User FROM mysql.user;