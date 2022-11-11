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

3. SELECT company.company_id, company.company_name, foods.company_id, foods.item_name, foods.item_unit FROM company LEFT JOIN foods ON company.company_id = foods.company_id;

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

7. SELECT a.company_name,b.company_name,a.company_city FROM company a, company b WHERE a.company_id=b.company_id;

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
	ord_date varchar(20) NOT NULL,
	cust_code varchar(20) NOT NULL,
	agent_code varchar(20) NOT NULL,
	ord_description varchar(20)
);

INSERT INTO orders
VALUES(200114, 3500, 2000, '15-AUG-08', 'C00002', 'A008', NULL),
(200122, 2500, 400, '16-SEP-08', 'C00003', 'A004', NULL),
(200118, 500, 100, '20-JUL-08', 'C00023', 'A006', NULL),
(200119, 4000, 700, '16-SEP_08', 'C00007', 'A010', NULL),
(200121, 1500, 600, '23-SEP-08', 'C00008', 'A004', NULL),
(200130, 2500, 400, '30-JUL-08', 'C00025', 'A011', NULL),
(200134, 4200, 1800, '25-SEP-08', 'C00004', 'A005', NULL),
(200108, 4000, 600, '15-FEB-08', 'C00008', 'A004', NULL),
(200103, 1500, 700, '15-MAY-08', 'C00021', 'A005', NULL);

8. SELECT agents.agent_code, agents.agent_name, SUM(orders.advance_amount) AS sum_of_advance FROM agents, orders WHERE agents.agent_code=orders.agent_code GROUP BY agents.agent_code, agents.agent_name ORDER BY agents.agent_code;

ALTER TABLE foods ADD FOREIGN KEY (company_id) REFERENCES company(company_id);

9. SELECT foods.item_name, foods.item_unit, company.company_name, company.company_city FROM foods, company WHERE  foods.company_id=company.company_id AND company.company_city='London';

CREATE TABLE despatch(
	des_num varchar(20) NOT NULL,
	des_date varchar(20) NOT NULL,
	des_amount int NOT NULL,
	ord_num int NOT NULL,
	ord_date varchar(20) NOT NULL,
	ord_amount int NOT NULL,
	agent_code varchar(20) NOT NULL
);

INSERT INTO despatch
VALUES('D002', '10-JUN-08', 2000, 200112, '30-MAY-08', 2000, 'A007'),
('D005', '19-OCT-08', 4000, 200119, '16-SEP-08', 4000, 'A010'),
('D001', '12-JAN-08', 3800, 200113, '10-JUN-08', 4000, 'A002'),
('D003', '25-OCT-08', 900, 200117, '20-OCT-08', 800, 'A001'),
('D004', '20-AUG-08', 450, 200120, '20-JUL-08', 500, 'A002'),
('D006', '24-JUL-08', 4500, 200128, '20-JUL-08', 3500, 'A002');

10. SELECT a.des_num, a.des_date, SUM(b.ord_amount) AS sum_of_ord FROM despatch a, orders b WHERE a.ord_amount=b.ord_amount GROUP BY a.des_num, a.des_date;

11. SELECT ord_num, ord_amount, ord_date, cust_code, agent_code FROM orders WHERE agent_code IN (SELECT agent_code FROM agents WHERE working_area='Bangalore');

CREATE TABLE customers(
	cust_code varchar(20) NOT NULL,
	cust_name varchar(20) NOT NULL,
	cust_city varchar(20) NOT NULL,
	working_area varchar(20) NOT NULL,
	cust_country varchar(20) NOT NULL,
	grade int NOT NULL,
	opening_amt decimal(10,2) NOT NULL,
	receive_amt decimal(10,2) NOT NULL
);

INSERT INTO customers
VALUES('C00013', 'Holmes', 'London', 'London', 'UK', 2, 6000.00, 5000.00),
('C00001', 'Micheal', 'New York', 'New York', 'USA', 2, 3000.00, 5000.00),
('C00020', 'Albert', 'New York', 'New York', 'USA', 3, 5000.00, 7000.00),
('C00025', 'Ravindran', 'Bangalore', 'Bangalore', 'India', 2, 5000.00, 7000.00),
('C00024', 'Cook', 'London', 'London', 'UK', 2, 4000.00, 9000.00),
('C00015', 'Stuart', 'London', 'London', 'UK', 1, 6000.00, 8000.00),
('C00002', 'Bolt', 'New York', 'New York', 'USA', 3, 5000.00, 7000.00);

12. SELECT cust_country, COUNT(grade) AS grade FROM customers GROUP BY cust_country HAVING COUNT(grade)>2;