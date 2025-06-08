CREATE TABLE clientes (
	Id INTEGER UNIQUE NOT NULL PRIMARY KEY,
	Nombre TEXT,
	Ciudad TEXT,
	NumeroCuenta TEXT UNIQUE
);

CREATE TABLE vuelos (
  	Id INTEGER UNIQUE NOT NULL PRIMARY KEY,
	Origen TEXT,
	Destino TEXT,
	PrecioAsiento INTEGER,
	NumeroPlazas INTEGER
);

CREATE TABLE Reserves (
	IdCliente INTEGER REFERENCES clientes,
	IdVuelo INTEGER REFERENCES vuelos,
	NumeroDeAsientos INTEGER,
	PRIMARY KEY (IdCliente, IdVuelo)
);