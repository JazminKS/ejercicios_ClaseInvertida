CREATE TABLE IF NOT EXISTS customers_mod 
SELECT * 
FROM customers;

SET SQL_SAFE_UPDATES = 0;

INSERT INTO customers_mod (customer_number, customer_name, contact_last_name, contact_first_name, phone, address_line1, address_line2, city, state, postal_code, country, sales_rep_employee_number, credit_limit)
VALUES (343, 'Adalab', 'Rodriguez', 'Julia', '672986373', 'Calle Falsa 123', 'Puerta 42', 'Madrid', 'España', '28000', 'España', 15, 20000000);

SET FOREIGN_KEY_CHECKS = 0; 

UPDATE customers
SET customer_name = 'La pegatina After', contact_last_name = 'Santiago', contact_first_name = 'Maricarmen', phone = '00000000', address_line1 = 'Travesía del rave', address_line2 = 'NULL', city = 'Palma de Mallorca', state = 'NULL', postal_code = '07005', country = 'España', sales_rep_employee_number = 10, credit_limit = 45673453
WHERE customer_number=344;

INSERT INTO customers_mod (customer_number, customer_name, contact_last_name, contact_first_name, phone, address_line1, address_line2, city, state, postal_code, country, sales_rep_employee_number, credit_limit)
VALUES (501, 'La Rosa Nautica','Rodriguez', 'Julia', '672986373', 'Calle Falsa 123', 'Puerta 42', 'Madrid', 'España', '28000', 'España', 15, 20000000), 
(502, 'Breaking Bad', 'Rodriguez', 'Julia', '672986373', 'Calle Falsa 123', 'Puerta 42', 'Madrid', 'España', '28000', 'España', 15, 20000000), 
(503, 'Orgullo y Prejuicio', 'Rodriguez', 'NULL', '672986373', 'Calle Falsa 123', 'Puerta 42', 'Madrid', 'España', '28000', 'España', 15, 20000000), 
(504, 'Titanic', 'Rodriguez', 'NULL', '672986373', 'Calle Falsa 123', 'Puerta 42', 'Madrid', 'España', '28000', 'España', 15, 20000000), 
(505, 'Rubi', 'Rodriguez', 'NULL', '672986373', 'Calle Falsa 123', 'Puerta 42', 'Madrid', 'España', '28000', 'España', 15, 20000000);

DELETE FROM customers_mod
WHERE customer_number = '501' AND customer_name = 'La Rosa Nautica';

DELETE FROM customers_mod
WHERE customer_number = '502' AND customer_name = 'Breaking Bad';

DELETE FROM customers_mod
WHERE customer_number = '503' AND customer_name = 'Orgullo y Prejuicio';

DELETE FROM customers_mod
WHERE customer_number = '504' AND customer_name = 'Titanic';

DELETE FROM customers_mod
WHERE customer_number = '505' AND customer_name = 'Rubi';

INSERT INTO customers (customer_number, customer_name, contact_last_name, contact_first_name, phone, address_line1, address_line2, city, state, postal_code, country, sales_rep_employee_number, credit_limit)
VALUES (501, 'La Rosa Nautica','Rodriguez', 'Julia', '672986373', 'Calle Falsa 123', 'Puerta 42', 'Madrid', 'España', '28000', 'España', 15, 20000000), 
(502, 'Breaking Bad', 'Rodriguez', 'Julia', '672986373', 'Calle Falsa 123', 'Puerta 42', 'Madrid', 'España', '28000', 'España', 15, 20000000), 
(503, 'Orgullo y Prejuicio', 'Rodriguez', 'NULL', '672986373', 'Calle Falsa 123', 'Puerta 42', 'Madrid', 'España', '28000', 'España', 15, 20000000), 
(504, 'Titanic', 'Rodriguez', 'NULL', '672986373', 'Calle Falsa 123', 'Puerta 42', 'Madrid', 'España', '28000', 'España', 15, 20000000), 
(505, 'Rubi', 'Rodriguez', 'NULL', '672986373', 'Calle Falsa 123', 'Puerta 42', 'Madrid', 'España', '28000', 'España', 15, 20000000);

UPDATE customers
SET customer_name = 'La pegatina After', contact_last_name = 'Santiago', contact_first_name = 'Maricarmen', phone = '00000000', address_line1 = ' Polígono Industrial de Son Castelló', address_line2 = 'Nave 92', city = 'Palma de Mallorca', state = 'España', postal_code = '28123', country = 'España', sales_rep_employee_number = 25, credit_limit = 5000000
WHERE customer_number=344;

CREATE TABLE IF NOT EXISTS customers_destroy
SELECT * 
FROM customers;

UPDATE customers_destroy
SET address_line1 = 'Vamos', address_line2 = 'a', postal_code = 'fastidiar', country = ' la tabla :)'
