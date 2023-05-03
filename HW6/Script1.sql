USE workshem;
DELIMITER //
CREATE FUNCTION conver_time(n INT)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
	DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE seconds_remaining INT;
    DECLARE converter_time VARCHAR(255);
    SET days = FLOOR(n / 86400);
    SET seconds_remaining = n MOD 86400;  -- MOD выражает операцию получения остатка при делении
    SET hours = FLOOR(seconds_remaining / 3600);
    SET seconds_remaining = seconds_remaining MOD 3600;
    SET minutes = FLOOR(seconds_remaining / 60);
    SET seconds_remaining = seconds_remaining MOD 60;
    SET converter_time = CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', seconds_remaining, ' seconds ');
    RETURN converter_time;
END //
DELIMITER ;

SELECT conver_time(123456);