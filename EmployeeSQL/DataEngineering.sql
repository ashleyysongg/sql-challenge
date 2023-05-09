

--Create all tables

-- Employee table
CREATE TABLE employee(
emp_no INTEGER PRIMARY KEY,
emp_title_id VARCHAR(5) NOT NULL,
birth_date DATE,
first_name VARCHAR(40) NOT NULL,
last_name VARCHAR(40) NOT NULL,
sex VARCHAR(2),
hire_date DATE NOT NULL
);

--Department
CREATE TABLE department (
dept_no VARCHAR(4) PRIMARY KEY,
dept_name VARCHAR(40) NOT NULL
);


--Deptarment Employees
CREATE TABLE dept_emp(
emp_no INTEGER NOT NULL,
dept_no VARCHAR(4) NOT NULL
);

--Department Managers
CREATE TABLE dept_managers(
dept_no VARCHAR(4) NOT NULL,
emp_no INTEGER NOT NULL
);

--Titles
CREATE TABLE title(
title_id VARCHAR(5) PRIMARY KEY,
title VARCHAR(40) NOT NULL
);

--Salary
CREATE TABLE salary (
emp_no INTEGER NOT NULL,
salary INTEGER NOT NULL
);

--Checking imports - imported successfully 
select * from department;
select * from employee;
select * from dept_emp;
select * from dept_managers;
select * from salary;
select * from title;

--Add Foreign key
ALTER TABLE dept_managers ADD CONSTRAINT fk_dept_managers_emp_no_3 FOREIGN KEY(emp_no)
REFERENCES employee (emp_no);
ALTER TABLE salary ADD CONSTRAINT fk_salary_emp_no_2 FOREIGN KEY(emp_no)
REFERENCES employee (emp_no);
ALTER TABLE employee ADD CONSTRAINT fk_employee_emp_title_id_5 FOREIGN KEY(emp_title_id)
REFERENCES title (title_id);
