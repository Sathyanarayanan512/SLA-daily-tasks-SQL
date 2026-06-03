use companydb;

create table products (id int primary key auto_increment,
	name varchar(20) not null,
    price int not null);

alter table products add column stock int;

alter table products rename column price to unit_price;

insert into products (name, unit_price, stock) values
	('Gun', 35000, 5),
    ('Sword', 20000, 10),
    ('Axe', 20000, 12),
    ('Hammer', 1000, 22),
    ('Bow&Arrow', 18000, 16);

select * from products;

update products set stock = 18 where id = 1;

delete from products where id = 5;
