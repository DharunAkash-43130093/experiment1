CREATE DATABASE ORG123;
SHOW DATABASES;
USE ORG123;

CREATE TABLE Worker2 (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

INSERT INTO Worker2
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');
        select*from Worker2
        where DEPARTMENT='Admin' and SALARY>=20000;
		select*from Worker2
        where DEPARTMENT='Account' or FIRST_NAME like '%i%';
		select*from Worker2
        where JOINING_DATE='14-02-20 09.00.00';
        select*from Worker2
        where not DEPARTMENT='Admin';
        select*from Worker2
		where DEPARTMENT='Admin' and SALARY<=100000;
		select*from Worker2
        where DEPARTMENT ='Account' and FIRST_NAME not like'V%';
        select*from Worker2
        where DEPARTMENT ='Account' and FIRST_NAME not like'_a%';
		select*from Worker2
        where WORKER_ID not in(1,3,5,7) and SALARY>=1000;
        select*from Worker2
        where DEPARTMENT not in ('HR','Admin') and SALARY between 70000 and 300000;
        select*from Worker2
        where FIRST_NAME like 'V%' and SALARY>=200000;
        select*from Worker2
        where not DEPARTMENT ='Admin' and SALARY<100000;
        select count(WORKER_ID) as no_of_workers from Worker2;
        select sum(SALARY) as Total_amount from Worker2;
        select min(SALARY) as lowset_salary from Worker2;
        select max(WORKER_ID) as highest_salar from Worker2;
        select avg(SALARY) as average_salary from Worker2 ;
		select min(SALARY) as lowset_salary from Worker2 where DEPARTMENT='HR';
		select avg(SALARY) as average_salary from Worker2 where DEPARTMENT='Admin';
        select sum(SALARY) as Total_amount from Worker2 where DEPARTMENT in ('HR','Admin');
        select count(WORKER_ID) as no_of_workers from Worker2 where FIRST_NAME like'v%';
        select sum(SALARY) as Total_amount from Worker2 where SALARY between 50000 and 200000;
        select *, Case
		when salary >= 300000 then "rich"
        when salary >=100000 and salary <=300000 then "middle"
        else "poor"
	end 
    As satusbasedonsalary
    from worker2;
    
    select  salary from worker2
    union 
    select department from worker2;
    
    select salary from worker2
    union all
	select department from worker2;
    
    select distinct (department) as unique_value
    from worker2;