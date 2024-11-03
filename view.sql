--create view CA_Marks_Details
CREATE VIEW CA_Marks_Details AS
SELECT 
    m.Reg_no,
    m.Course_Code,

    -- Quiz Scores
    m.Quiz_01,
    m.Quiz_02,
    m.Quiz_03,

    -- Midterm Scores
    m.Mid_theory,
    m.Mid_Practical,

    -- Calculate Top Two Quiz Scores
    ROUND((GREATEST(m.Quiz_01, m.Quiz_02, m.Quiz_03) + 
        (
            CASE 
                WHEN m.Quiz_01 = GREATEST(m.Quiz_01, m.Quiz_02, m.Quiz_03) THEN 
                    GREATEST(m.Quiz_02, m.Quiz_03)
                WHEN m.Quiz_02 = GREATEST(m.Quiz_01, m.Quiz_02, m.Quiz_03) THEN 
                    GREATEST(m.Quiz_01, m.Quiz_03)
                ELSE 
                    GREATEST(m.Quiz_01, m.Quiz_02)
            END
        )) / 2.0, 0) AS Top_Two_Quiz_Score,

    -- Calculate Midterm Score based on the given conditions
    CASE 
        WHEN m.Mid_theory > 0 AND m.Mid_Practical > 0 THEN 
            m.Mid_theory + m.Mid_Practical
        WHEN m.Mid_theory > 0 THEN 
            m.Mid_theory * 2
        WHEN m.Mid_Practical > 0 THEN 
            m.Mid_Practical * 2
        ELSE 0
    END AS Midterm_Score,

    -- Use Assignment Score
    m.Assignment AS Assignment_Score,

    -- Calculate Total CA mark (out of 400)
    (ROUND((GREATEST(m.Quiz_01, m.Quiz_02, m.Quiz_03) + 
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
    m.Assignment) AS Total_CA_Marks_400,

    -- Normalize CA Marks to 100
    ROUND(((ROUND((GREATEST(m.Quiz_01, m.Quiz_02, m.Quiz_03) + 
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
    m.Assignment) / 4.0), 0) AS Final_CA_Marks_100

FROM mark m;


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

    -- Calculate Final CA mark
    ROUND(((ROUND((LEAST(GREATEST(m.Quiz_01, m.Quiz_02), GREATEST(m.Quiz_02, m.Quiz_03), GREATEST(m.Quiz_01, m.Quiz_03)) 
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
    m.Assignment) / 4.0), 0) AS Final_CA_Mark,

    -- Get Attendance Percentage
    a.attendance_percentage,

    -- Determine Eligibility based on CA Score and Attendance
    CASE 
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
LEFT JOIN attendance_summary a ON m.Reg_no = a.reg_no AND m.Course_Code = a.course_code;


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






--create view Final_Marks_Details 
CREATE VIEW Final_Marks_Details AS
SELECT 
    m.Reg_no,
    m.Course_Code,
    
    -- Continuous Assessment Score (out of 100, already calculated in CA_Marks_Details)
    c.Final_CA_Marks_100,
    
    -- CA Mark weighted to 40%
    ROUND(c.Final_CA_Marks_100 * 0.40, 2) AS Final_CA_Marks_40,

    -- Final Theory and Practical Scores
    m.End_Theory,
    m.End_Practical,

    -- Calculate End_Score_100 based on available scores
    ROUND(
        CASE 
            -- If both scores are available, calculate the average
            WHEN m.End_Theory > 0 AND m.End_Practical > 0 THEN 
                (m.End_Theory + m.End_Practical) / 2
            -- If only one score is available
            ELSE 
                (m.End_Theory + m.End_Practical)
        END, 2
    ) AS End_Score_100,

    -- Calculate End_Score_60 based on the 60% weight
    ROUND(
        CASE 
            WHEN m.End_Theory > 0 AND m.End_Practical > 0 THEN 
                ((m.End_Theory + m.End_Practical) / 2) * 0.60
            ELSE 
                (m.End_Theory + m.End_Practical) * 0.60
        END, 2
    ) AS End_Score_60,

    -- Calculate Individual Final Mark (CA Score + End Score60) on a 100-point scale
    ROUND(
        (c.Final_CA_Marks_100 * 0.40) + 
        CASE 
            WHEN m.End_Theory > 0 AND m.End_Practical > 0 THEN 
                ((m.End_Theory + m.End_Practical) / 2) * 0.60
            ELSE 
                (m.End_Theory + m.End_Practical) * 0.60
        END, 2
    ) AS Final_Mark

FROM 
    mark m
JOIN 
    CA_Marks_Details c ON m.Reg_no = c.Reg_no AND m.Course_Code = c.Course_Code;


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












--create view Student_SGPA 
CREATE VIEW Student_SGPA AS
SELECT 
    fd.Reg_no,
    AVG(
        CASE 
            WHEN fd.Final_Mark >= 90 THEN 4.0  -- A+
            WHEN fd.Final_Mark >= 85 THEN 4.0  -- A
            WHEN fd.Final_Mark >= 80 THEN 3.7  -- A-
            WHEN fd.Final_Mark >= 75 THEN 3.3  -- B+
            WHEN fd.Final_Mark >= 70 THEN 3.0  -- B
            WHEN fd.Final_Mark >= 65 THEN 2.7  -- B-
            WHEN fd.Final_Mark >= 60 THEN 2.3  -- C+
            WHEN fd.Final_Mark >= 55 THEN 2.0  -- C
            WHEN fd.Final_Mark >= 50 THEN 1.7  -- C-
            WHEN fd.Final_Mark >= 45 THEN 1.0  -- D
            ELSE 0.0                           -- F
        END
    ) AS SGPA
FROM 
    Final_Marks_Details fd
GROUP BY 
    fd.Reg_no;


--Querying the Student_SGPA
SELECT * 
FROM Student_SGPA;


SELECT * 
FROM Student_SGPA
WHERE Reg_no = 'TG/2022/001';







--create view Student_CGPA
CREATE VIEW Student_CGPA AS
SELECT 
    Reg_no,
    AVG(SGPA) AS CGPA
FROM 
    Student_SGPA
GROUP BY 
    Reg_no;


--Querying the Student_CGPA
SELECT * 
FROM Student_CGPA;


SELECT * 
FROM Student_CGPA
WHERE Reg_no = 'TG/2022/001';


