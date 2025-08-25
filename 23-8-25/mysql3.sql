create database hi; 
use hi;
create table class(
id int  primary key,
fname varchar(50) not null,
lname varchar(50) not null,
age int 
check(age>=18)
check (id>=20)
);
insert into class values (11,"yogi","i",22),(1,"man","i",18);
select * from class;