/*
*  How many people were hired on any given hire date?
*  Database: Employees
*  Table: Employees
*/

SELECT hire_date,COUNT(emp_no)
FROM employees
GROUP BY hire_date

/*
*   Show me all the employees, hired after 1991 and count the amount of positions they've had
*  Database: Employees
*/

SELECT employees.emp_no,COUNT(titles.title)
FROM titles,employees
WHERE EXTRACT(YEAR FROM hire_date) > 1991 AND titles.emp_no = employees.emp_no
GROUP BY employees.emp_no
ORDER BY employees.emp_no;


/*
*  Show me all the employees that work in the department development and the from and to date.
*  Database: Employees
*/

SELECT employees.emp_no,dept_emp.from_date,dept_emp.to_date
FROM employees,dept_emp,departments
WHERE employees.emp_no = dept_emp.emp_no AND departments.dept_no = dept_emp.dept_no AND departments.dept_name = 'Development'
GROUP BY employees.emp_no,dept_emp.from_date,dept_emp.to_date
ORDER BY employees.emp_no, dept_emp.to_date;