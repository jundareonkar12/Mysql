DELIMITER ;
DROP PROCEDURE IF EXISTS SimpleCompare;
DELIMITER //
CREATE FUNCTION SimpleCompare(n INT, m INT)
  RETURNS VARCHAR(20)
  BEGIN
    DECLARE s VARCHAR(20);
    IF n > m THEN SET s = '>';
    ELSEIF n = m THEN SET s = '=';
    ELSE SET s = '<';
    END IF;
    SET s = CONCAT(n, ' ', s, ' ', m);
    RETURN s;
  END //
DELIMITER ;