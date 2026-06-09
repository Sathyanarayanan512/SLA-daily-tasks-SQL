use companydb;

create table sales_day9task(id int primary key,
	product_name varchar(30) not null,
    amount decimal(10,2) not null);

insert into sales_day9task values (1, 'Mobile', 28000), (2, 'Laptop', 35000), (3, 'Tablet', 32000), (4, 'Mobile', 40000), (5, 'Laptop', 45000), (6, 'TV', 40000), (7, 'Monitor', 32000);

select *, row_number() over(order by amount desc) as sales_rank from sales_day9task;

select product_name, amount, rank() over(order by amount desc) from sales_day9task;

select product_name, amount, dense_rank() over(order by amount desc) from sales_day9task;

select *, sum(amount) over(rows between unbounded preceding and current row) from sales_day9task;

with sales_above_average as(
	select product_name, amount from sales_day9task where amount > (select avg(amount) from sales_day9task)
)
select * from sales_above_average;
select avg(amount) from sales_day9task;

with sales_above_average as(
	select product_name, amount, avg(amount) over() as average_amount from sales_day9task
)
select * from sales_above_average where amount > average_amount;