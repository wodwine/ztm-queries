/* TRY TO WRITE THESE AS JOINS FIRST */
/*
* DB: Store
* Table: orders
* Question: Get all orders from customers who live in Ohio (OH), New York (NY) or Oregon (OR) state
* ordered by orderid
*/

SELECT firstname,lastname,orderid
FROM customers,orders
WHERE orders.customerid = customers.customerid AND customers.state IN ('NY', 'OH', 'OR')
ORDER BY orders.orderid

/*
* DB: Employees
* Table: employees
* Question: Filter employees who have emp_no 110183 as a manager
*/

SELECT emp_no, first_name, last_name
FROM employees
WHERE emp_no in (
    SELECT emp_no
    FROM dept_emp
    WHERE dept_no = (
        SELECT dept_no 
        FROM dept_manager
        WHERE emp_no = 110183
    ))
ORDER BY emp_no

/* Using JOIN */
SELECT employees.emp_no, first_name, last_name
FROM employees JOIN dept_emp USING(emp_no)
              JOIN dept_manager USING(dept_no)
WHERE dept_manager.emp_no = 110183

/* Using , */
SELECT employees.emp_no, first_name, last_name
FROM employees,dept_emp,dept_manager
WHERE employees.emp_no = dept_emp.emp_no AND dept_manager.emp_no = 110183 AND dept_manager.dept_no = dept_emp.dept_no
ORDER BY emp_no