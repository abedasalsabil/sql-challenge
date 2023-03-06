-- List the employee number, last name, first name, sex, and salary of each employee
select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
from employees
inner join salaries ON
employees.emp_no = salaries.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986
select * from employees
where hire_date between '1/01/1986' and '12/31/1986';

--List the manager of each department along with their 
--department number, department name, employee number, last name, and first name
select dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, 
employees.last_name, employees.first_name
from dept_manager
left join departments 
ON dept_manager.dept_no = departments.dept_no
left join employees
on dept_manager.emp_no = employees.emp_no
order by emp_no;

-- List the department number for each employee along with that 
-- employee’s employee number, last name, first name, and department name
select dept_emp.dept_no, employees.emp_no, employees.last_name, 
employees.first_name, departments.dept_name
from employees
inner join dept_emp on employees.emp_no = dept_emp.emp_no
inner join departments on departments.dept_no = dept_emp.dept_no
order by emp_no;

--List first name, last name, and sex of each employee whose first name is 
--Hercules and whose last name begins with the letter B
select first_name, last_name, sex from employees
where first_name = 'Hercules' and last_name like 'B%';

--List each employee in the Sales department, including 
--their employee number, last name, and first name
select dept_emp.dept_no, employees.emp_no, employees.last_name, 
employees.first_name
from employees
inner join dept_emp on dept_emp.emp_no = employees.emp_no
where dept_no = 'd007'
order by emp_no;

--List each employee in the Sales and Development departments, including their 
--employee number, last name, first name, and department name 
select dept_emp.dept_no, employees.emp_no, employees.last_name, 
employees.first_name
from employees
inner join dept_emp on dept_emp.emp_no = employees.emp_no
where dept_no = 'd007' or dept_no = 'd005'
order by emp_no;

--List the frequency counts, in descending order, of all the employee last 
--names (that is, how many employees share each last name)
select last_name,
count(last_name) from employees
group by last_name
order by count(last_name) desc;