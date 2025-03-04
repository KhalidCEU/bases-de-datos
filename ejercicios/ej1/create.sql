CREATE TABLE Students (
	Id INTEGER UNIQUE NOT NULL PRIMARY KEY,
	Name TEXT,
	Score INTEGER, (o real)
	Photo BLOB,
	University TEXT,
	FOREIGN KEY (University) REFERENCES Universities
  --  University TEXT REFERENCES Universities  se puede hacer asi tambien
);

CREATE TABLE Universities (
	Name TEXT UNIQUE NOT NULL PRIMARY KEY,
	City TEXT,
	Students INTEGER
);