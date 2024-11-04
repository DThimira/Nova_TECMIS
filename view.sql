--create view CA_Marks_Details
CREATE VIEW CA_Marks_Details AS
SELECT 
    m.Reg_no,
    m.Course_Code,

    CASE WHEN s.Status = 'Suspended' THEN 'WH' ELSE m.Quiz_01 END AS Quiz_01,
    CASE WHEN s.Status = 'Suspended' THEN 'WH' ELSE m.Quiz_02 END AS Quiz_02,
    CASE WHEN s.Status = 'Suspended' THEN 'WH' ELSE m.Quiz_03 END AS Quiz_03,

    CASE WHEN s.Status = 'Suspended' THEN 'WH' ELSE m.Mid_theory END AS Mid_theory,
    CASE WHEN s.Status = 'Suspended' THEN 'WH' ELSE m.Mid_Practical END AS Mid_Practical,

    CASE 
        WHEN s.Status = 'Suspended' THEN 'WH'
        ELSE ROUND((GREATEST(m.Quiz_01, m.Quiz_02, m.Quiz_03) + 
            (
                CASE 
                    WHEN m.Quiz_01 = GREATEST(m.Quiz_01, m.Quiz_02, m.Quiz_03) THEN 
                        GREATEST(m.Quiz_02, m.Quiz_03)
                    WHEN m.Quiz_02 = GREATEST(m.Quiz_01, m.Quiz_02, m.Quiz_03) THEN 
                        GREATEST(m.Quiz_01, m.Quiz_03)
                    ELSE 
                        GREATEST(m.Quiz_01, m.Quiz_02)
                END
            )) / 2.0, 0)
    END AS Top_Two_Quiz_Score,

    CASE 
        WHEN s.Status = 'Suspended' THEN 'WH'
        ELSE CASE 
            WHEN m.Mid_theory > 0 AND m.Mid_Practical > 0 THEN 
                m.Mid_theory + m.Mid_Practical
            WHEN m.Mid_theory > 0 THEN 
                m.Mid_theory * 2
            WHEN m.Mid_Practical > 0 THEN 
                m.Mid_Practical * 2
            ELSE 0
        END 
    END AS Midterm_Score,

    CASE WHEN s.Status = 'Suspended' THEN 'WH' ELSE m.Assignment END AS Assignment_Score,

    CASE 
        WHEN s.Status = 'Suspended' THEN 'WH'
        ELSE (ROUND((GREATEST(m.Quiz_01, m.Quiz_02, m.Quiz_03) + 
            (
                CASE 
                    WHEN m.Quiz_01 = GREATEST(m.Quiz_01, m.Quiz_02, m.Quiz_03) THEN 
                        GREATEST(m.Quiz_02, m.Quiz_03)
                    WHEN m.Quiz_02 = GREATEST(m.Quiz_01, m.Quiz_02, m.Quiz_03) THEN 
                        GREATEST(m.Quiz_01, m.Quiz_03)
                    ELSE 
                        GREATEST(m.Quiz_01, m.Quiz_02)
                END
            )) / 2.0, 0) + 
        CASE 
            WHEN m.Mid_theory > 0 AND m.Mid_Practical > 0 THEN 
                m.Mid_theory + m.Mid_Practical
            WHEN m.Mid_theory > 0 THEN 
                m.Mid_theory * 2
            WHEN m.Mid_Practical > 0 THEN 
                m.Mid_Practical * 2
            ELSE 0
        END + 
        m.Assignment)
    END AS Total_CA_Marks_400,

    CASE 
        WHEN s.Status = 'Suspended' THEN 'WH'
        ELSE ROUND(((ROUND((GREATEST(m.Quiz_01, m.Quiz_02, m.Quiz_03) + 
            (
                CASE 
                    WHEN m.Quiz_01 = GREATEST(m.Quiz_01, m.Quiz_02, m.Quiz_03) THEN 
                        GREATEST(m.Quiz_02, m.Quiz_03)
                    WHEN m.Quiz_02 = GREATEST(m.Quiz_01, m.Quiz_02, m.Quiz_03) THEN 
                        GREATEST(m.Quiz_01, m.Quiz_03)
                    ELSE 
                        GREATEST(m.Quiz_01, m.Quiz_02)
                END
            )) / 2.0, 0) + 
        CASE 
            WHEN m.Mid_theory > 0 AND m.Mid_Practical > 0 THEN 
                m.Mid_theory + m.Mid_Practical
            WHEN m.Mid_theory > 0 THEN 
                m.Mid_theory * 2
            WHEN m.Mid_Practical > 0 THEN 
                m.Mid_Practical * 2
            ELSE 0
        END + 
        m.Assignment) / 4.0), 0)
    END AS Final_CA_Marks_100

FROM mark m
JOIN student s ON m.Reg_no = s.Reg_no;  


--Querying the CA_Marks_Details view
SELECT * 
FROM CA_Marks_Details 
WHERE Course_Code = 'ICT1222';


SELECT * 
FROM CA_Marks_Details 
WHERE Reg_no = 'TG/2022/003';


SELECT * 
FROM CA_Marks_Details 
WHERE Course_Code = 'ICT1222' 
AND Reg_no = 'TG/2022/003';









--create view CA_Eligibility_Status
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



--Querying the Eligibility View
SELECT * 
FROM CA_Eligibility_Status;


SELECT * 
FROM CA_Eligibility_Status 
WHERE Reg_no = 'TG/2022/001';


SELECT * 
FROM CA_Eligibility_Status
WHERE Course_Code = 'ICT1222' 
AND Reg_no = 'TG/2022/001';






--create view End_Marks
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


--Querying the End_Marks
FROM End_Marks;


SELECT * 
FROM End_Marks
WHERE Reg_no = 'TG/2022/001';


SELECT * 
FROM End_Marks
WHERE Course_Code = 'ICT1222' 
AND Reg_no = 'TG/2022/001';






--create view Final_Marks_Details 
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


--Querying the Final_Marks_Details
SELECT * 
FROM Final_Marks_Details;


SELECT * 
FROM Final_Marks_Details
WHERE Reg_no = 'TG/2022/001';


SELECT * 
FROM Final_Marks_Details
WHERE Course_Code = 'ICT1222' 
AND Reg_no = 'TG/2022/001';





--create view Student_Grades
CREATE VIEW Student_Grades AS
SELECT 
    fd.Reg_no,
    fd.Course_Code,
    fd.Final_Mark,
    CASE 
        WHEN fd.Final_Mark >= 90 THEN 'A+'
        WHEN fd.Final_Mark >= 85 THEN 'A'
        WHEN fd.Final_Mark >= 80 THEN 'A-'
        WHEN fd.Final_Mark >= 75 THEN 'B+'
        WHEN fd.Final_Mark >= 70 THEN 'B'
        WHEN fd.Final_Mark >= 65 THEN 'B-'
        WHEN fd.Final_Mark >= 60 THEN 'C+'
        WHEN fd.Final_Mark >= 55 THEN 'C'
        WHEN fd.Final_Mark >= 50 THEN 'C-'
        WHEN fd.Final_Mark >= 45 THEN 'D'
        ELSE 'F'
    END AS Grade
FROM 
    Final_Marks_Details fd;


--Querying the Student_Grades
SELECT * 
FROM Student_Grades;


SELECT * 
FROM Student_Grades
WHERE Reg_no = 'TG/2022/001';


SELECT * 
FROM Student_Grades
WHERE Course_Code = 'ICT1222' 
AND Reg_no = 'TG/2022/001';






--create view Student_Grades
CREATE VIEW Student_Grades AS
SELECT 
    fd.Reg_no,
    fd.Course_Code,
    fd.Final_Mark,
    
    CASE 
        WHEN s.Status = 'Repeat' THEN 
            CASE 
                WHEN fd.Final_Mark >= 55 THEN 'C' 
                WHEN fd.Final_Mark >= 50 THEN 'C-'
                WHEN fd.Final_Mark >= 45 THEN 'D'
                ELSE 'F'
            END
        ELSE 
            CASE 
                WHEN fd.Final_Mark >= 85 THEN 'A+'  -- 85 <= fm <= 100
                WHEN fd.Final_Mark >= 80 THEN 'A'   -- 80 <= fm < 85
                WHEN fd.Final_Mark >= 75 THEN 'A-'  -- 75 <= fm < 80
                WHEN fd.Final_Mark >= 70 THEN 'B+'  -- 70 <= fm < 75
                WHEN fd.Final_Mark >= 65 THEN 'B'   -- 65 <= fm < 70
                WHEN fd.Final_Mark >= 60 THEN 'B-'  -- 60 <= fm < 65
                WHEN fd.Final_Mark >= 55 THEN 'C+'  -- 55 <= fm < 60
                WHEN fd.Final_Mark >= 50 THEN 'C'   -- 50 <= fm < 55
                WHEN fd.Final_Mark >= 45 THEN 'C-'  -- 45 <= fm < 50
                WHEN fd.Final_Mark >= 40 THEN 'D+'  -- 40 <= fm < 45
                WHEN fd.Final_Mark >= 35 THEN 'D'   -- 35 <= fm < 40
                ELSE 'F'                            -- 0 <= fm < 35
            END
    END AS Grade

FROM 
    Final_Marks_Details fd
JOIN 
    student s ON fd.Reg_no = s.Reg_no;




--Querying the Student_Grades
SELECT * 
FROM Student_Grades;


SELECT * 
FROM Student_Grades
WHERE Reg_no = 'TG/2022/001';


SELECT * 
FROM Student_Grades
WHERE Course_Code = 'ICT1222' 
AND Reg_no = 'TG/2022/001';


