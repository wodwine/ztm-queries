/*
* Table: employees
* Question: Find the age of all employees who's name starts with M.
* Sample output: https://imgur.com/vXs4093
*/

SELECT emp_no, first_name, EXTRACT (YEAR FROM AGE(birth_date)) AS "age" 
FROM employees
WHERE first_name ILIKE 'M%';

/*
* Table: employees
* Question: How many people's name start with A and end with R?
* Expected output: 1846
*/

SELECT COUNT(emp_no) 
FROM employees
WHERE first_name ILIKE 'A%R';
                                                  
/*
* DB: Store
* Table: customers
* Question: How many people's zipcode have a 2 in it?.
* Expected output: 4211 
*/

SELECT COUNT(customerid) 
FROM customers
WHERE zip::text LIKE '%2%';


/*
* Table: customers
* Question: How many people's zipcode start with 2 with the 3rd character being a 1.
* Expected output: 109 
*/

SELECT COUNT(customerid) 
FROM customers
WHERE zip::text LIKE '2_1%';

/*
* Question: Which states have phone numbers starting with 302?
* Replace null values with "No State"                                                  
* Expected output: https://imgur.com/AVe6G4c
*/

SELECT COALESCE(state, 'No State') AS "State" 
FROM customers
WHERE phone::text LIKE '302%';
