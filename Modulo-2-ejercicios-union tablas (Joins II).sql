
-- Ejercicios

-- 1. Selecciona el ID, nombre, apellidos de todas las empleadas y el ID de cada cliente asociado a ellas (si es que lo tienen).

SELECT employees.employee_number, employees.first_name, employees.last_name, customers.customer_number
FROM employees
LEFT JOIN customers
ON employees.employee_number = customers.sales_rep_employee_number;

-- 2. Selecciona el ID de todos los clientes, y el nombre, apellidos de las empleadas que llevan sus pedidos (si es que las hay).

SELECT employees.first_name, employees.last_name, customers.customer_number
FROM employees
RIGHT JOIN customers
ON employees.employee_number = customers.sales_rep_employee_number;

-- 3. Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando LEFT JOIN.

SELECT employees.employee_number, employees.first_name, employees.last_name, COUNT(customers.customer_number) AS selection
FROM employees
LEFT JOIN  customers
ON employees.employee_number = customers.sales_rep_employee_number
GROUP BY employees.employee_number, employees.first_name, employees.last_name
HAVING selection > 8;

-- 4. Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando RIGHT JOIN.

SELECT employees.employee_number, employees.first_name, employees.last_name, COUNT(customers.customer_number) AS selection
FROM employees
RIGHT JOIN  customers
ON employees.employee_number = customers.sales_rep_employee_number
GROUP BY employees.employee_number, employees.first_name, employees.last_name
HAVING selection > 8;

-- 5. Selecciona el nombre y apellidos de las empleadas que tienen clientes de más de un país, usando LEFT JOIN.

SELECT first_name, last_name, COUNT(DISTINCT customers.country) AS numberCountry
FROM employees
LEFT JOIN customers
ON employees.employee_number = customers.sales_rep_employee_number
GROUP BY first_name, last_name
HAVING numberCountry >1

