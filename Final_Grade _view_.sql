CREATE VIEW Final_Grade AS
SELECT 
    final.Reg_no,
    final.Course_Code,
    final.Final_CA_Marks_40,
    final.End_Score_100 ,
    final.Final_Mark,




    CASE 
        WHEN s.state = 'suspend' THEN 'WH' 
        WHEN final.End_Score_100 IS NULL THEN 'Invalid' 
        WHEN s.state = 'repeat' AND final.End_Score_100> 55 THEN 'C' 
        WHEN m.Medical_ID IS NOT NULL THEN 'MC' 
        WHEN final.End_Score_100 >= 85 AND final.Final_Mark_Out_of_100 <= 100 THEN 'A+'
        WHEN final.End_Score_100>= 80 AND End_Score_100 < 85 THEN 'A'
        WHEN final.End_Score_100 >= 75 AND End_Score_100 < 80 THEN 'A-'
        WHEN final.End_Score_100 >= 70 AND End_Score_100 < 75 THEN 'B+'
        WHEN final.End_Score_100>= 65 AND End_Score_100 < 70 THEN 'B'
        WHEN final.End_Score_100>= 60 AND End_Score_100 < 65 THEN 'B-'
        WHEN final.End_Score_100 >= 55 AND End_Score_100< 60 THEN 'C+'
        WHEN final.End_Score_100 >= 50 AND End_Score_100 < 55 THEN 'C'
        WHEN final.End_Score_100>= 45 AND End_Score_100 < 50 THEN 'C-'
        WHEN final.End_Score_100 >= 40 AND End_Score_100 < 45 THEN 'D+'
        WHEN final.End_Score_100 >= 35 AND End_Score_100 < 40 THEN 'D'
        WHEN final.End_Score_100>= 0 AND End_Score_100 < 35 THEN 'F'
        ELSE 'Invalid' 
    END AS Grade

FROM Final_Mark final
JOIN student s ON final.Reg_no  = s.Reg_no 
LEFT JOIN END_Exam_M ee ON final.Reg_no  = ee.Reg_no  AND final.Course_Code = ee.Course_Code
LEFT JOIN CA_Exam_M ca ON final.Reg_no = ca.Reg_no  AND final.Course_Code = ca.Course_Code 
LEFT JOIN medical m ON ca.Medical_ID = m.Medical_ID; 

--fsdfh