

CREATE VIEW CGPA AS
SELECT
    reg_no,
    SUM(Semester_GPA * Total_Credits) / NULLIF(SUM(Total_Credits), 0) AS CGPA
FROM (
    SELECT
        sg.reg_no,
        sg.Semester_GPA,
        SUM(c.Credit) AS Total_Credits
    FROM Semester_GPA sg
    JOIN Final_Marks_Details final ON sg.reg_no = final.Reg_no
    JOIN course c ON final.Course_Code = c.Course_code
    WHERE c.Course_code != 'ENG1222'  -- Exclude the ENG1222 course
    GROUP BY sg.reg_no, sg.Semester_GPA
) AS Semester_Calculations
GROUP BY reg_no;  -- Group by student_ID to calculate CGPA for each student


