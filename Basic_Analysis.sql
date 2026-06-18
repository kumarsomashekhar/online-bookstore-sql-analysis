--Basic Queries

--retrieve all the books in the 'fiction' genre

select * from Books where genre = 'Fiction';

--find all the books after the year 1950

select * from Books where published_year >1950;

--lisyt all the customer from canada

select * from Customers;

select * from Customers where country = 'Canada';

--show orders placed in nov 2023

select * from Orders;

select * from Orders where order_date Between '2023-11-01' and '2023-11-30';

--retrieve the total stocks of books available
select * from Books;

select sum(stock) as Total_Stock from Books;

--fins the details of most expensive book

select * from Books order by price desc limit 1;

--show all the customers who ordered more than 1 quantity of book

select * from Orders 
where quantity >1;

--retrieve all the order where total amount exceeds $20
select * from Orders where total_amount >20;

--list all the genres available in books table

select Distinct genre from Books;

--find the book with lowest stock

select * from Books;

select * from Books order by stock asc limit 1; 

--cal the totla revenue generated from all the orders
select * from Orders;

select sum(total_amount) as Total_Revenue from Orders;
