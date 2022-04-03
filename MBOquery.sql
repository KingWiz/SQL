create database MBO;
use MBO;

create table Employee(
eID	int primary key auto_increment,
eName	varchar(20)	not null,
eAddress	varchar(20)	not null,
eSalary	int	not null,
dID	int
);
select * from Employee;
drop table Employee;

/* Database Control Language (DCL) */
create view EmpList as select eName, eSalary from Employee where eSalary>5000;
select * from EmpList;
drop view EmpList;

/* Creating a User */
create user 'KingWiz' identified by 'passKW';

/* Privileges in SQL */
grant select,insert on EmpList to 'KingWiz';

/* Revoking of Privileges */
revoke insert on EmpList from 'KingWiz';

/* Creating a Role */
create role Receptionist;

/* Granting privileges to the Role */
grant select on Employee to Receptionist;

/* Assigning Roles to the Various Users */
grant Receptionist to 'KingWiz';


create table Department(
dID	int	primary key auto_increment,
dName	varchar(20)	not null,
dCategory	varchar(20) not null
);
select * from Department;
drop table Department;

insert into Employee(eName, eAddress, eSalary, dID)
values('Prashil', 'Ktm', 900000, 1),
	('Krishna', 'Pkr', 800000, 2),
    ('Nabin', 'Pkr', 700000, 3),
    ('Kaushal', 'Ktm', 600000, 1),
    ('Sandip', 'Bkt', 500000, 2);

insert into Department(dName, dCategory)
values('A', 'Marketing'),
	('B', 'Designing'),
    ('C', 'Manufacturing');

alter table Employee
add constraint fk_dID foreign key (dID) references Department(dID);