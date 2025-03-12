-- Se debe ejecutar cada consulta por separado, descomentado por legibilidad.

SELECT Nombre, Precio
FROM Productos
ORDER BY Nombre, Precio DESC; -- Primero por nombre (prioritario), y luego por precio
--Podemos hacerlo por la posicion de la columna tambien
-- ...
-- ORDER BY 2, 1 DESC; -- columna 2 = nombre, columna 1 = Precio

-- Recuperar fechas donde tuvimos pedidos
SELECT DISTINCT Fecha
FROM Pedidos

--Sentencia subordinada :
SELECT * FROM PRODUCTOS
WHERE Precio >
(SELECT Precio FROM Productos WHERE Nombre="Ensalada");

--Predicado Compuesto (comparacion + AND)
SELECT * FROM Productos
WHERE Precio > 5 AND Precio < 8

-- Comparaciones en predicados (IN/NOT IN)
SELECT * FROM Productos
WHERE Nombre IN ('Perrito', 'Pizza'); -- o ... NOT IN ..
-- equivalente a : WHERE Nombre = 'Perrito' OR Nombre = 'Pizza';

-- Agrupamiento
SELECT ProductoId, SUM(Cantidad) as CantidadTotal
From PedidosProductos
GROUP BY ProductoId
--HAVING Cantidad > 1;

-- Multiples Tablas
SELECT *
FROM PedidosProductos AS PP, Pedidos AS P
WHERE P.Id = PP.PedidoID