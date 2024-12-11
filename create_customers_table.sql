CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    country VARCHAR(50),
    joinDate DATE
);

INSERT INTO Customers (customer_id, customer_name, country, joindate) 
VALUES
(1, 'Alice', 'USA', '2023-01-15'),
(2, 'Bob', 'UK', '2022-03-20'),
(3, 'Charlie', 'Canada', '2023-07-10'),
(4, 'David', 'USA', '2021-09-30'),
(5, 'Eva', 'UK', '2022-11-24'),
(6, 'Frank', 'Germany', '2023-02-10'),
(7, 'Grace', 'USA', '2023-05-15'),
(8, 'Helen', 'Australia', '2022-08-01'),
(9, 'Ian', 'India', '2023-06-22'),
(10, 'Jack', 'Canada', '2021-12-05'),
(11, 'Karen', 'UK', '2023-09-12'),
(12, 'Leo', 'USA', '2022-04-30'),
(13, 'Mia', 'Italy', '2023-03-18'),
(14, 'Nathan', 'Canada', '2023-07-25'),
(15, 'Olivia', 'France', '2021-10-17'),
(16, 'Paul', 'USA', '2022-11-11'),
(17, 'Quinn', 'India', '2023-04-08'),
(18, 'Rachel', 'Australia', '2022-07-19'),
(19, 'Steve', 'UK', '2023-02-14'),
(20, 'Tina', 'Germany', '2021-09-23'),
(21, 'Uma', 'France', '2022-05-30'),
(22, 'Victor', 'Italy', '2023-01-06'),
(23, 'Wendy', 'Canada', '2022-06-28'),
(24, 'Xander', 'India', '2023-03-09'),
(25, 'Yara', 'Australia', '2021-11-16');

SELECT * FROM customers; 