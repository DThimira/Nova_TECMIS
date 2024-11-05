



CREATE VIEW attendance_individual AS
SELECT
    reg_no,
    course_code,
    CASE 
        WHEN theory = TRUE AND practical = FALSE THEN 'Theory'
        WHEN practical = TRUE AND theory = FALSE THEN 'Practical'
        WHEN theory = TRUE AND practical = TRUE THEN 'Both'
        ELSE 'Unknown'
    END AS session_type,
    (CAST(COUNT(attendance_id) AS DECIMAL) / 13 * 100) AS percentage,
    IF((CAST(COUNT(attendance_id) AS DECIMAL) / 13 * 100) >= 80, 'Eligible', 'Not eligible') AS Eligibility
FROM
    attendance
WHERE
    (Status = 'Present' OR medical_id IS NOT NULL)
GROUP BY
    course_code, reg_no, session_type;






