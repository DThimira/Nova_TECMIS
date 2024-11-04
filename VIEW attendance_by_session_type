

CREATE VIEW attendance_by_session_type AS
SELECT 
    Reg_no,
    Course_code,
    CASE 
        WHEN theory = TRUE AND practical = FALSE THEN 'Theory'
        WHEN practical = TRUE AND theory = FALSE THEN 'Practical'
        WHEN theory = TRUE AND practical = TRUE THEN 'Both'
        ELSE 'Unknown'
    END AS session_Type,
    COUNT(*) AS total_sessions,
    SUM(CASE WHEN Status = 'Present' THEN 1 ELSE 0 END) AS attended_sessions,
    (SUM(CASE WHEN Status = 'Present' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS attendance_percentage,
    CASE 
        WHEN (SUM(CASE WHEN Status = 'Present' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) >= 80 THEN 'Eligible'
        ELSE 'Not Eligible'
    END AS eligibility
FROM 
    ATTENDANCE
GROUP BY 
    Reg_no, Course_code, session_Type;







SELECT * FROM attendance_by_session_type;





-- To see only eligible students
SELECT * FROM attendance_by_session_type WHERE eligibility = 'Eligible';

-- To filter by a specific student's registration number
SELECT * FROM attendance_by_session_type WHERE Reg_no = 'TG/2022/001';

-- To see students with attendance percentage below 80%
SELECT * FROM attendance_by_session_type WHERE attendance_percentage < 80;



