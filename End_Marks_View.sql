CREATE VIEW End_Marks AS
SELECT 
    m.Reg_no,
    m.Course_Code,

    CASE 
        WHEN s.Status = 'Suspended' THEN 'WH'
        WHEN e.Eligibility_Status = 'Not Eligible' THEN '00.00'
        ELSE ROUND(m.End_Theory, 2) 
    END AS End_Theory,

    CASE 
        WHEN s.Status = 'Suspended' THEN 'WH'
        WHEN e.Eligibility_Status = 'Not Eligible' THEN '00.00'
        ELSE ROUND(m.End_Practical, 2) 
    END AS End_Practical,

    CASE 
        WHEN s.Status = 'Suspended' THEN 'WH'
        WHEN e.Eligibility_Status = 'Not Eligible' THEN '00.00'
        ELSE ROUND(
            CASE 
                WHEN m.End_Theory > 0 AND m.End_Practical > 0 THEN 
                    (m.End_Theory + m.End_Practical) / 2
                ELSE 
                    (m.End_Theory + m.End_Practical)
            END, 2
        ) 
    END AS End_Score_100,

    CASE 
        WHEN s.Status = 'Suspended' THEN 'WH'
        WHEN e.Eligibility_Status = 'Not Eligible' THEN '00.00'
        ELSE ROUND(
            CASE 
                WHEN m.End_Theory > 0 AND m.End_Practical > 0 THEN 
                    ((m.End_Theory + m.End_Practical) / 2) * 0.60
                ELSE 
                    (m.End_Theory + m.End_Practical) * 0.60
            END, 2
        )
    END AS End_Score_60

FROM 
    mark m
JOIN 
    student s ON m.Reg_no = s.Reg_no 
JOIN 
    CA_Eligibility_Status e ON m.Reg_no = e.Reg_no AND m.Course_Code = e.Course_Code; 