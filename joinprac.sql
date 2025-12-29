create table customer(id int primary key,Name varchar(200),
city varchar(20))
create table orders (orderid int primary key,order_name varchar(200),
order_loc varchar(20),id int,foreign key(id) references customer(id));


select c.id,c.Name,o.order_name,o.order_loc from 
customer c
inner join 
orders o ON
c.id=o.orderid

select c.id,c.Name,o.order_name,o.order_loc from 
customer c
left join 
orders o ON
c.id=o.orderid


select c.id,c.Name,o.order_name,o.order_loc from 
customer c
right join 
orders o ON
c.id=o.orderid



INSERT INTO Customer VALUES 
(1, 'Amit', 'Pune'),
(2, 'Rohit', 'Mumbai'),
(3, 'Sneha', 'Delhi'),
(4, 'Priya', 'Nashik');

INSERT INTO Orders VALUES
(101,  'Laptop', 'dehu',1),
(102,  'Mouse', 'dd',3),
(103,  'Keyboard', 'dff',4),
(104,  'Monitor', 'asd',2);   -- customer_id 5 doesn't exist
