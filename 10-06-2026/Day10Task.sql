use companydb;

create table employees_day10task(emp_id int primary key, emp_name varchar(30) not null, department varchar(30) not null, salary decimal(10,2) not null);

create table products_day10task(product_id int primary key, product_name varchar(30) not null, product_price decimal(10,2) not null, stock int not null);
create table orders_day10task(order_id int primary key, product_id int not null, quantity int not null,  price decimal(10,2),
		foreign key (product_id) references products_day10task(product_id));

-- drop table employees_day10task;
-- drop table products_day10task;
-- drop table orders_day10task;

insert into employees_day10task values (1, 'John', 'IT', 20000), (2, 'Alice', 'HR', 26000), (3, 'Bob', 'IT', 18000), (4, 'Richard', 'Sales', 25000), (5, 'Williams', 'Admin', 20000);

insert into products_day10task values(101, 'Casual Shirt', 300, 13), (102, 'Formal Shirt', 270, 18), (103, 'Formal Pant', 500, 20), (104, 'Jeans Pant', 650, 10), (105, 'Belt', 250, 25);
insert into orders_day10task (order_id, product_id, quantity) values (1, 101, 2), (2, 102, 3), (3, 103, 2), (4, 104, 1), (5, 105, 2), (6, 103, 2);

select * from employees_day10task;

select * from products_day10task;
select * from orders_day10task;


delimiter //
create procedure InsertNewEmployee(in emp_id int, in emp_name varchar(30), department varchar(30), salary decimal(10,2))
begin
	insert into employees_day10task values(emp_id, emp_name, department, salary);
end //
delimiter ;

call InsertNewEmployee(6, 'Michael', 'Admin', 20000);

select * from employees_day10task;



delimiter //
create procedure UpdateSalary(in target_emp_id int, in new_salary decimal(10,2))
begin
	update employees_day10task set salary = new_salary where emp_id = target_emp_id;
end //
delimiter ;

call UpdateSalary(1, 25000);

select * from employees_day10task;



delimiter //
create trigger UpdateStockAndPriceBeforeInsert
before insert 
on orders_day10task
for each row
begin
	declare price_update decimal(10,2);
    declare available_stock int;
    
    -- updating stock in products_day10task
    select stock into available_stock from products_day10task where product_id = new.product_id;
    if new.quantity <= available_stock then
		update products_day10task set stock = stock - new.quantity where product_id = new.product_id;
    else
		signal sqlstate '45000'
        set message_text = 'Required quantity is more than stock';
    end if;
    
	-- setting price
    select product_price into price_update from products_day10task where product_id = new.product_id;
    set new.price = price_update * new.quantity;
end //
delimiter ;

-- drop trigger UpdateStockAndPriceBeforeInsert;

insert into orders_day10task (order_id, product_id, quantity) values (7, 101, 4); 
insert into orders_day10task (order_id, product_id, quantity) values (8, 101, 4);
insert into orders_day10task (order_id, product_id, quantity) values (9, 101, 4);

select * from orders_day10task;


SHOW TRIGGERS;



delimiter //
create trigger BeforeDeletingAdmin
before delete
on employees_day10task
for each row
begin
	if old.department = "Admin" then
		signal sqlstate '45000'
        set message_text = "Admins can't be deleted";
	end if;
end //
delimiter ;

delete from employees_day10task where emp_id = 5;




delimiter //
create procedure FetchAllEmployees()
begin
	select * from employees_day10task;
end //
delimiter ;

call FetchAllEmployees();


drop procedure FetchAllEmployees;
drop trigger UpdateStockAndPriceBeforeInsert;