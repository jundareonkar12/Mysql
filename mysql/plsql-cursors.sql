delimiter ;
drop procedure if exists empstatus;
delimiter //
create procedure empstatus()
begin
declare vstatus varchar(50);
declare vsal,veno,vdeptno,avgsal,cend int default 0;
declare empcur cursor for select empno,e.deptno,sal,(select avg(sal) from emp where deptno=e.deptno) avgsal from emp e inner join dept d on e.deptno=d.deptno;
declare continue handler for NOT FOUND set cend=1;
open empcur;

label1: loop
fetch empcur into veno,vdeptno,vsal,avgsal;
if cend = 1 then
leave label1;
end if;
if vsal > avgsal then
set vstatus="Greater than dept average";
end if;
if vsal < avgsal then
set vstatus="Lower than dept average";
end if;
if vsal = avgsal then
set vstatus="Equal to dept average";
end if;
select veno,vdeptno,vsal,vstatus;
end loop;
close empcur;


end //
delimiter ;
call empstatus;