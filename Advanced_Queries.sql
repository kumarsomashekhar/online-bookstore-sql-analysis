--ADVANCED Queries
select * from Books;
select * from Orders;

--1.Retrieve the totla number of books sold for each genre
select b.genre,sum(o.quantity) as Total_Books_Sold from Orders as o inner join 
Books as b on o.book_id = b.book_id 
group by b.genre;

-- 2) Find the average price of books in the "Fantasy" genre:

select avg(price) as Average_price from Books where genre='Fantasy';

-- 3) List customers who have placed at least 2 orders:

select customer_id,count(order_id) as order_count
from orders
group by customer_id
having count(order_id)>=2;

--using join

select c.name,o.customer_id,count(o.order_id) as order_count
from orders as o inner join Customers as c
on o.customer_id = c.customer_id
group by o.customer_id,c.name
having count(o.order_id)>=2
order by c.customer_id;

-- 4) Find the most frequently ordered book:
select * from Orders;

select book_id, count(order_id) as order_count
from Orders group by book_id
order by order_count desc limit 5;

--using join
select * from Books;

select b.title,o.book_id, count(o.order_id) as order_count
from Orders as o inner join
Books as b on o.book_id = b.book_id
group by o.book_id,b.title
order by order_count desc limit 1;

-- 5) Show the top 3 most expensive books of 'Fantasy' Genre :
select * from Books;

select * from Books where genre = 'Fantasy' 
order by price desc limit 3;

-- 6) Retrieve the total quantity of books sold by each author:
select * from Books;
select * from Orders;

select b.author,sum(o.quantity) as Quantity_Author from Orders as o inner join
Books as b on o.book_id = b.book_id
group by b.author
;

-- 7) List the cities where customers who spent over $30 are located:
select * from Orders;
select * from Customers;

select Distinct c.city,o.total_amount from Orders as o 
inner join Customers as c 
on o.customer_id = c.customer_id
where o.total_amount >300;

-- 8) Find the customer who spent the most on orders:

SELECT
    c.customer_id,
    c.name,
    SUM(o.total_amount) AS Total_spent
FROM Orders AS o
INNER JOIN Customers AS c
    ON o.customer_id = c.customer_id
GROUP BY
    c.customer_id,
    c.name
ORDER BY
    Total_spent DESC
LIMIT 1;

--9) Calculate the stock remaining after fulfilling all orders:

select b.book_id,b.title,b.stock,
coalesce(sum(o.quantity),0) as order_quantity,
b.stock - coalesce(sum(o.quantity),0) as stock_remaining
from Books as b
left join Orders as o
on b.book_id = o.book_id
group by b.book_id
order by b.book_id;