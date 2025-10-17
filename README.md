# bookstore-sql-project
A SQL project for managing books, customers, and orders in a bookstore database.
# 📚 Bookstore Database Project (SQL)

## 🧾 Overview
This project is a **Bookstore Database Management System** built using **SQL**.  
It demonstrates database design, relationships, and data analysis through queries.  
The project includes tables for **Books**, **Customers**, and **Orders**, along with a variety of SQL operations to retrieve, analyze, and summarize data.

---

## 🏗️ Database Structure

### 1️⃣ Books Table
Stores information about books available in the store.

| Column | Type | Description |
|--------|------|-------------|
| Book_ID | SERIAL PRIMARY KEY | Unique identifier for each book |
| Title | VARCHAR(100) | Name of the book |
| Aurthor | VARCHAR(100) | Author name |
| Genre | VARCHAR(100) | Category or genre |
| Pulished_Year | INT | Year the book was published |
| Price | NUMERIC(10,2) | Price of the book |
| Stock | INT | Quantity available in stock |

---

### 2️⃣ Customers Table
Stores customer details.

| Column | Type | Description |
|--------|------|-------------|
| Customer_ID | SERIAL PRIMARY KEY | Unique identifier for each customer |
| Name | VARCHAR(100) | Customer name |
| Email | VARCHAR(150) | Email address |
| Phone | VARCHAR(20) | Contact number |
| City | VARCHAR(100) | Customer’s city |
| Country | VARCHAR(100) | Customer’s country |

---

### 3️⃣ Orders Table
Stores information about customer orders.

| Column | Type | Description |
|--------|------|-------------|
| Order_ID | SERIAL PRIMARY KEY | Unique order ID |
| Customer_ID | INT | References Customers(Customer_ID) |
| Book_ID | INT | References Books(Book_ID) |
| Order_Date | DATE | Date of the order |
| Quantity | INT | Number of books ordered |
| Total_Amount | NUMERIC(10,2) | Total cost of the order |

---

## 🧠 SQL Queries and Analysis

This project demonstrates key SQL concepts including:

### 🔍 Data Retrieval
- Get all books from the **Fiction** genre  
- Find books published **after 1950**  
- List all customers from **Canada**

### 📊 Data Aggregation
- Calculate **total stock** of books  
- Find **most expensive** or **lowest stock** books  
- Compute **total revenue** from all orders  

### 📈 Analytical Queries
- Show **top 3 most expensive books** in the Fantasy genre  
- Retrieve **total books sold per author**  
- Find **customers who placed at least 2 orders**  
- Identify **the most frequently ordered book**  
- Calculate **remaining stock after all orders**

---

## 🧰 How to Use

### Step 1️⃣: Create a Database
```sql
CREATE DATABASE bookstore_db;
