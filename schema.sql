CREATE TABLE usuarios (
	id SERIAL PRIMARY KEY,
	nombre VARCHAR (50),
	email VARCHAR (50) UNIQUE,
	fecha_registro DATE DEFAULT CURRENT_DATE
);

CREATE TABLE productos (
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(100),
	precio DECIMAL (10,2),
	categoria VARCHAR (50)
);

CREATE TABLE ordenes (
	ID SERIAL PRIMARY KEY,
	orden_id INT REFERENCES ordenes (id),
	producto_id INT REFERENCES productos (id),
	cantidad INT
);