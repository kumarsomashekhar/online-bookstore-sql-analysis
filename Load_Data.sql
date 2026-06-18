--import data into books table
COPY Books(Book_ID,Title,Author,Genre,Published_Year,Price,Stock)
FROM 'E:\SQLProjects\OnlineBookStore\Books.csv'
DELIMITER ','
CSV HEADER;

--import data in customers table

COPY Customers(Customer_ID,Name,Email,Phone,City,Country)
FROM 'E:\SQLProjects\OnlineBookStore\Customers.csv'
DELIMITER ','
CSV HEADER;

--import data into order table

COPY Orders(Order_ID,Customer_ID,Book_ID,Order_Date,Quantity,Total_Amount)
FROM 'E:\SQLProjects\OnlineBookStore\Orders.csv'
DELIMITER ','
CSV HEADER;

select * from Books;
select * from Customers;
select * from Orders;