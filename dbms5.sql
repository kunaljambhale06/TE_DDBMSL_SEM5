-- Demonstrate all types of JOIN on following schema 
-- customer(customer_id,first_name) 
-- orders(order_id,amount,customer_id); 



CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(20)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    amount INT,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

-- Customer Records
INSERT INTO customer VALUES
(1, 'Amit'),
(2, 'Riya'),
(3, 'Karan'),
(4, 'Sneha'),
(5, 'Neha');

-- Order Records
INSERT INTO orders VALUES
(101, 5000, 1),
(102, 2500, 2),
(103, 7000, 1),
(104, 4500, 3);


SELECT c.customer_id, c.first_name, o.order_id, o.amount
FROM customer c
INNER JOIN orders o
ON c.customer_id = o.customer_id;


SELECT c.customer_id, c.first_name, o.order_id, o.amount
FROM customer c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;


SELECT c.customer_id, c.first_name, o.order_id, o.amount
FROM customer c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;


SELECT c.customer_id, c.first_name, o.order_id, o.amount
FROM customer c
FULL OUTER JOIN orders o
ON c.customer_id = o.customer_id;


SELECT c.customer_id, c.first_name, o.order_id, o.amount
FROM customer c
CROSS JOIN orders o;
