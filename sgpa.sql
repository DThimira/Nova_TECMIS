CREATE VIEW Semester_GPA AS
SELECT
    Grade_Calculation.Reg_no AS student_ID,  
    sum(grade_points)/sum(credit) AS Semester_GPA
FROM (
    SELECT
        final.Reg_no,
        c.Course_code,
        c.Credit,
        ca.Grade,

        CASE
            WHEN ca.Grade = 'A+' THEN c.Credit * 4.0
            WHEN ca.Grade = 'A'  THEN c.Credit * 4.0
            WHEN ca.Grade = 'A-' THEN c.Credit * 3.7
            WHEN ca.Grade = 'B+' THEN c.Credit * 3.3
            WHEN ca.Grade = 'B'  THEN c.Credit * 3.0
            WHEN ca.Grade = 'B-' THEN c.Credit * 2.7
            WHEN ca.Grade = 'C+' THEN c.Credit * 2.3
            WHEN ca.Grade = 'C'  THEN c.Credit * 2.0
            WHEN ca.Grade = 'C-' THEN c.Credit * 1.7
            WHEN ca.Grade = 'D+' THEN c.Credit * 1.3
            WHEN ca.Grade = 'D'  THEN c.Credit * 1.0
            WHEN ca.Grade = 'F'  THEN 0
            ELSE 0
        END AS Grade_Points
    FROM Final_Marks_Details final
    JOIN course c ON final.Course_Code = c.Course_code
    JOIN student_Grades ca ON final.Reg_no = ca.Reg_no AND final.Course_Code = ca.course_code
) AS Grade_Calculation
GROUP BY Grade_Calculation.Reg_no;  


