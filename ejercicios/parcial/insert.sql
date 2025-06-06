INSERT INTO Artistas (Email, "Fecha Nacimiento", Nombre) VALUES
('s@dalma.es', '1/1/1960', 'Sergio Dalma'),
('est@pa.es', '1/2/1955', 'Estopa'),
('AC@dc.com', '30/04/1940', 'AC/DC'),
('HE@es.es', '2/2/1970', 'Heroes del Silencio')
;

INSERT INTO Canciones (Nombre, ArtistaId) VALUES
('Azul', 1),
('Nubes', 2),
('Ropaja', 2),
('Calorro', 2),
('Highway to Hell', 3),
('Flor de Loto', 4),
('Thunderstruck', 3)
;

INSERT INTO Albums (Titulo) Values
('Mix'),
('Estopa'),
('MIX Varios'),
('Rosendo')
;

INSERT INTO 'Albums-Canciones' VALUES
(1, 1),
(1, 2),
(2, 2),
(2, 3),
(3, 4),
(3, 5),
(3, 6)
;
