CREATE DATABASE sales;

USE sales;

CREATE TABLE salesman(
	salesman_id int NOT NULL,
	sales_name varchar(20) NOT NULL,
	city varchar(20) NOT NULL,
	commission decimal(10,2) NOT NULL,
	PRIMARY KEY (salesman_id)
);

INSERT INTO salesman
VALUES(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5007, 'Paul Adam', 'Rome', 0.13),
(5003, 'Lausen Hen', 'San Jose', 0.12);

CREATE TABLE customer(
	customer_id int NOT NULL,
	cust_name varchar(20) NOT NULL,
	city varchar(20) NOT NULL,
	grade int NOT NULL,
	salesman_id int NOT NULL,
	PRIMARY KEY (customer_id)
);

INSERT INTO customer
VALUES(3002, 'Nick Rimando', 'New York', 100, 5001),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3008, 'Julian Green', 'London', 300, 5002),
(3004, 'Fabian Johnson', 'Paris', 300, 5006),
(3009, 'Geoff Cameron', 'Berlin', 100, 5003);

1. SELECT c.cust_name, s.sales_name, c.city FROM salesman s, customer c WHERE s.city=c.city;

2. SELECT c.cust_name, s.sales_name FROM salesman s, customer c WHERE s.salesman_id=c.salesman_id;

CREATE TABLE foods(
	item_id int NOT NULL,
	item_name varchar(20) NOT NULL,
	item_unit varchar(10) NOT NULL,
	company_id int,
	PRIMARY KEY (item_id)
);

INSERT INTO foods
VALUES(1, 'Chex Mix', 'Pcs', 16),
(6, 'Cheez_It', 'Pcs', 15),
(2, 'BN Biscuit', 'Pcs', 15),
(3, 'Mighty Munch', 'Pcs', 17),
(4, 'Pot Rice', 'Pcs', 15),
(5, 'Jaffa Cakes', 'Pcs', 18),
(7, 'Salt n Shakes', 'Pcs', NULL);

CREATE TABLE company(
	company_id int NOT NULL,
	company_name varchar(20) NOT NULL,
	company_city varchar(20) NOT NULL,
	PRIMARY KEY (company_id)
);

INSERT INTO company
VALUES(18, 'Order All', 'Boston'),
(15, 'Jack Hill Ltd', 'London'),
(16, 'Akas Foods', 'Delhi'),
(17, 'Foodies', 'London'),
(19, 'Sip-n-Bite', 'New York');

3. SELECT company.company_id, company.company_name, company.company_city, foods.company_id, foods.item_name FROM company LEFT JOIN foods ON company.company_id = foods.company_id;

CREATE TABLE counter_sale(
	bill_no int NOT NULL,
	item_id int NOT NULL,
	sl_qty int NOT NULL,
	sl_rate int NOT NULL,
	bill_amt int NOT NULL,
);

INSERT INTO counter_sale
VALUES(1003, 6, 15, 20, 300),
(1004, 4, 18, 30, 540),
(1005, 7, 10, 60, 600),
(1006, 3, 25, 25, 625),
(1001, 4, 20, 30, 600),
(1002, 1, 40, 50, 2000);

4. SELECT c.bill_no, f.item_name, c.bill_amt FROM counter_sale c LEFT JOIN foods f ON c.item_id=f.item_id WHERE c.bill_amt>500;

5. SELECT a.bill_no, b.item_name,c.company_name, c.company_city, a.bill_amt FROM counter_sale a LEFT JOIN foods b ON a.item_id=b.item_id LEFT JOIN company c ON b.company_id=c.company_id WHERE c.company_name IS NOT NULL ORDER BY a.bill_no;

6. SELECT company.company_id, company.company_name, company.company_city, foods.company_id, foods.item_name FROM company RIGHT JOIN foods ON company.company_id = foods.company_id;

7. SELECT a.company_name,b.company_name,a.company_city FROM company a, company b WHERE a.company_city=b.company_city;

CREATE TABLE agents(
	agent_code varchar(20) NOT NULL,
	agent_name varchar(20) NOT NULL,
	working_area varchar(20) NOT NULL,
	commission decimal(10,2) NOT NULL,
	phone_no varchar(20) NOT NULL,
	country varchar(20),
	PRIMARY KEY (agent_code)
);

INSERT INTO agents
VALUES('A007', 'Ramasundar', 'Bangalore', 0.15, '077-25814763', NULL),
('A003', 'Alex', 'London', 0.13, '075-12458969', NULL),
('A008', 'Alford', 'New York', 0.12, '044-25874365', NULL),
('A011', 'Ravi Kumar', 'Bangalore', 0.15, '077-45625874', NULL),
('A010', 'Santakumar', 'Chennai', 0.14, '007-22388644', NULL),
('A012', 'Lucida', 'San Jose', 0.12, '044-52981425', NULL),
('A005', 'Anderson', 'Brisban', 0.13, '045-21447739', NULL),
('A001', 'Subbarao', 'Bangalore', 0.14, '077-12346674', NULL);

CREATE TABLE orders(
	ord_num int NOT NULL,
	ord_amount int NOT NULL,
	advance_amount int NOT NULL,
	ord_date date NOT NULL,
	cust_code varchar(20) NOT NULL,
	agent_code varchar(20) NOT NULL,
	ord_description varchar(20)
);

INSERT INTO orders
VALUES(200114, 3500, 2000, 15-AUG-08

