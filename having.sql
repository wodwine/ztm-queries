/*
*  Show me all the employees, hired after 1991, that have had more than 2 titles
*  Database: Employees
*/

SELECT employees.emp_no,COUNT(titles.title)
FROM titles,employees
WHERE EXTRACT(YEAR FROM hire_date) > 1991 AND titles.emp_no = employees.emp_no
GROUP BY employees.emp_no
HAVING COUNT(titles.title)>=2
ORDER BY employees.emp_no;

/*
*  Show me all the employees that have had more than 15 salary changes that work in the department development
*  Database: Employees
*/

SELECT employees.emp_no,COUNT(salaries.from_date)
FROM employees,salaries,dept_emp
WHERE employees.emp_no = salaries.emp_no AND dept_emp.emp_no = employees.emp_no AND 
      dept_emp.emp_no = salaries.emp_no AND dept_emp.dept_no = 'd005'
GROUP BY employees.emp_no
HAVING COUNT(salaries.from_date) > 15
ORDER BY employees.emp_no;

/*
*  Show me all the employees that have worked for multiple departments
*  Database: Employees
*/

SELECT emp_no,COUNT(dept_no)
FROM dept_emp
GROUP BY emp_no
HAVING COUNT(dept_no)>1