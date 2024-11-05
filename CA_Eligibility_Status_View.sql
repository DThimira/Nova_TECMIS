CREATE VIEW CA_Eligibility_Status AS
SELECT 
    m.Reg_no,
    m.Course_Code,

    CASE 
        WHEN s.Status = 'Suspended' THEN 'WH'
        ELSE ROUND(((ROUND((LEAST(GREATEST(m.Quiz_01, m.Quiz_02), GREATEST(m.Quiz_02, m.Quiz_03), GREATEST(m.Quiz_01, m.Quiz_03)) 
            + GREATEST(m.Quiz_01, m.Quiz_02, m.Quiz_03)) / 2.0, 0) + 
        CASE 
            WHEN m.Mid_theory IS NOT NULL AND m.Mid_Practical IS NOT NULL THEN 
                m.Mid_theory + m.Mid_Practical
            WHEN m.Mid_theory IS NOT NULL THEN 
                m.Mid_theory * 2
            WHEN m.Mid_Practical IS NOT NULL THEN 
                m.Mid_Practical * 2
            ELSE 0
        END + 
        m.Assignment) / 4.0), 0) 
    END AS Final_CA_Mark,

    CASE 
        WHEN s.Status = 'Suspended' THEN 'WH'
        ELSE a.attendance_percentage 
    END AS attendance_percentage,

    CASE 
        WHEN s.Status = 'Suspended' THEN 'WH'
        WHEN ROUND(((ROUND((LEAST(GREATEST(m.Quiz_01, m.Quiz_02), GREATEST(m.Quiz_02, m.Quiz_03), GREATEST(m.Quiz_01, m.Quiz_03)) 
            + GREATEST(m.Quiz_01, m.Quiz_02, m.Quiz_03)) / 2.0, 0) + 
        CASE 
            WHEN m.Mid_theory IS NOT NULL AND m.Mid_Practical IS NOT NULL THEN 
                m.Mid_theory + m.Mid_Practical
            WHEN m.Mid_theory IS NOT NULL THEN 
                m.Mid_theory * 2
            WHEN m.Mid_Practical IS NOT NULL THEN 
                m.Mid_Practical * 2
            ELSE 0
        END + 
        m.Assignment) / 4.0), 0) >= 50 
        AND a.attendance_percentage >= 80 THEN 'Eligible'
        ELSE 'Not Eligible'
    END AS Eligibility_Status

FROM mark m
LEFT JOIN attendance_summary a ON m.Reg_no = a.reg_no AND m.Course_Code = a.course_code
JOIN student s ON m.Reg_no = s.Reg_no; 