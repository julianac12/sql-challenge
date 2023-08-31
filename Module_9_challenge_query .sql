------List the employee number, last name, first name, sex, and salary of each employee.

select salaries.emp_no,
	employees.last_name,
	employees.first_name,
	employees.sex,
	salaries.salary 	
from salaries  
inner join employees 
on salaries.emp_no = employees.emp_no;


---- List the first name, last name, and hire date for the employees who were hired in 1986.
select first_name, last_name, hire_date  
from employees e 
where hire_date >= '01/01/1986'
and hire_date <'01/01/1987';



----List the manager of each department along with their department number, department name, employee number, last name, and first name.
Select e.emp_no,
       e.first_name,
       e.last_name,
       d.dept_name
From employees e
    inner join dept_manager dm
        on (e.emp_no = dm.emp_no)
    inner join departments d
        ON (dm.dept_no = d.dept_no)
where d.dept_name IN ('Sales', 'Development')
order by e.emp_no;


---List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
select d.dept_no, 
	e.emp_no,
	e.first_name,
	e.last_name,
	d.dept_name,
	de.emp_no,
	de.dept_no 
from employees e  
	inner join dept_emp de  
		on (e.emp_no = de.emp_no)
	inner join departments d
		on (de.dept_no = d.dept_no)
where d.dept_name in ('Sales', 'Development')
order by e.emp_no; 

---List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

select first_name, last_name, sex
from employees e 
where first_name = 'Hercules'
and last_name like 'B%';

---List each employee in the Sales department, including their employee number, last name, and first name.

select e.emp_no, 
	e.last_name,
	e.first_name,
	d.dept_name
from employees e 
	inner join dept_emp de 
		on (e.emp_no = de.emp_no)
	inner join departments d 
		on (de.dept_no = d.dept_no)
	where d.dept_name = 'Sales'
	order by e.emp_no ;

---List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
select e.emp_no, 
	e.last_name,
	e.first_name,
	d.dept_name
from employees e 
	inner join dept_emp de 
		on (e.emp_no = de.emp_no)
	inner join departments d 
		on (de.dept_no = d.dept_no)
	where d.dept_name = 'Sales'
	or d.dept_name = 'Development'
	order by e.emp_no ;

---List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

select last_name, count (*)
from employees e 
group by last_name;