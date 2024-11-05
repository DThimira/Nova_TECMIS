CREATE VIEW Student_CGPA AS
SELECT 
    s.Reg_no,
    AVG(sg.SGPA) AS CGPA
FROM 
    Student_SGPA sg
JOIN 
    student s ON sg.Reg_no = s.Reg_no
GROUP BY 
    s.Reg_no;



