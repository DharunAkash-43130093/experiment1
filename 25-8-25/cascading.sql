show databases;
create database colleges;
use colleges;

create table college(
collegeid int primary key,
collegename varchar(50) not null,
);
insert into college
values(001,'Sathyabama'),
	(002,'SRM'),(003,'SSN');

create table department(
    departmentid int primary key,
    departmentname varchar(30) not null,
    collegeid int not null,
    foreign key(collegeid) references college(collegeid)
     on delete cascade
     on update cascade
    );
     
     insert into department 
     values(01,'ECE',001),
     (02,'CSE',001),
     (03,'ECE',002),
     (04,'CSE',002),
     (05,'ECE',003),
     (06,'CSE',003);
     
     create table employee(
     eid int primary key,
     ename varchar(50) not null,
     departmentid int not null,
     foreign key(departmentid) references department(departmentid)
     on delete cascade
     on update cascade
     );
     
     insert into employee 
     values(001,'muthu',01),
     (002,'saravana',02),
     (003,'raman',06),
     (004,'vishnu',04);