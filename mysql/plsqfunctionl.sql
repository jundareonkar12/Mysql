delimiter ;
DROP FUNCTION IF EXISTS costTOcompany;
SET GLOBAL log_bin_trust_function_creators = 1;
delimiter ##
CREATE FUNCTION costTOcompany(fempno int(4)) RETURNS decimal(9,2)
begin
	DECLARE empAllowance decimal(9,2);
	DECLARE vsal decimal(9,2);
	DECLARE vyears int;
	SELECT sal, 
		   FLOOR(DATEDIFF(CURDATE(), e.hiredate)/365) 
		INTO vsal, vyears 
	FROM emp 
	WHERE empno = fempno;
	/*DA 10, HRA 20, TA 8*/
	IF vyears < 32 THEN
		SET empAllowance = (vsal* 0.15) + (vsal*0.2) + (vsal*0.08) + (vsal*0);
	ELSEIF vyears <= 35 THEN
		SET empAllowance = (vsal* 0.15) + (vsal*0.2) + (vsal*0.08) + (vsal*0.1);
	ELSEIF vyears <= 37  THEN
		SET empAllowance = (vsal* 0.15) + (vsal*0.2) + (vsal*0.08) + (vsal*0.2);
	ELSE  
		SET empAllowance = (vsal* 0.15) + (vsal*0.2) + (vsal*0.08) + (vsal*0.3);
	END IF;
	RETURN empAllowance;
end##
delimiter ;