--View for Batch Final Marks Summary

CREATE VIEW Batch_Final_Marks_Summary AS
SELECT 
    m.Course_Code,
    COUNT(m.Reg_no) AS Total_Students,

    -- Calculate Average Final CA Score
    AVG(ROUND(((ROUND((LEAST(GREATEST(m.Quiz_01, m.Quiz_02), GREATEST(m.Quiz_02, m.Quiz_03), GREATEST(m.Quiz_01, m.Quiz_03)) 
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
    m.Assignment) / 4.0), 0)) AS Average_Final_CA_Score,

    -- Count Eligible Students
    SUM(CASE 
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
        AND (SELECT attendance_percentage FROM attendance_summary WHERE reg_no = m.Reg_no AND course_code = m.Course_Code) >= 80 THEN 1
        ELSE 0
    END) AS Eligible_Students

FROM mark m
GROUP BY m.Course_Code;


--View Batch Final Marks Summary

SELECT * 
FROM Batch_Final_Marks_Summary 
WHERE Course_Code = 'your_course_code_here';





--Create a View for CA Eligibility

CREATE VIEW CA_Eligibility_Status AS
SELECT 
    m.Reg_no,
    m.Course_Code,

    -- Calculate Final CA Score
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
    m.Assignment) / 4.0), 0) AS Final_CA_Score,

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
WHERE Reg_no = 'your_registration_no_here';




--View CA Marks for Individuals by Course Code and Registration Number

CREATE VIEW CA_Marks_Individual_Details AS
SELECT 
    m.Reg_no,
    m.Course_Code,

    -- Individual Quiz Scores
    m.Quiz_01,
    m.Quiz_02,
    m.Quiz_03,

    -- Individual Midterm Scores
    m.Mid_theory,
    m.Mid_Practical,

    -- Calculate Top Two Quiz Score
    ROUND((LEAST(GREATEST(m.Quiz_01, m.Quiz_02), GREATEST(m.Quiz_02, m.Quiz_03), GREATEST(m.Quiz_01, m.Quiz_03)) 
        + GREATEST(m.Quiz_01, m.Quiz_02, m.Quiz_03)) / 2.0, 0) AS Top_Two_Quiz_Score,

    -- Calculate Midterm Score
    CASE 
        WHEN m.Mid_theory IS NOT NULL AND m.Mid_Practical IS NOT NULL THEN 
            m.Mid_theory + m.Mid_Practical
        WHEN m.Mid_theory IS NOT NULL THEN 
            m.Mid_theory * 2
        WHEN m.Mid_Practical IS NOT NULL THEN 
            m.Mid_Practical * 2
        ELSE 0
    END AS Midterm_Score,

    -- Use Assignment Score
    m.Assignment AS Assignment_Score,

    -- Calculate Total CA Score (out of 400)
    (ROUND((LEAST(GREATEST(m.Quiz_01, m.Quiz_02), GREATEST(m.Quiz_02, m.Quiz_03), GREATEST(m.Quiz_01, m.Quiz_03)) 
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
    m.Assignment) AS Total_CA_Marks_400,

    -- Normalize CA Marks to 100
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
    m.Assignment) / 4.0), 0) AS CA_Score_100,

    -- Join with Attendance Summary View for Attendance Percentage
    a.attended_sessions,
    a.total_sessions,
    a.attendance_percentage,

    -- Eligibility Check based on CA Score and Attendance
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
    END AS CA_Eligibility

FROM mark m
LEFT JOIN attendance_summary a ON m.Reg_no = a.reg_no AND m.Course_Code = a.course_code;




--Individual CA Marks by Course Code and Registration Number

SELECT * 
FROM CA_Marks_Individual_Details 
WHERE Course_Code = 'your_course_code_here' 
AND Reg_no = 'your_registration_no_here';


--Individual CA Marks by Registration Number

SELECT * 
FROM CA_Marks_Individual_Details 
WHERE Reg_no = 'your_registration_no_here';




--View CA Marks Summary by Course Code

CREATE VIEW CA_Marks_Summary AS
SELECT 
    m.Course_Code,
    COUNT(m.Reg_no) AS Total_Students,
    
    -- Calculate Average CA Score
    AVG(ROUND(((ROUND((LEAST(GREATEST(m.Quiz_01, m.Quiz_02), GREATEST(m.Quiz_02, m.Quiz_03), GREATEST(m.Quiz_01, m.Quiz_03)) 
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
    m.Assignment) / 4.0), 0)) AS Average_CA_Score,

    -- Count Eligible Students
    SUM(CASE 
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
        AND a.attendance_percentage >= 80 THEN 1
        ELSE 0
    END) AS Eligible_Students

FROM mark m
LEFT JOIN attendance_summary a ON m.Reg_no = a.reg_no AND m.Course_Code = a.course_code
GROUP BY m.Course_Code;




SELECT * FROM CA_Marks_Summary WHERE Course_Code = 'your_course_code_here';




--View for Individual Final Marks

CREATE VIEW Individual_Final_Marks AS
SELECT 
    m.Reg_no,
    m.Course_Code,
    
    -- Calculate Total CA Score (out of 400)
    (ROUND((LEAST(GREATEST(m.Quiz_01, m.Quiz_02), GREATEST(m.Quiz_02, m.Quiz_03), GREATEST(m.Quiz_01, m.Quiz_03)) 
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
    m.Assignment) AS Total_CA_Marks_400,

    -- Normalize CA Marks to 100
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
    m.Assignment) / 4.0), 0) AS Final_CA_Score,

    -- Attendance Percentage Calculation from attendance_summary view
    a.attendance_percentage,

    -- Eligibility Check based on CA Score and Attendance
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
    END AS CA_Eligibility

FROM mark m
LEFT JOIN attendance_summary a ON m.Reg_no = a.reg_no AND m.Course_Code = a.course_code;




--View Individual Final Marks

SELECT * 
FROM Individual_Final_Marks 
WHERE Reg_no = 'your_registration_no_here';
