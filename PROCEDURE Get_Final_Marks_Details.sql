
DELIMITER //

CREATE PROCEDURE Get_Final_Marks_Details(
    IN input_course_code VARCHAR(10),
    IN input_reg_no VARCHAR(30), 
    IN view_type VARCHAR(20) 
)
BEGIN
    IF LOWER(view_type) = 'batch' THEN
        SELECT * FROM Final_Marks_Details
        WHERE Course_Code = input_course_code;

    ELSEIF LOWER(view_type) = 'individual' THEN
        SELECT * FROM Final_Marks_Details
        WHERE Reg_no = input_reg_no;

    ELSE
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Invalid view_type parameter. Please use ''batch'' or ''individual''.';
    END IF;
END //

DELIMITER ;