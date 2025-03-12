-- 3.1.1 Id del jefe del empleado con menor salario
SELECT Jefe
FROM Empleados
WHERE Salario = (SELECT MIN(Salario) FROM Empleados);

-- 3.1.2 Id de los diferentes jefes de la empresa
SELECT DISTINCT Jefe
From Empleados
WHERE Jefe IS NOT NULL;

-- 3.1.3 - Nombre y salarios de aquellos empleados cuyo nombre termine por o
SELECT Nombre, Salario
FROM Empleados
WHERE substr(Nombre, LENGTH(nombre)) = 'o';
-- o esto : WHERE Nombre like '%o';

-- 3.1.4 Reasigna todos los empleados al departamento del empleado que menos cobra.
UPDATE Empleados
SET DepId = (SELECT DepId FROM Empleados Where Salario =
    (SELECT MIN (Salario) FROM Empleados));

-- Ejemplo UPDATE :  Si quiero cambiar el valor del jefe (id) en una fila especifica
UPDATE Empleados
SET Jefe = 3
WHERE Id = 4;