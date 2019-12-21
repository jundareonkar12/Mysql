DROP PROCEDURE IF EXISTS empsal;
delimiter //
create  procedure empsal(in pempno int ,out ctc float)
	begin
		declare experience int;
		declare salary float;
		select  floor((datediff(curdate(),hiredate))/365),sal into experience,salary
		from ppac.emp e where empno=pempno;
		if experience<36 then
			set ctc=salary+ salary*0.15 + salary*0.2 + salary*0.08;
		elseif experience <=37 then
			set ctc=salary+ salary*0.15 + salary*0.2 + salary*0.08 + salary*0.1;
		elseif experience<=38 then
			set ctc=salary+ salary*0.15 + salary*0.2 + salary*0.08 + salary*0.2;
		else 
			set ctc=salary+ salary*0.15 + salary*0.2 + salary*0.08 + salary*0.3;
		end if;
		select ctc;
end//
delimiter ;
call empsal(7788,@c);