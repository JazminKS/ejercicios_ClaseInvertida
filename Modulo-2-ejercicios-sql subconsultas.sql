
-- EJERCICIOS

-- 1. Calcula el numero de clientes por cada ciudad.

SELECT city AS Ciudad, COUNT(customer_name) AS Numero_clientes
FROM customers
GROUP BY city;

-- 2. Usando la consulta anterior como subconsulta, selecciona la ciudad con el mayor numero de clientes.

SELECT E1.city AS Ciudad, COUNT(E1.customer_name) AS Numero_clientes
FROM customers AS E1
GROUP BY E1.city
HAVING COUNT(E1.customer_name) = (
    SELECT MAX(Numero_clientes)
    FROM (
        SELECT COUNT(E2.customer_name) AS Numero_clientes
        FROM customers AS E2
        GROUP BY E2.city
        ) AS subconsulta  -- Agregamos el alias 'subconsulta'
);

SELECT city
FROM customers
GROUP BY city                     -- (1, 1, 1, 1, 2, 2, 2, 3, 3, 4, 4, 5, 9)
HAVING COUNT(customer_number) >= ALL(SELECT COUNT(customer_number)
									FROM customers
                                    GROUP BY city);

-- 3. Por último, usa todas las consultas anteriores para seleccionar el customerNumber, nombre y apellido de las clientas asignadas a la ciudad con mayor numero de clientas.

SELECT customer_number, contact_first_name, contact_last_name, city AS Ciudad, customer_name AS Numero_clientes
FROM customers 
GROUP BY city;

SELECT E1.customer_number, E1.contact_first_name, E1.contact_last_name, E1.city AS Ciudad, COUNT(E1.customer_name) AS Numero_clientes
FROM customers AS E1
GROUP BY E1.city
HAVING COUNT(E1.customer_name) = (
    SELECT MAX(Numero_clientes)
    FROM (
        SELECT COUNT(E2.customer_name) AS Numero_clientes
        FROM customers AS E2
        GROUP BY E2.city
        ) AS subconsulta  -- Agregamos el alias 'subconsulta'
);    

SELECT customer_number, contact_first_name, contact_last_name, city
FROM customers
WHERE city IN (SELECT city
               FROM customers
               GROUP BY city                     -- (1, 1, 1, 1, 2, 2, 2, 3, 3, 4, 4, 5, 9)
               HAVING COUNT(customer_number) >= ALL(SELECT COUNT(customer_number)
									FROM customers
                                    GROUP BY city));

-- 4. Queremos ver ahora que empleados tienen algún contrato asignado con alguno de los clientes existentes. Para ello selecciona employeeNumber como 'Número empleado', firstName como 'nombre Empleado' y lastName como 'Apellido Empleado'

SELECT
    e.employee_number AS 'Número empleado',
    e.first_name AS 'Nombre Empleado',
    e.last_name AS 'Apellido Empleado'
FROM
    employees AS e
WHERE
    e.employee_number IN (
                        SELECT DISTINCT c.sales_rep_employee_number
                        FROM customers c 
                        WHERE c.sales_rep_employee_number IS NOT NULL);
                        
-- 5. Queremos ver ahora en cuantas ciudades en las cuales tenemos clientes, no también una oficina de nuestra empresa para ello: Selecciona aquellas ciudades como 'ciudad' y los nombres de las empresas como 'nombre de la empresa ' de la tabla customers, sin repeticiones, que no tengan una oficina en dicha ciudad de la tabla offices.

SELECT
    c.city AS 'Ciudad',
    c.customer_name AS 'Nombre Empresa'
FROM 
    customers AS c
WHERE
    c.city NOT IN (
				SELECT DISTINCT c.city
				FROM offices AS o 
				WHERE c.city);





