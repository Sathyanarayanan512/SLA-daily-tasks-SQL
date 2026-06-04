use companydb;

create table events(id int primary key,
	event_name varchar(30),
    event_date date);
    
insert into events values
	(1, 'Interview', '2026-06-05'),
    (2, 'Meeting', '2026-08-29'),
    (3, 'Seminar', '2026-06-20'),
    (4, 'Testing', '2026-06-22');
    
select * from events;

select now() as current_datetime;
select now();
select current_timestamp;

select event_name, date_format(event_date, "%D %M %Y") from events;
select event_name, date_format(event_date, "%d %m %y") as formatted_date from events;
select event_name, date_format(event_date, "%d-%m-%y") as formatted_date from events;

select event_date, month(event_date) as month, year(event_date) as year from events;

select concat(event_name, " is on ", date_format(event_date, "%D %M of %Y")) as event_details from events;
select concat(event_name, " ", event_date) as details from events;
select concat(event_name, " ", ":", " ", event_date) from events;
select concat(event_name, event_date) as details from events;