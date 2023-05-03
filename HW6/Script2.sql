USE workshem;
DROP PROCEDURE even_numbers;
DELIMITER //
CREATE PROCEDURE even_numbers()
BEGIN
    DECLARE n INT DEFAULT 0;
    DECLARE result VARCHAR(50) DEFAULT '';
    WHILE n < 10 DO
		SET n = n + 2;
        SET result = CONCAT(result, ' ', n);
	END WHILE;
SELECT result;
END //
DELIMITER ;

CALL even_numbers();