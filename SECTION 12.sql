CREATE table customers(
    ID INT AUTO_INCREMENT PRIMARY KEY,
    First_name VARCHAR(100),
    Last_name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE orders(
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES customers(id)
);

insert INTO customers(First_name,Last_name,email)
VALUES('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');


SELECT order_date,amount,customer_id 
from orders
where customer_id in (
    select ID from customers
    where Last_name = 'George'
);--sub query

select * from customers,orders where customers.id = orders.customer_id;

select First_name,Last_name,order_date,amount
from customers, orders
where customers.id = orders.customer_id;

select customers.First_name,customers.Last_name, orders.order_date,SUM(orders.amount) as total_spent
from orders
inner JOIN customers on customers.ID = orders.customer_id
GROUP BY orders.customer_id;

--left join

select First_name, Last_name,
IFNULL(SUM(amount),0) as total_spent
from customers
left join orders 
    on customers.id = orders.customer_id
GROUP by customers.id
order by total_spent;

select *
from customers
right join orders
    on customers.id = orders.customer_id;

select First_name,Last_name,order_date,amount
from customers
left join orders
    on customers.id = orders.customer_id;

select 
    IFNULL(First_name,'missing') As first,
    ifnull(Last_name,'user') As last,
    order_date,
    amount,
    sum(amount)
from customers
right join orders
    on customers.id = orders.customer_id
group by first_name, last_name;

SELECT 
    IFNULL(first_name,'MISSING') AS first, 
    IFNULL(last_name,'USER') as last, 
    order_date, 
    amount, 
    SUM(amount)
FROM customers
RIGHT JOIN orders
    ON customers.id = orders.customer_id
GROUP BY first_name, last_name;

CREATE TABLE STUDENTS(
    id int AUTO_INCREMENT PRIMARY key,
    first_name VARCHAR(100)

);

create table PAPERS (
    title VARCHAR(100),
    grade INTEGER,
    student_id INT,
    FOREIGN KEY (student_id) REFERENCES STUDENTS(id)
);

select first_name,title,grade
from STUDENTS
inner join PAPERS on PAPERS.student_id = STUDENTS.id 
group by grade
order by grade DESC;

select first_name,ifnull(title,'MISSING'),ifnull(grade,'0')
from STUDENTS
left join PAPERS on PAPERS.student_id = STUDENTS.id;

Select first_name, 
ifnull(grade,'0') AS average,
IF(AVG(grade)>60,'PASSING','FAILING') as passing_status
from STUDENTS
left join PAPERS on PAPERS.student_id = STUDENTS.id
group by first_name
order by grade DESC;




