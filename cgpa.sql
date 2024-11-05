

CREATE VIEW CGPA AS
SELECT
    student_ID,
    SUM(Semester_GPA * Total_Credits) / NULLIF(SUM(Total_Credits), 0) AS CGPA
FROM (
    SELECT
        sg.student_ID,
        sg.Semester_GPA,
        SUM(c.Credit) AS Total_Credits
    FROM Semester_GPA sg
    JOIN Final_Marks_Details final ON sg.student_ID = final.Reg_no
    JOIN course c ON final.Course_Code = c.Course_code
    WHERE c.Course_code != 'ENG1222'  
    GROUP BY sg.student_ID, sg.Semester_GPA
) AS Semester_Calculations
GROUP BY student_ID;  



