use companydb;

create table orders_for_aggregation(id int primary key,
	product_name varchar(30),
    quantity int,
    price decimal(10,2));

-- create table orders_for_aggregation like orders;

-- create table orders_for_aggregation as select * from orders;

insert into orders_for_aggregation select * from orders;
insert into orders_for_aggregation (id, product_name, quantity, price) values
	(8, 'Idly', 15, 75),
    (9, 'Chapati', 8, 160),
    (10, 'Dosa', 12, 240),
    (11, 'MasalaDosa', 5, 125);

select * from orders_for_aggregation;

select count(*) as total_orders from orders_for_aggregation;

select sum(price) as sum_of_prices from orders_for_aggregation;

select avg(price) as avg_order_price from orders_for_aggregation;

select product_name, sum(quantity) as total_sales from orders_for_aggregation group by product_name;

select min(price) as min_price, max(price) as max_price from orders_for_aggregation;

select product_name, sum(quantity) as total_sales from orders_for_aggregation group by product_name order by total_sales desc;
