CREATE DATABASE Nova_Tecmis;
USE NovaTecmis;


CREATE USER 'Admin'@'localhost' IDENTIFIED BY 'admin1234';
GRANT ALL PRIVILEGES ON Nova_Tecmis.* TO 'Admin'@'localhost' WITH GRANT OPTION;


CREATE USER 'Dean'@'localhost' IDENTIFIED BY 'dean1234';
GRANT ALL PRIVILEGES ON Nova_Tecmis.* TO 'Dean'@'localhost';


CREATE USER 'Lecturer'@'localhost' IDENTIFIED BY 'lecture1234';
GRANT SELECT, INSERT, UPDATE, DELETE ON Nova_Tecmis.* TO 'Lecturer'@'localhost';


CREATE USER 'tec_officer'@'localhost' IDENTIFIED BY 'tec1234';
GRANT SELECT, INSERT, UPDATE ON Nova_Tecmis.ATTENDANCE TO 'tec_officer'@'localhost';
GRANT SELECT, INSERT, UPDATE ON Nova_Tecmis.attendance_by_session_type TO 'tec_officer'@'localhost';
GRANT SELECT, INSERT, UPDATE ON Nova_Tecmis.attendance_summary   TO 'tec_officer'@'localhost';
GRANT SELECT, INSERT, UPDATE ON Nova_Tecmis.attendance_individual  TO 'tec_officer'@'localhost';
GRANT SELECT, INSERT, UPDATE ON Nova_Tecmis.attendance_summary_by_course  TO 'tec_officer'@'localhost';
GRANT SELECT, INSERT, UPDATE ON Nova_Tecmis.attendance_with_medical  TO 'tec_officer'@'localhost';


CREATE USER 'Student'@'localhost' IDENTIFIED BY 'stu1234';
GRANT SELECT ON Nova_Tecmis.attendance_summary TO 'Student'@'localhost';
GRANT SELECT ON Nova_Tecmis.Student_Grades TO 'Student'@'localhost';
GRANT SELECT ON Nova_Tecmis.CA_Marks_Details TO 'Student'@'localhost';
GRANT SELECT ON Nova_Tecmis.CA_Eligibility_Status TO 'Student'@'localhost';
GRANT SELECT ON Nova_Tecmis.End_Marks TO 'Student'@'localhost';
GRANT SELECT ON Nova_Tecmis.Final_Marks_Details TO 'Student'@'localhost';


FLUSH PRIVILEGES;


SELECT User, Host FROM mysql.user;
SELECT DISTINCT User FROM mysql.user;