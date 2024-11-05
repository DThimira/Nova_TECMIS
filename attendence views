CREATE VIEW attendance_summary AS
SELECT
    reg_no,
    course_code,
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
    reg_no, course_code;





SELECT * FROM attendance_summary;



one student


SELECT * FROM attendance_summary
WHERE reg_no = 'TG/2022/001';

one course:



SELECT * FROM attendance_summary
WHERE course_code = 'ICT1233';



