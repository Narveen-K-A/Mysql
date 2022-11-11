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
	PRIMARY KEY (emp_id),
	FOREIGN KEY (dep_id) REFERENCES department(dep_id)
); 

INSERT INTO department
VALUES(1001, 'FINANCE', 'SYDNEY');

INSERT INTO department
VALUES(2001, 'AUDIT', 'MELBOURINE'), (3001, 'MARKETING', 'PERTH'), (4001, 'PRODUCTION', 'BRISBANE');

INSERT INTO employees
VALUES (68319, 'KAYLING', 'PRESIDENT', NULL, '1991-11-18', 6000.00, NULL, 1001),
(66928, 'BLAZE', 'MANAGER', 68319, '1991-05-01', 2750.00, NULL, 3001),
(67832, 'CLARE', 'MANAGER', 68319, '1991-06-09', 2550, null, 1001),
(65646, 'JONAS', 'MANAGER', 68319, '1991-04-02', 2957, null, 2001),
(67858, 'SCARLET', 'ANALYST', 65646, '1997-04-19', 3100, null, 2001),
(69062, 'FRANK', 'ANALYST', 65646, '1991-12-03', 3100, null, 2001),
(63679, 'SANDRINE', 'CLERK', 69062, '1990-12-18', 900.0, null, 2001),
(64989, 'ADELYN', 'SALESMAN', 66928, '1991-02-20', 1700.00, 400.00, 3001),
(65271, 'WADE', 'SALESMAN', 66928, '1991-02-22', 1350.00, 600.00, 3001),
(66564, 'MADDEN', 'SALESMAN', 66928, '1991-09-28', 1350.00, 1500.00, 3001),
(68454, 'TUCKER', 'SALESMAN', 66928, '1991-09-08', 1600.00, 0.00, 3001),
(68736, 'ADNRES', 'CLERK', 67858, '1997-05-23', 1200.00, NULL, 2001),
(69000, 'JULIUS', 'CLERK', 66928, '1991-12-03', 1050.00, NULL, 3001),
(69324, 'MARKER', 'CLERK', 67832, '1992-01-23', 1400.00, NULL, 1001);

INSERT INTO salary_grade
VALUES (1, 800, 1300),
(2, 1301, 1500),
(3, 1501, 2100),
(4, 2101, 3100),
(5, 3101, 9999);

1. SELECT * FROM employees;

2. SELECT salary FROM employees;

3. SELECT DISTINCT job_name FROM employees;

4. SELECT emp_name, FORMAT(1.15*salary,'C','en-US') AS "salary" FROM employees;

5. SELECT emp_name+' '+job_name AS "emloyee_and_job" FROM employees;

6. SELECT emp_id, emp_name, salary, CONVERT( varchar(20), hire_date, 107) AS "to_char" FROM employees;

7. SELECT LEN(emp_name) AS "length" FROM employees;

8. SELECT emp_id, salary, commission FROM employees;

9. SELECT * FROM employees WHERE dep_id NOT IN (2001);

10. SELECT * FROM employees WHERE hire_date<('1991-01-01');

11. SELECT AVG(salary) FROM employees WHERE job_name='ANALYST';

12. SELECT * FROM employees WHERE emp_name='BLAZE';

13. SELECT * FROM employees WHERE (salary*1.25) > 3000;

14. SELECT * FROM employees WHERE MONTH (hire_date)='01';

15. SELECT emp_id, emp_name, salary, hire_date FROM employees WHERE hire_date<('1991-04-01');

16. SELECT employees.emp_name, employees.salary from employees, salary_grade WHERE employees.emp_name='FRANK' AND employees.salary BETWEEN salary_grade.min_salary AND salary_grade.max_salary AND employees.salary = salary_grade.max_salary;

17. SELECT * FROM employees WHERE job_name NOT IN ('PRESIDENT','MANAGER') ORDER BY salary ASC;

18. SELECT MAX(salary) as "max" FROM employees;

19. SELECT job_name, avg(salary) AS "avg", avg(salary+commission) AS "avg" FROM employees GROUP BY job_name;

20. SELECT em.emp_id, em.emp_name, em.dep_id, de.dep_location, de.dep_name FROM employees em, department de WHERE em.dep_id = de.dep_id AND em.dep_id IN (1001, 2001);

21. select manager_id, count(*) as "count" from employees group by manager_id order by manager_id asc;

22. SELECT dep_id, count(*) FROM employees GROUP BY dep_id HAVING count(*) >= 2;

23. SELECT * FROM employees WHERE emp_name LIKE '%AR%';

24. ALTER TABLE employees ADD gender varchar(10);

UPDATE employees SET gender ='M' WHERE emp_id IN(63679,64989,65271,66928,68454,68736,69062);
UPDATE employees SET gender ='F'WHERE emp_id NOT IN(63679,'64989','65271','66928','68454','68736','69062');

25. SELECT * FROM employees WHERE job_name NOT IN ('PRESIDENT','MANAGER');

26. SELECT job_name, CASE WHEN job_name IN ('PRESIDENT','MANAGER','ANALYST') THEN 'Management Level' WHEN  job_name IN ('SALESMAN','CLERK') THEN 'Employee Level' END AS "label_name" FROM employees;

27. UPDATE employees SET commission=650.00 WHERE job_name='ANALYST' AND EXISTS(SELECT job_name FROM employees WHERE job_name='ANALYST');
SELECT * from employees;