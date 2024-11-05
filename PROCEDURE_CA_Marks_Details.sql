DELIMITER //

CREATE PROCEDURE Get_CA_Marks_Details(
    IN input_course_code VARCHAR(10),
    IN input_reg_no VARCHAR(30),
    IN view_type VARCHAR(20)
)
BEGIN
    IF LOWER(view_type) = 'batch' THEN
        SELECT * FROM CA_Marks_Details
        WHERE Course_Code = input_course_code;

    ELSEIF LOWER(view_type) = 'individual_course' THEN
        SELECT * FROM CA_Marks_Details
        WHERE Course_Code = input_course_code AND Reg_no = input_reg_no;

    ELSEIF LOWER(view_type) = 'individual_summary' THEN
        SELECT * FROM CA_Marks_Details
        WHERE Reg_no = input_reg_no;

    ELSE
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Invalid view_type parameter. Please use ''batch'', ''individual_course'', or ''individual_summary''.';
    END IF;
END //

DELIMITER ;