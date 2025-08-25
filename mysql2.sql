show databases;
create database sathyabama;
use sathyabama;
create table ece(
sid int,
sname varchar(30),
smar int
);
show tables from sathyabama;
desc ece;
select * from ece;
set SQL_SAFE_UPDATES=0;
insert into ece value (1001,"yogi",100),(1002,"manish",105);
alter table ece add column semail varchar(30)
 ;
alter table ece add column smark int;
update  ece set sname="mani"
where sid=1002;
update ece set semail="yogi";
delete  from ece where sid=10;
start transaction ;
savepoint a;
delete from ece where sname="mani";
rollback to a;
commit;