SELECT e.emp_no, e.first_name, e.last_name, e.sex, s.salary
FROM employees e
LEFT JOIN salaries s ON s.emp_no = e.emp_no;

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%1986';

SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM employees e
INNER JOIN dept_manager dm ON e.emp_no = dm.emp_no
INNER JOIN departments d ON dm.dept_no = d.dept_no;

SELECT d.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments d ON de.dept_no = d.dept_no;

SELECT first_name, last_name, sex
FROM employees
WHERE (first_name = 'Hercules') AND (last_name LIKE 'B%');

SELECT emp_no, last_name, first_name
FROM employees
WHERE emp_no IN (
	SELECT emp_no FROM dept_emp
	WHERE dept_no IN(
		SELECT dept_no FROM departments
		WHERE dept_name = 'Sales'));

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments d ON de.dept_no = d.dept_no
WHERE (d.dept_name = 'Sales') OR (d.dept_name = 'Development');

SELECT COUNT(last_name), last_name FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;