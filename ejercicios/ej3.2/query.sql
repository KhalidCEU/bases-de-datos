-- Muestra los vuelos en los que el precio por asiento es mayor que la media.
SELECT *
FROM vuelos
WHERE PrecioAsiento > (SELECT AVG(PrecioAsiento) FROM vuelos)

-- Muestra para todos los vuelos, la ciudad de origen, la ciudad de destino y el número de
-- plazas ya reservadas, los resultados deben aparecer ordenados empezando con el vuelo con
-- más plazas reservadas.
SELECT v.Origen, v.Destino, SUM(r.NumeroDeAsientos) as PlazasReservadas
FROM vuelos v
LEFT JOIN reservas r ON r .IdVuelo = v.Id
GROUP BY v.Id, v.Origen, v.Destino
ORDER BY PlazasReservadas DESC;


-- Muestra el nombre de cada cliente y cuanto se ha gastado en reservas.
SELECT c.Nombre,  SUM (v.PrecioAsiento * r.NumeroDeAsientos) as TotalGastado
FROM clientes c
LEFT JOIN reservas r ON r.IdCliente = c.Id
LEFT JOIN vuelos v ON v.Id = r.IdVuelo
GROUP BY c.Nombre
ORDER BY TotalGastado DESC;