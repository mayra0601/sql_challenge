select * from titles;
select * from employees;
select * from salaries;
select * from departments;
select * from dept_emp;
select * from dept_manager;

-- List the employee number, last name, first name, sex, and salary of each employee.
select employees.emp_no, first_name, last_name, sex, salary 
from employees 
inner join salaries 
on employees.emp_no = salaries.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
select first_name, last_name, hire_date 
from employees 
where hire_date >= '1/1/1986' 
and hire_date <= '12/31/1986';

-- List the manager of each department along with their department number, department name, employee number, last name, and first name
select dept_manager.dept_no,
departments.dept_name,
employees.emp_no,
employees.last_name,
employees.first_name
from dept_manager 
	inner join departments
		on dept_manager.dept_no = departments.dept_no
	inner join employees
		on dept_manager.emp_no = employees.emp_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
select employees.emp_no,
employees.last_name,
employees.first_name,
departments.dept_name
from employees
	inner join dept_emp
		on employees.emp_no = dept_emp.emp_no
	inner join departments
		on departments.dept_no = dept_emp.dept_no
order by employees.emp_no;


-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
select first_name, last_name, sex
from employees
where first_name = 'Hercules'
and last_name like 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name.

select employees.emp_no,
employees.last_name,
employees.first_name,
dept_emp.dept_no
from employees
	inner join dept_emp 
		on employees.emp_no = dept_emp.emp_no
	inner join departments
		on dept_emp.dept_no = departments.dept_no
where departments.dept_name = 'Sales'
order by employees.emp_no

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

select employees.emp_no,
       employees.last_name,
       employees.first_name,
       departments.dept_name
from employees 
	inner join dept_emp
		on employees.emp_no = dept_emp.emp_no
	inner join departments
		on dept_emp.dept_no = departments.dept_no
where departments.dept_name in ('Sales', 'Development')
order by employees.emp_no;

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)

select last_name, count(last_name)
from employees
group by last_name
order by count(last_name) desc; 
