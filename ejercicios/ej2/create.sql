CREATE Table Pedidos (
	Id INTEGER UNIQUE NOT NULL PRIMARY KEY,
	Mesa Integer,
	Fecha date,
	Hora time
);

CREATE Table "Pedidos-Productos" (
	PedidoId INTEGER REFERENCES Pedidos,
	ProductoId INTEGER REFERENCES Productos,
	Cantidad INTEGER,
	PRIMARY KEY (PedidoId, ProductoId)
);

CREATE TABLE Productos (
	Id INTEGER UNIQUE NOT NULL PRIMARY KEY,
	Nombre TEXT,
	Precio REAL
);
