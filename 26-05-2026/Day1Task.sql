create database schoolDB1;
use schoolDB1;
create table students (id int primary key, name varchar(100) not null, age int, grade char(1));
insert into students (id, name, age, grade) values (1, 'John', 15, 'A'), (2, 'Alice', 15, 'A'), (3, 'Bob', 14, 'B'), (4, 'Richard', 15, 'A'), (5, 'James', 14, 'A');
select * from students;

drop database schoolDB1;
use schoolDB1;