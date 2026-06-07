use companydb;

create table orders_for_joins (order_id int primary key,
	order_name varchar(40) not null);
    
create table customers (cust_id int primary key,
	cust_name varchar(30) not null,
    order_id int,
    foreign key(order_id) references orders_for_joins(order_id));

insert into orders_for_joins (order_id, order_name) values (101, 'Mobile');
insert into orders_for_joins (order_id, order_name) values (102, 'Laptop');
insert into orders_for_joins (order_id, order_name) values (103, 'TV');
insert into orders_for_joins (order_id, order_name) values (104, 'Fridge');
insert into orders_for_joins (order_id, order_name) values (105, 'Washing Machine');

    
insert into customers (cust_id, cust_name, order_id) values (1, 'John', 101);
insert into customers (cust_id, cust_name, order_id) values (2, 'Alice', 102);
insert into customers (cust_id, cust_name, order_id) values (3, 'Bob', 103);
insert into customers (cust_id, cust_name, order_id) values (4, 'Richard', 103);
insert into customers (cust_id, cust_name, order_id) values (5, 'William', null);


select * from orders_for_joins, customers;

select * from customers;
select * from orders_for_joins;


select c.cust_id, c.cust_name, o.order_name from customers c join orders_for_joins o on c.order_id = o.order_id;

select c.cust_id, c.cust_name, o.order_name from customers c left join orders_for_joins o on c.order_id = o.order_id;


--        2nf


create table customers_2nf(cust_id int,
	cust_name varchar(20),
    order_name varchar(30));

insert into customers_2nf values 
	(1, 'John', 'Idly'),
    (1, 'John', 'Dosa'),
    (1, 'John', 'Chapati'),
    (2, 'Alice', 'Masaladosa'),
    (3, 'Bob', 'Idly');

select * from customers_2nf;

-- table is in 1nf, but not in 2nf as there is a partial dependency, as the compositekey is (cust_id, order_name), and there is a dependency of cust_name only on part of the cust_id -> cust_name 

drop table customers_2nf;

create table customers_2nf (cust_id int primary key,
	cust_name varchar(20));

create table orders_2nf (cust_id int,
	order_name varchar(30),
    foreign key(cust_id) references customers_2nf(cust_id));
    
insert into customers_2nf values (1, 'John'), (2, 'Alice'), (3, 'Bob'), (4, 'Richard');

insert into orders_2nf values (1, 'Idly'), (1, 'Dosa'), (1, 'Chapati'), (2, 'Masaladosa'), (3, 'Idly');

select * from customers_2nf;
select * from orders_2nf;



--        3nf


create table customers_3nf (cust_id int,
	cust_name varchar(20),
    order_id int,
    order_name varchar(30));
    
insert into customers_3nf values
	(1, 'John', 1, 'Idly'),
    (2, 'Alice', 1, 'Idly'),
    (3, 'Bob', 2, 'Dosa'),
    (4, 'Richard', 1, 'Idly');
    
select * from customers_3nf;

-- table customers_3nf is in 2nf but not in 3nf, as there is no partial dependency, but there is tranitive dependency, cust_id -> cust_name, order_id; order_id -> order_name

drop table customers_3nf;


create table orders_3nf (order_id int primary key,
	order_name varchar(30));
    
create table customers_3nf (cust_id int primary key,
	cust_name varchar(20),
    order_id int,
    foreign key (order_id) references orders_3nf(order_id));
    
    
insert into customers_3nf values (1, 'John', 1), (2, 'Alice', 1), (3, 'Bob', 2), (4, 'Richard', 1);

insert into orders_3nf values (1, 'Idly'), (2, 'Dosa'), (3, 'Masaladosa');


select * from customers_3nf;
select * from orders_3nf;