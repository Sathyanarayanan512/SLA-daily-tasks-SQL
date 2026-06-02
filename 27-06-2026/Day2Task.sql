create database companyDB;
use companyDB;

create table employees (id int primary key auto_increment,
	name varchar(20) not null,
    salary int default (30000));
    
alter table employees add column email varchar(20), add constraint unq_email unique(email);

insert into employees (name, email) values ('John', 'john@gmail.com');
insert into employees (name, salary, email) values ('Alice', 40000, 'alice@gmail.com');
insert into employees (name, email) values 
	('Bob', 'bob@gmail.com'),
    ('Richard', 'richard@gmail.com');
insert into employees (name, salary, email) values ('Williams', 0, 'williams@gmail.com');

insert into employees (nmae, salary, email) values ('John', 45000, 'john@gmail.com');

select * from employees;


drop table employees;



create table employees (id int primary key auto_increment,
	name varchar(20) not null,
    salary int default (30000),
    constraint chk_salary check(salary>0));