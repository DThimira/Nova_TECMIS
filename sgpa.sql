CREATE VIEW Student_SGPA AS
SELECT 
    fd.Reg_no,
    AVG(
        CASE 
            WHEN s.Status = 'Repeat' THEN 
                CASE 
                    WHEN fd.Final_Mark >= 55 THEN 2.0 
                    WHEN fd.Final_Mark >= 50 THEN 1.7
                    WHEN fd.Final_Mark >= 45 THEN 1.0
                    ELSE 0.0
                END
            ELSE 
                CASE 
                    WHEN fd.Final_Mark >= 85 THEN 4.0   -- A+
                    WHEN fd.Final_Mark >= 80 THEN 3.7   -- A
                    WHEN fd.Final_Mark >= 75 THEN 3.3   -- A-
                    WHEN fd.Final_Mark >= 70 THEN 3.0   -- B+
                    WHEN fd.Final_Mark >= 65 THEN 2.7   -- B
                    WHEN fd.Final_Mark >= 60 THEN 2.3   -- B-
                    WHEN fd.Final_Mark >= 55 THEN 2.0   -- C+
                    WHEN fd.Final_Mark >= 50 THEN 1.7   -- C
                    WHEN fd.Final_Mark >= 45 THEN 1.3   -- C-
                    WHEN fd.Final_Mark >= 40 THEN 1.0   -- D+
                    WHEN fd.Final_Mark >= 35 THEN 0.7   -- D
                    ELSE 0.0                            -- F
                END
        END
    ) AS SGPA
FROM 
    Final_Marks_Details fd
JOIN 
    student s ON fd.Reg_no = s.Reg_no 
GROUP BY 
    fd.Reg_no;




