-- EJERCICIOS

USE tienda;

SELECT MIN(customer_number) AS IDMenor     
FROM customers; 

SELECT AVG(credit_limit) AS Credit_limitMedio    
FROM customers     
WHERE country = 'España';

SELECT COUNT(country)     
FROM customers     
WHERE country = 'France';

SELECT MAX(credit_limit) AS Credit_limitMax
FROM customers
WHERE sales_rep_employee_number = 1323;

SELECT MAX(sales_rep_employee_number) AS sales_rep_employee_numberMax
FROM customers;  

SELECT sales_rep_employee_number, COUNT(customer_number)
FROM customers
GROUP BY sales_rep_employee_number;

SELECT sales_rep_employee_number, COUNT(customer_number)
FROM customers
GROUP BY sales_rep_employee_number
HAVING COUNT(*) > 7;

SELECT sales_rep_employee_number, COUNT(customer_number),
CASE
WHEN COUNT(customer_number) > 7 THEN 'AltoRendimiento'
ELSE 'RendimientoNormal'
END AS etiqueta_rendimiento
FROM customers
GROUP BY sales_rep_employee_number;  

SELECT country, COUNT(customer_number)
FROM customers
GROUP BY country;

SELECT country, COUNT(customer_number)
FROM customers
GROUP BY country
HAVING COUNT(DISTINCT city) > 3;

