-- Para cada álbum, muestre su Título y el número de canciones.
SELECT Albums.Titulo, COUNT(Ac.IdCancion) as NumCanciones
FROM Albums
LEFT JOIN 'Albums-Canciones' Ac ON Ac.IdAlbum = Albums.Id
GROUP BY Albums.Titulo;

-- Indique el nombre de cada canción junto con el nombre del artista correspondiente.
-- El resultado debe estar ordenado alfabéticamente por el nombre del artista.
SELECT Canciones.Nombre as NombreCancion, Artistas.Nombre as NombreArtista
FROM Canciones
LEFT JOIN Artistas ON Artistas.Id = Canciones.ArtistaId
ORDER BY Artistas.Nombre;

-- Muestre el título de cada álbum junto con el número de artistas distintos
-- que tienen alguna canción en él
SELECT Albums.Titulo, COUNT(DISTINCT Artistas.Id) as NumArtistas
FROM Albums
JOIN 'Albums-Canciones' ac ON ac.IdAlbum = Albums.Id
JOIN Canciones ON Canciones.Id = ac.IdCancion
JOIN Artistas ON Artistas.Id = Canciones .ArtistaId
GROUP BY Albums.Titulo;

-- Muestre el Nombre de los artistas cuyo email termine en “.es”.
SELECT Artistas.Nombre
FROM Artistas
WHERE Artistas.Email like '%.es';

-- Inserta una nueva fila en la tabla Artistas (invéntese los datos,
-- pero tenga en cuenta que el Id lo gestiona la base de datos).
INSERT INTO Artistas (Email, "Fecha Nacimiento", Nombre) VALUES
('juan@gmail.com' , '10-10-1990',  'Juan');
