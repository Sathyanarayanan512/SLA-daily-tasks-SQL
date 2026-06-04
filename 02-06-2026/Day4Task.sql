use companydb;

create table orders (id int primary key,
	product_name varchar(30),
    quantity int,
    price decimal(10,2));

insert into orders values
	(1, 'Idly', 10, 50),
    (2, 'Dosa', 5, 100),
    (3, 'Chapati', 10, 200),
    (4, 'Ravadosa', 5, 125),
    (5, 'Masaladosa', 1, 25),
    (6, 'Aalooparatha', 10, 300),
    (7, 'Naan', 15, 225);

select * from orders;

select * from orders where quantity > 2;

select * from orders where price between 100 and 500;
select * from orders where price >= 100 and price <= 500;

select * from orders where product_name like "a%";

select * from orders order by quantity desc;
select * from orders order by quantity desc, product_name asc;