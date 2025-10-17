Create table Books(
    Book_ID serial primary key,
	Title varchar(100),
	Aurthor varchar(100),
	Genre varchar(100),
	Pulished_year INT,
	Price numeric(10,2),
	stock int
);

CREATE TABLE Customers (
    Customer_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100), 
    Email VARCHAR(150),
    Phone VARCHAR(20),
    City VARCHAR(100),
    Country VARCHAR(100)
);





drop table Orders;
CREATE TABLE Orders (
    Order_ID SERIAL PRIMARY KEY,
    Customer_ID INT REFERENCES Customers(Customer_ID),
    Book_ID INT REFERENCES Books(Book_ID),
    Order_Date DATE,
    Quantity INT,
    Total_Amount NUMERIC(10,2)
);




SELECT * FROM Books;
SELECT * from  Orders;
select * from Customers;

--Retrieve all books int thr'FICTION GENRE:

SELECT * FROM Books
where genre = 'Fiction';


-- Find book published after the year 1950:
select * from Books
where pulished_year>1950;

-- list all the customers from canada
select * from Customers
where country = 'Canada';

--show order placed in novembers 2023;
select * from Orders
where order_date Between '2023-11-01' and '2023-11-30';


-- Retrieve total stock of book available

select sum(stock) as total_stock
from Books;


-- Find the most expensive book
select * from Books
order by price desc
limit 1;

--show all cutomers who ordered morethen 1 books
select * from Orders
where quantity >1;


-- Retrive all order where the total amount exceeds $20:
select * from Orders 
where total_amount >20;


--list all  unique geners avaialble in the books

select distinct genre from Books;

--Find the book the lowest stock
select * from Books 
order by stock asc
limit 1;

--calculate the total revenue generated from all orders
select sum(total_amount) as revenue
from Orders;



--Retrive  the total numbers of books for each genre
SELECT b.genre, sum(o.quantity) as total_book_sold
from Orders o
join Books b on o.book_id = b.book_id
Group by b.genre;


--FIND THE AVERAGE PRICR OF BOOK IN THE FANTASY GNERE

SELECT AVG(price) as average_price
from Books
where genre = 'Fantasy';


--list customers who have placed at least two order

SELECT o.customer_id, c.name, count(o.Order_id) as Order_count
from orders  o
join customers c ON o.customer_id = c.customer_id
GROUP BY o.customer_id,  c.name
Having count(Order_id) >=2;


---Find the most frequently ordered book
select o.Book_id, b.title, count(order_id) as order_count
from orders o
join books b on o.book_id = b.book_id
Group by o.Book_id, b.title
Order by order_count desc
Limit 1;


---show top 3 most expensive book

select * from Books
where genre = 'Fantasy'
order by price desc
limit 3;


--Retrive the total quanity of books sold by each aurthor
SELECT 
    b.aurthor, 
    SUM(o.quantity) AS Total_Books_Sold
FROM 
    Orders o
JOIN 
    Books b 
ON 
    o.book_id = b.book_id
GROUP BY 
    b.aurthor;


-- 7) List the cities where customers who spent over $30 are located:
SELECT DISTINCT c.city, total_amount
FROM orders o
JOIN customers c ON o.customer_id=c.customer_id
WHERE o.total_amount > 30;



SELECT * FROM Books;
SELECT * from  Orders;
select * from Customers;
-- 8) Find the customer who spent the most on orders:
select c.customer_id, c.name, sum(o.total_amount) as total_spent
from orders o
JOIN customers c on o.customer_id=c.customer_id
group by c.customer_id, c.name
order by total_spent desc limit 1;

--9) Calculate the stock remaining after fulfilling all orders:
select b.book_id, b.title, b.stock, coalesce(sum(o.quantity),0) as order_quantity,
	b.stock- coalesce(sum(o.quantity),0) as remain_quantity
from books b
left join orders o on b.book_id=o.book_id
group by b.book_id
order by b.book_id;



