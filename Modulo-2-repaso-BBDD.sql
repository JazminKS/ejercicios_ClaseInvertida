
CREATE TABLE profesores(
DNI VARCHAR(9) PRIMARY KEY,
Nombre VARCHAR(100),
Direccion VARCHAR(100),
Telefono VARCHAR(15));

CREATE TABLE alumnos(
Numero_expediente INT PRIMARY KEY,
Nombre VARCHAR(45)  NOT NULL,
Apellidos VARCHAR(100)  NOT NULL,
Fecha_nacimiento DATE);
  
CREATE TABLE modulos(
Codigo VARCHAR(50) PRIMARY KEY,
Nombre_modulo VARCHAR(100) NOT NULL,
dni_profesor VARCHAR (9),
CONSTRAINT fk_modulos_profesor -- -> alias de la restricción 
FOREIGN KEY (dni_profesor)
REFERENCES profesores(DNI));

INSERT INTO profesores(DNI, Nombre, Direccion, Telefono) 
VALUES ('12345678A', 'Juan Pérez', 'Calle Mayor, 10', '600123456'),
('87654321B', 'María López', 'Avenida Sol, 45', '600654321'),
('45678912C', 'Carlos Gómez', 'Plaza Luna, 7', '600789123');

INSERT INTO alumnos(Numero_expediente, Nombre, Apellidos, Fecha_nacimiento) 
VALUES (1001, 'Ana Martínez', 'Martínez', '2005-03-15'),
(1002, 'Luis Fernández', 'Fernández', '2004-11-22'),
(1003, 'Clara Ruiz', 'Ruiz', '2006-01-10'),
(1004, 'Pedro Sánchez', 'Sánchez', '2005-07-08'),
(1005, 'Lucía Torres', 'Torres', '2004-09-18');

INSERT INTO modulos(Codigo, Nombre_modulo, dni_profesor) 
VALUES ('MOD101', 'Matemáticas', '12345678A'),
('MOD102', 'Física', '87654321B'),
('MOD103', 'Química', '45678912C'),
('MOD104', 'Biología', '12345678A'),
('MOD105', 'Historia', '87654321B');

CREATE TABLE matricula(
Id_matricula INT PRIMARY KEY AUTO_INCREMENT,
expediente_numero INT,
codigo_modulo VARCHAR(50),
CONSTRAINT fk_expediente_numero -- -> alias de la restricción 
FOREIGN KEY (expediente_numero)
REFERENCES alumnos(Numero_expediente),
CONSTRAINT fk_codigo_modulo -- -> alias de la restricción 
FOREIGN KEY (codigo_modulo)
REFERENCES modulos(Codigo));

INSERT INTO matricula(Id_matricula, expediente_numero, codigo_modulo) 
VALUES (1, 1001, 'MOD101'),
(2, 1001, 'MOD102'),
(3, 1002, 'MOD101'),
(4, 1002, 'MOD103'),
(5, 1003, 'MOD104'),
(6, 1004, 'MOD105'),
(7, 1005, 'MOD102'),
(8, 1005, 'MOD104');

SELECT*
    FROM profesores;

SELECT Nombre, Telefono
FROM profesores; 

SELECT Nombre_modulo
FROM modulos;

SELECT Nombre, Apellidos
FROM alumnos;

UPDATE Alumnos
SET Nombre = 'Ana'
WHERE Numero_expediente = 1001;

UPDATE Alumnos
SET Nombre = 'Luis'
WHERE Numero_expediente =  1002;

UPDATE Alumnos
SET Nombre = 'Clara'
WHERE Numero_expediente =  1003;

UPDATE Alumnos
SET Nombre = 'Pedro'
WHERE Numero_expediente =  1004;

UPDATE Alumnos
SET Nombre = 'Lucía'
WHERE Numero_expediente =  1005;

SELECT Nombre, Apellidos
FROM alumnos;

SELECT DISTINCT expediente_numero
FROM matricula;

SELECT Nombre
FROM profesores
WHERE DNI = '12345678A';

SELECT Codigo
FROM modulos
WHERE Nombre_modulo = 'Matemáticas';

SELECT Nombre, Apellidos
FROM alumnos
WHERE Fecha_nacimiento > '2005-01-01';

SELECT*
FROM matricula
WHERE codigo_modulo = 'MOD101';

SELECT*
FROM modulos
WHERE dni_profesor = '12345678A';

SELECT*
FROM alumnos
ORDER BY Apellidos ASC;


