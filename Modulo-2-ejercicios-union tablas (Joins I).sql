-- Ejercicios

-- 1. Selecciona el ID, nombre, apellidos de las empleadas y el ID de cada cliente asociado a ellas, usando CROSS JOIN.

SELECT employees.employee_number, employees.first_name, employees.last_name, customers.customer_name, customers.sales_rep_employee_number
FROM employees
CROSS JOIN customers
WHERE employees.employee_number = customers.sales_rep_employee_number;

SELECT e.employee_number, e.first_name, e.last_name, c.customer_name, c.sales_rep_employee_number
	FROM employees AS e
    INNER JOIN customers AS c
    ON c.sales_rep_employee_number = e.employee_number;

-- 2. Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando CROSS JOIN.

SELECT employees.employee_number, employees.first_name, employees.last_name, COUNT(customers.customer_number) AS selection
FROM employees
CROSS JOIN customers
WHERE employees.employee_number = customers.sales_rep_employee_number
GROUP BY employees.employee_number, employees.first_name, employees.last_name
HAVING selection > 8;

-- 3. Selecciona el nombre y apellidos de las empleadas que tienen clientes de más de un país, usando CROSS JOIN.

SELECT DISTINCT customers.country, employees.first_name, employees.last_name
FROM employees
CROSS JOIN customers
WHERE employees.employee_number = customers.sales_rep_employee_number;

-- 4. Selecciona el ID, nombre, apellidos de las empleadas y el ID de cada cliente asociado a ellas, usando INNER JOIN.

SELECT employee_number, first_name, last_name, customers.customer_number
FROM employees
INNER JOIN customers
ON employees.employee_number = customers.sales_rep_employee_number;

-- 5. Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando INNER JOIN.

SELECT employee_number, first_name, last_name
FROM employees
INNER JOIN customers
ON employees.employee_number = customers.sales_rep_employee_number
GROUP BY employee_number, first_name, last_name
HAVING COUNT(customers.customer_number) >8;

SELECT employees.employee_number, employees.first_name, employees.last_name, COUNT(customers.customer_name) AS num_clientes
FROM employees
INNER JOIN customers
ON employees.employee_number = customers.sales_rep_employee_number
GROUP BY employees.employee_number
HAVING num_clientes >8;

SELECT e.employee_number, e.first_name, e.last_name
	FROM employees AS e
    INNER JOIN customers AS c
    ON e.employee_number = c.sales_rep_employee_number
    GROUP BY e.employee_number
    HAVING COUNT(c.customer_name) > 8;

-- 6. Selecciona el nombre y apellidos de las empleadas que tienen clientes de más de un país, usando INNER JOIN.

SELECT first_name, last_name, customers.country
FROM employees
INNER JOIN customers
ON employees.employee_number = customers.sales_rep_employee_number
GROUP BY first_name, last_name
HAVING COUNT(country) >1;

SELECT DISTINCT customers.country, employees.first_name, employees.last_name
FROM employees
INNER JOIN customers
WHERE employees.employee_number = customers.sales_rep_employee_number;