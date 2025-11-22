CREATE DATABASE Sales;
USE Sales;
 
CREATE TABLE product (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(50) NOT NULL,
  date_received DATE NOT NULL,
  product_price DECIMAL(10,2) NOT NULL,
  purchased_quantity INT NOT NULL,
  stock_quantity INT NOT NULL
);
 
CREATE TABLE purchase (
  purchase_id INT PRIMARY KEY,
  customer_id INT NOT NULL,
  customer_name VARCHAR(50) NOT NULL,
  product_name VARCHAR(50) NOT NULL,
  product_id INT NOT NULL,
  purchase_date DATE NOT NULL,
  purchased_amount DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (product_id) REFERENCES product(product_id)
);
 
INSERT INTO product (product_id, product_name, date_received, product_price, purchased_quantity, stock_quantity)
VALUES 
(1, 'Laptop', '2022-01-01', 999.99, 50, 20),
(2, 'Smartphone', '2022-01-02', 499.99, 30, 15),
(3, 'Headphones', '2022-01-03', 89.99, 100, 50),
(4, 'Tablet', '2022-01-04', 299.99, 25, 10),
(5, 'Camera', '2022-01-05', 799.99, 20, 8),
(6, 'Printer', '2022-01-06', 199.99, 40, 18),
(7, 'Monitor', '2022-01-07', 349.99, 35, 12),
(8, 'Keyboard', '2022-01-08', 49.99, 120, 80),
(9, 'Mouse', '2022-01-09', 19.99, 150, 100),
(10, 'External Hard Drive', '2022-01-10', 129.99, 60, 25),
(11, 'Desk Chair', '2022-01-11', 79.99, 80, 40),
(12, 'Desk Lamp', '2022-01-12', 29.99, 200, 150),
(13, 'Wireless Router', '2022-01-13', 69.99, 30, 15),
(14, 'Coffee Maker', '2022-01-14', 39.99, 100, 50),
(15, 'Backpack', '2022-01-15', 49.99, 75, 30),
(16, 'External Monitor', '2022-01-16', 249.99, 40, 18),
(17, 'Graphic Tablet', '2022-01-17', 159.99, 15, 8),
(18, 'Desk Organizer', '2022-01-18', 19.99, 120, 80),
(19, 'Wireless Mouse', '2022-01-19', 29.99, 90, 40),
(20, 'Power Bank', '2022-01-20', 39.99, 50, 25),
(21, 'Fitness Tracker', '2022-01-21', 79.99, 25, 10),
(22, 'Bluetooth Speaker', '2022-01-22', 89.99, 60, 25),
(23, 'USB Hub', '2022-01-23', 19.99, 80, 40),
(24, 'Wireless Headset', '2022-01-24', 129.99, 30, 15),
(25, 'Digital Watch', '2022-01-25', 59.99, 100, 50);
 
INSERT INTO purchase (purchase_id, customer_id, customer_name, product_name, product_id, purchase_date, purchased_amount)
VALUES 
(1, 101, 'John Doe', 'Laptop', 1, '2022-01-26', 1999.75),
(2, 102, 'Jane Smith', 'Smartphone', 2, '2022-01-27', 749.50),
(3, 103, 'Bob Johnson', 'Headphones', 3, '2022-01-28', 150.00),
(4, 104, 'Alice Brown', 'Tablet', 4, '2022-01-29', 449.99),
(5, 105, 'Charlie Davis', 'Camera', 5, '2022-01-30', 1599.99),
(6, 106, 'Eva Wilson', 'Printer', 6, '2022-01-31', 99.99),
(7, 107, 'David Miller', 'Monitor', 7, '2022-02-01', 249.99),
(8, 108, 'Olivia Davis', 'Keyboard', 8, '2022-02-02', 29.99),
(9, 109, 'Mason Brown', 'Mouse', 9, '2022-02-03', 14.99),
(10, 110, 'Sophia Wilson', 'External Hard Drive', 10, '2022-02-04', 89.99),
(11, 111, 'Isaac Taylor', 'Desk Chair', 11, '2022-02-05', 79.99),
(12, 112, 'Ava Miller', 'Desk Lamp', 12, '2022-02-06', 29.99),
(13, 113, 'Emma Harris', 'Wireless Router', 13, '2022-02-07', 69.99),
(14, 114, 'Jack Turner', 'Coffee Maker', 14, '2022-02-08', 39.99),
(15, 115, 'Harper Wilson', 'Backpack', 15, '2022-02-09', 49.99),
(16, 116, 'Noah Turner', 'External Monitor', 16, '2022-02-10', 249.99),
(17, 117, 'Lucy Taylor', 'Graphic Tablet', 17, '2022-02-11', 159.99),
(18, 118, 'Mia Davis', 'Desk Organizer', 18, '2022-02-12', 19.99),
(19, 119, 'Ethan Wilson', 'Wireless Mouse', 19, '2022-02-13', 29.99),
(20, 120, 'Aiden Turner', 'Power Bank', 20, '2022-02-14', 39.99),
(21, 121, 'Sophie Taylor', 'Fitness Tracker', 21, '2022-02-15', 79.99),
(22, 122, 'Jackson Wilson', 'Bluetooth Speaker', 22, '2022-02-16', 89.99),
(23, 123, 'Penelope Turner', 'USB Hub', 23, '2022-02-17', 19.99),
(24, 124, 'Daniel Wilson', 'Wireless Headset', 24, '2022-02-18', 129.99),
(25, 125, 'Grace Taylor', 'Digital Watch', 25, '2022-02-19', 59.99);
 
--1. Show the average
SELECT AVG(product_price) AS AverageProductPrice FROM product;
 
--2. Count the data
SELECT COUNT(product_id) AS countproductid FROM product;
 
--3. SUM the data
SELECT SUM(purchased_amount) AS SumPurchasedamount FROM purchase;
 
--4. Get the max
SELECT MAX(purchased_amount) AS MaxAmount FROM purchase;
 
--5. Get the min
SELECT MIN(purchased_amount) AS MinAmount FROM purchase;
 
--6. Retrieve and group by the data
SELECT product_name, AVG(product_price) AS AverageProductPrice FROM product WHERE stock_quantity > 0 GROUP BY product_name;
 
--7. Retrieve the data
SELECT customer_name, SUM(purchased_amount) AS SumPurchasedAmount FROM purchase WHERE purchase_date > '2022-02-01' GROUP BY customer_name HAVING SUM(purchased_amount) > 100;
 
--8. Sort the data in no. 6 by using asc and desc
SELECT customer_name, SUM(purchased_amount) AS SumPurchasedAmount
FROM purchase
WHERE purchase_date > '2022-02-01'
GROUP BY customer_name
HAVING SUM(purchased_amount) > 100
ORDER BY SumPurchasedAmount ASC;
 
SELECT customer_name, SUM(purchased_amount) AS SumPurchasedAmount
FROM purchase
WHERE purchase_date > '2022-02-01'
GROUP BY customer_name
HAVING SUM(purchased_amount) > 100
ORDER BY SumPurchasedAmount DESC;