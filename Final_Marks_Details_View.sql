CREATE VIEW Final_Marks_Details AS
WITH Marks_Calculations AS (
    SELECT 
        m.Reg_no,
        m.Course_Code,
        c.Final_CA_Marks_100,
        s.Status,
        COALESCE(m.End_Theory, 0) AS End_Theory,
        COALESCE(m.End_Practical, 0) AS End_Practical,
        e.Eligibility_Status
    FROM 
        mark m
    JOIN 
        CA_Marks_Details c ON m.Reg_no = c.Reg_no AND m.Course_Code = c.Course_Code
    JOIN 
        student s ON m.Reg_no = s.Reg_no
    JOIN 
        CA_Eligibility_Status e ON m.Reg_no = e.Reg_no AND m.Course_Code = e.Course_Code
)

SELECT 
    Reg_no,
    Course_Code,
    
    CASE 
        WHEN Status = 'Suspended' THEN 'WH'
        ELSE Final_CA_Marks_100 
    END AS Final_CA_Marks_100,

    CASE 
        WHEN Status = 'Suspended' THEN 'WH'
        ELSE ROUND(Final_CA_Marks_100 * 0.40, 2) 
    END AS Final_CA_Marks_40,
    
    CASE 
        WHEN Status = 'Suspended' THEN 'WH'
        WHEN Eligibility_Status = 'Not Eligible' THEN '00.00'
        ELSE ROUND(End_Theory, 2) 
    END AS End_Theory,

    CASE 
        WHEN Status = 'Suspended' THEN 'WH'
        WHEN Eligibility_Status = 'Not Eligible' THEN '00.00'
        ELSE ROUND(End_Practical, 2) 
    END AS End_Practical,


    CASE 
        WHEN Status = 'Suspended' THEN 'WH'
        WHEN Eligibility_Status = 'Not Eligible' THEN '00.00'
        ELSE ROUND(
            CASE 
                WHEN End_Theory > 0 AND End_Practical > 0 THEN 
                    (End_Theory + End_Practical) / 2
                ELSE 
                    (End_Theory + End_Practical)
            END, 2
        ) 
    END AS End_Score_100,

    CASE 
        WHEN Status = 'Suspended' THEN 'WH'
        WHEN Eligibility_Status = 'Not Eligible' THEN '00.00'
        ELSE ROUND(
            CASE 
                WHEN End_Theory > 0 AND End_Practical > 0 THEN 
                    ((End_Theory + End_Practical) / 2) * 0.60
                ELSE 
                    (End_Theory + End_Practical) * 0.60
            END, 2
        )
    END AS End_Score_60,

    CASE 
        WHEN Status = 'Suspended' THEN 'WH'
        WHEN Eligibility_Status = 'Not Eligible' THEN '00.00'
        ELSE ROUND(
            (Final_CA_Marks_100 * 0.40) + 
            CASE 
                WHEN End_Theory > 0 AND End_Practical > 0 THEN 
                    ((End_Theory + End_Practical) / 2) * 0.60
                ELSE 
                    (End_Theory + End_Practical) * 0.60
            END, 2
        )
    END AS Final_Mark

FROM 
    Marks_Calculations;