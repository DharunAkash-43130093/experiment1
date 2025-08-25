create database hii; 
use hii;
create table cat(
cid int  primary key,
cname varchar(50) not null,
cdesc varchar(50) not null
);
insert into cat values (01,"elec","sdhgjdshcshbcbs"),(02,"furniture","sdzfscs");
select * from cat;
create table pro(
pid int not null,
pname varchar(50) not null,
pdesc varchar(55) not null,
cid int not null,
FOREIGN KEY (cid) REFERENCES cat(cid)
);
insert into pro values(100,"sbdf","qhvhvdahv",02),(200,"jjhzbc","gavdnvx",01);
select * from pro;