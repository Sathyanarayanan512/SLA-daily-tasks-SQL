use companydb;

create table employees_day8task (emp_id int primary key, emp_name varchar(20) not null, department varchar(20) not null, salary decimal(10,2) not null);
create table products_day8task (prod_id int primary key, prod_name varchar(30) not null, price decimal(10,2) not null);
create table orders_day8task (order_id int primary key, order_name varchar(30) not null);
create table customers_day8task (cust_id int primary key, cust_name varchar(20) not null, order_id int,
	foreign key(order_id) references orders_day8(order_id));

insert into employees_day8task values (1, 'John', 'IT', 20000), (2, 'Alice', 'HR', 28000), (3, 'Bob', 'Sales', 30000), (4, 'Richard', 'IT', 12000), (5, 'William', 'HR', 40000);
insert into products_day8task values (11, 'Mobile', 20000), (12, 'Laptop', 40000), (13, 'Tablet', 30000), (14, 'Watch', 2000), (15, 'TV', 40000);
insert into orders_day8task values (101, 'Idly'), (102, 'Dosa'), (103, 'Masaladosa'), (104, 'Chapati'), (105, 'Upma');
insert into customers_day8task values (1001, 'John', 101), (1002, 'Alice', 101), (1003, 'Bob', 104), (1004, 'Richard', 102), (1005, 'Williams', null);

select avg(salary) as avg_salary from employees_day8task;
select * from employees_day8task where salary > (select avg(salary) from employees_day8task);

select min(price) as cheapest_price from products_day8task;
select * from products_day8task where price > (select min(price) from products_day8task);

select * from customers_day8task c where exists(select * from orders_day8task o where c.order_id = o.order_id);

select * from customers_day8task;
select order_id, order_name, (select count(*) from customers_day8task c where  c.order_id = o.order_id) as no_of_orders from orders_day8task o;

select * from employees_day8task;
select department, salary as highest_salary from employees_day8task e1 where salary = (select max(salary) from employees_day8task e2 where e1.department = e2.department);

select * from products_day8task;
select * from products_day8task p1 where exists (select * from products_day8task p2 where p1.prod_id = p2.prod_id);