-- 3.1.1 Id del jefe del empleado con menor salario
SELECT Jefe
FROM Empleados
WHERE Salario = (SELECT MIN(Salario) FROM Empleados);

-- 3.1.2 Id de los diferentes jefes de la empresa
SELECT DISTINCT Jefe
FROM Empleados
WHERE Jefe IS NOT NULL;

-- 3.1.3 - Nombre y salarios de aquellos empleados cuyo nombre termine por o
SELECT Nombre, Salario
FROM Empleados
WHERE substr(Nombre, LENGTH(nombre)) = 'o';
-- o esto : WHERE Nombre like '%o';

-- 3.1.4 Reasigna todos los empleados al departamento del empleado que menos cobra.
UPDATE Empleados
SET DepId = (SELECT DepId FROM Empleados WHERE Salario =
    (SELECT MIN (Salario) FROM Empleados));

-- Ejemplo UPDATE :  Si quiero cambiar el valor del jefe (id) en una fila especifica
UPDATE Empleados
SET Jefe = 3
WHERE Id = 4;

-- 3.1.5 Elimina todos los empleados que tengan una "a" y una "i" en algún lugar de su nombre
-- y ganen menos que el salario medio
DELETE FROM empleados
WHERE salario < (SELECT AVG(salario) FROM Empleados)
AND (nombre like '%a%' AND nombre like '%i');

-- 3.1.6 ¿En cuantos lugares diferentes tenemos departamentos?
SELECT COUNT(DISTINCT lugar)
FROM Departamentos;

-- 3.1.7 ¿Cuánto dinero gasta la empresa en total incluyendo salarios y bonus? Llame a este dato Total
    -- PS/ antes de llamar a este metodo elimino y reconstruyo la tabla desde 0,
    -- para incluír los datos borrados en ejercicios anteriores y que esté como en el enunciado
    -- DROP TABLE Empleados + creacion + insercion
SELECT SUM(salario + bonus) as total
FROM Empleados;

-- 3.1.8 Indique el nombre de los trabajadores con un bonus mayor que la media
SELECT Nombre
FROM Empleados
WHERE Bonus > (SELECT AVG(Bonus) FROM Empleados);

-- 3.1.9 Indique el número de empleados de cada departamento
SELECT DepId, COUNT(ID) AS nb_empleados
FROM Empleados
GROUP BY DepId;

-- 3.1.10 ¿Cuántos empleados tiene el departamento con más empleados?
SELECT COUNT(Id) as nb_empleados
FROM Empleados
GROUP BY DepId
ORDER BY nb_empleados DESC
LIMIT 1;

-- 3.1.11 Muestre, para cada jefe, el número de empleados directos que tiene a su cargo.
SELECT Jefe, COUNT(Id) as nb_empleados
FROM Empleados
WHERE Jefe is NOT NULL
GROUP BY Jefe;

-- 3.1.12 Duplica el bonus de todos los empleados que trabajan en el departamento de su jefe.
UPDATE Empleados        -- Para este caso, para cada fila de empleados hago la subquery y update si se cumple la condicion
SET bonus = (bonus * 2)
WHERE DepId IN (        -- en los que DepId coinciden
  	SELECT DepId
  	FROM Empleados e2
  	WHERE e2.Id = Empleados.Jefe
);

    --opcional -> Si queremos recuperar los jefes y sus empleados que trabajan en el mismo departamento
    SELECT Jefe, Id as id_empleado
    FROM Empleados e1
    WHERE DepId IN (
        SELECT DepId
        FROM Empleados e2
        WHERE e2.Id = e1.Jefe
    );

-- 3.1.13 Bonus medio en cada lugar
SELECT Departamentos.Lugar, AVG(Empleados.Bonus) as BonusMedio
FROM Empleados
JOIN Departamentos ON Empleados.DepId=Departamentos.Id
GROUP BY Departamentos.Lugar;

-- 3.1.14 Salario máximo de todos los jefes que trabajan en el mismo lugar que alguno de sus subordinados
SELECT e2.Id AS Jefe, MAX(e2.Salario) as salario_max, d.Lugar
FROM Empleados e1 							-- e1 para empleados normales
JOIN Departamentos d ON e1.DepId = d.Id     -- relacionamos empleados normales y departamentos
JOIN Empleados e2 ON e1.Jefe = e2.id 		-- relacionamos empleados y jefes (e2 para jefes)
JOIN Departamentos d2 ON d2.id = e2.DepId	-- relacionamos jefes y departamentos
WHERE d.Lugar = d2.Lugar;             		-- resultados en los que lugar empleado = lugar jefe


-- 3.1.15 Nombre y nombre del departamento del trabajador que más cobra (INCLUYENDO BONUS)
SELECT e.Nombre, d.nombre, e.Salario + E.Bonus as sueldo_total -- esta manera no excluye si hay 2 con el mismo
FROM Empleados e
JOIN Departamentos d ON e.DepId = d.Id
WHERE e.Salario + e.Bonus = (
    SELECT MAX(Salario + Bonus)
    FROM EMPLEADOS
);

-- 3.1.16 Para cada departamento, muestra el nombre y la diferencia
--        entre el trabajador que más cobra y el que menos cobra
SELECT Departamentos.Nombre, MAX(Empleados.Salario) - MIN(Empleados.Salario) AS DiferenciaSalarios
FROM Empleados
JOIN Departamentos ON Empleados.DepId=Departamentos.id
GROUP BY Departamentos.Nombre
ORDER BY DiferenciaSalarios DESC;

-- 3.1.17 Nombres y lugares de los jefes de todos los trabajadores de HR o R&D.
SELECT DISTINCT e2.Nombre AS Jefe, Departamentos.Lugar
FROM Empleados e1
JOIN Empleados e2 ON e1.Jefe = e2.id
JOIN Departamentos d1 ON e1.DepId = d1.Id
JOIN Departamentos d2 ON d2.Id = e2.depId -- asociar al departamento del jefe
WHERE d1.Nombre IN ('HR', 'R&D');

-- 3.1.18 Crea una vista que muestre el id y el salario medio de cada departamento.
CREATE VIEW VistaSalarioMedioPorDepartamento AS  -- creación de vista
SELECT Departamentos.Id, AVG(Empleados.salario) as SalarioMedio
FROM Departamentos
LEFT JOIN Empleados ON Empleados.DepId = Departamentos.id
GROUP BY Departamentos.Id
-- Incluimos hasta los deps que en los que no hay ningun empleado (LEFT JOIN)

-- 3.1.19 Nombres, lugares y número de empleados de todos los departamentos.
SELECT Departamentos.Nombre, Departamentos.Lugar, COUNT(Empleados.id) as NumeroEmpleados
FROM Empleados
JOIN Departamentos ON Empleados.DepId = Departamentos.id
GROUP BY Departamentos.Nombre, Departamentos.Lugar
ORDER BY NumeroEmpleados DESC;
-- esta manera no elimina los que no tienen empleados

-- 3.1.20 Nombres de todos los departamentos con más de un empleado.
SELECT Departamentos.Nombre
FROM Departamentos
JOIN Empleados ON Empleados.DepId = Departamentos.id
GROUP BY Departamentos.Nombre
HAVING COUNT (Empleados.Id) > 1
ORDER BY COUNT (Empleados.Id) DESC;