create database ORG1234;
show databases;
use ORG1234;
create table trim (
myname char(20)
);
insert into trim (myname)values("dharun   "),("    akash"),("   david  " );
select * from trim;
select trim(myname) from trim;
select rtrim(myname) from trim;
select ltrim(myname) from trim;