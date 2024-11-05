DELIMITER $$

CREATE PROCEDURE Get_Eligibility_Status(
    IN course_code VARCHAR(10), 
    IN reg_no VARCHAR(20)
)
BEGIN
    IF reg_no IS NOT NULL AND reg_no != '' THEN
        SELECT 
            Reg_no, 
            Final_CA_Mark, 
            attendance_percentage, 
            Eligibility_Status 
        FROM 
            CA_Eligibility_Status 
        WHERE 
            Reg_no = reg_no 
            AND Course_Code = course_code;
    ELSE
        SELECT 
            Reg_no, 
            Final_CA_Mark, 
            attendance_percentage, 
            Eligibility_Status 
        FROM 
            CA_Eligibility_Status 
        WHERE 
            Course_Code = course_code;
    END IF;
END $$

DELIMITER ;
