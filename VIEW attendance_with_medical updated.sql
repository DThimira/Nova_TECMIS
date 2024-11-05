CREATE VIEW attendance_with_medical AS
SELECT 
    reg_no,
    course_code,
    CASE 
        WHEN theory = TRUE AND practical = FALSE THEN 'Theory'
        WHEN practical = TRUE AND theory = FALSE THEN 'Practical'
        WHEN theory = TRUE AND practical = TRUE THEN 'Both'
    END AS session_type,
    (CAST(COUNT(attendance_id) AS DECIMAL) / 13 * 100) AS percentage,
    CASE 
        WHEN (CAST(COUNT(attendance_id) AS DECIMAL) / 13 * 100) >= 80 THEN 'Eligible' 
        ELSE 'Not eligible' 
    END AS eligibility
FROM 
    attendance 
WHERE 
    (Status = 'Present' OR medical_id IS NOT NULL)
GROUP BY 
    reg_no, course_code, session_type;