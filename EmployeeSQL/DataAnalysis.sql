--List the employee number, last name, first name, sex, and salary of each employee.
SELECT em.emp_no, em.last_name, em.first_name, em.sex, s.salary
FROM employee AS em
INNER JOIN salary AS s
ON em.emp_no = s.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date 
FROM employee
WHERE EXTRACT (YEAR FROM hire_date) = 1986;

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dm.dept_no, dp.dept_name, dm.emp_no, em.last_name, em.first_name
FROM dept_managers dm
INNER JOIN department dp ON dm.dept_no = dp.dept_no
INNER JOIN employee em ON dm.emp_no = em.emp_no;


--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT em.emp_no, em.last_name, em.first_name, dp.dept_no, dp.dept_name
FROM employee AS em
JOIN department dp ON dp.dept_no = dp.dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employee
WHERE first_name = 'Hercules' and last_name like 'B%'

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT em.emp_no, em.first_name,  em.last_name
FROM employee AS em
JOIN dept_emp de ON em.emp_no = de.emp_no
JOIN department dp ON de.dept_no = dp.dept_no
WHERE dp.dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT em.emp_no, em.last_name,  em.first_name, dp.dept_name
FROM employee as em
INNER JOIN dept_emp as de ON em.emp_no = de.emp_no
INNER JOIN department as dp ON de.dept_no = dp.dept_no
WHERE dp.dept_name IN ('Sales','Development')

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT em.last_name,
	(SELECT COUNT (*) FROM employee WHERE last_name = em.last_name) AS "Count"
FROM employee AS em
GROUP BY em.last_name
ORDER BY "Count" DESC;

