DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

-- create departments table
CREATE TABLE departments (
  dept_no VARCHAR(10),
	dept_name VARCHAR(30) NOT NULL,
	PRIMARY KEY (dept_no)
);

select * from departments


-- create a titles table
CREATE TABLE titles (
	title_id VARCHAR(30),
	title VARCHAR(30),
	primary key (title_id)
);

select * from titles

-- create employees table
create table employees (
	emp_no INT NOT NULL,
	emp_title_id VARCHAR(30) NOT NULL,
	birth_date date not null,
	first_name VARCHAR(30) not null,
	last_name VARCHAR(30) not null,
	sex varchar(2) NOT NULL,
	hire_date date not null,
	primary key (emp_no),
	foreign key (emp_title_id) references titles(title_id)
);

select * from employees

-- create dept_emp table
CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(10) NOT NULL,
	foreign key (emp_no) references employees(emp_no) 
);

select * from dept_emp

-- create dept_manager table
create table dept_manager (
	dept_no VARCHAR(10) NOT NULL,
	emp_no INT NOT NULL,
	foreign key (emp_no) references employees(emp_no),
	foreign key (dept_no) references departments(dept_no)
);

select * from dept_manager

-- create salaries table
create table salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	foreign key (emp_no) references employees(emp_no)
);

select * from salaries

