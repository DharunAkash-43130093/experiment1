select* from worker2;
select* from worker2  order by JOINING_DATE asc ;
select DEPARTMENT,count(FIRST_NAME) as Total_Employee from worker2 group by DEPARTMENT order by Total_Employee asc;
select  DEPARTMENT,SALARY,WORKER_ID from worker2 group by DEPARTMENT,SALARY,WORKER_ID order by SALARY asc;
select count(*)from worker2 where DEPARTMENT not in('HR','Admin');
select DEPARTMENT,max(SALARY) as highest_salary from worker2 group by DEPARTMENT;
select upper(DEPARTMENT) from worker2;
select lower(FIRST_NAME) from worker2;
insert into worker2
(address)values('navalur'),('sholinganallur'),('sembakkam'),('porur'),('perungudi'),('thiruporur'),(