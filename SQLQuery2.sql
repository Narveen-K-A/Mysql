CREATE DATABASE company;

USE company;

CREATE TABLE department(
	dep_id int NOT null,
	dep_name varchar(20) NOT NULL,
	dep_location varchar(15) NOT NULL,
	PRIMARY KEY (dep_id)
);

CREATE TABLE salary_grade(
	grade int NOT NULL,
	min_salary int NOT NULL,
	max_salary int NOT NULL,
	PRIMARY KEY (grade)
);

CREATE TABLE employees(
	emp_id int NOT NULL,
	emp_name varchar(15) NOT NULL,
	job_name varchar(10) NOT NULL,
	manager_id int,
	hire_date date NOT NULL,
	salary decimal(10,2) NOT NULL,
	commission decimal(7,2),
	dep_id int NOT NULL,
	FOREIGN KEY (dep_id) REFERENCES department(dep_id)
);

INSERT INTO department
VALUES(1001, 'FINANCE', 'SYDNEY');

INSERT INTO department
VALUES(2001, 'AUDIT', 'MELBOURINE'), (3001, 'MARKETING', 'PERTH'), (4001, 'PRODUCTION', 'BRISBANE');

INSERT INTO employees
VALUES (68319, 'KAYLING', 'PRESIDENT', NULL, '1991-11-18', 6000.00, NULL, 1001);

INSERT INTO employees
VALUES (66928, 'BLAZE', 'MANAGER', 68319, '1991-05-01', 2750.00, NULL, 3001),
(67832, 'CLARE', 'MANAGER', 68319, '1991-06-09', 2550, null, 1001),
(65646, 'JONAS', 'MANAGER', 68319, '1991-04-02', 2957, null, 2001),
(67858, 'SCARLET', 'ANALYST', 65646, '1997-04-19', 3100, null, 2001),
(69062, 'FRANK', 'ANALYST', 65646, '1991-12-03', 3100, null, 2001),
(63679, 'SANDRINE', 'CLERK', 69062, '1990-12-18', 900.0, null, 2001),
(64989, 'ADELYN', 'SALESMAN', 66928, '1991-02-20', 1700.00, 400.00, 3001),
(64989, 'WADE', 'SALESMAN', 66928, '1991-02-22', 1350.00, 600.00, 3001),
(64989, 'MADDEN', 'SALESMAN', 66928, '1991-09-28', 1350.00, 1500.00, 3001),
(64989, 'TUCKER', 'SALESMAN', 66928, '1991-09-08', 1600.00, 0.00, 3001),
(68736, 'ADNRES', 'CLERK', 67858, '1997-05-23', 1200.00, NULL, 2001),
(69000, 'JULIUS', 'CLERK', 66928, '1991-12-03', 1050.00, NULL, 3001),
(68736, 'MARKER', 'CLERK', 67832, '1992-01-23', 1400.00, NULL, 1001);

INSERT INTO salary_grade
VALUES (1, 800, 1300),
(2, 1301, 1500),
(3, 1501, 2100),
(4, 2101, 3100),
(5, 3101, 9999);

SELECT * FROM employees;

SELECT salary FROM employees;

SELECT DISTINCT job_name FROM employees;