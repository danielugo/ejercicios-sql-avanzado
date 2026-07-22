-- 1. LIMPIAR TODO DESDE CERO (El CASCADE borra las relaciones sin dar error)
DROP TABLE IF EXISTS detalles_orden CASCADE;
DROP TABLE IF EXISTS ordenes CASCADE;
DROP TABLE IF EXISTS productos CASCADE;
DROP TABLE IF EXISTS usuarios CASCADE;

-- 2. CREAR LAS TABLAS
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    fecha_registro DATE DEFAULT CURRENT_DATE
);

CREATE TABLE productos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    precio NUMERIC, -- Usamos NUMERIC para el número puro (Guaraníes)
    categoria VARCHAR(50)
);

CREATE TABLE ordenes (
    id SERIAL PRIMARY KEY,
    usuario_id INT REFERENCES usuarios(id),
    fecha_orden TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE detalles_orden (
    id SERIAL PRIMARY KEY,
    orden_id INT REFERENCES ordenes(id),
    producto_id INT REFERENCES productos(id),
    cantidad INT
);

-- 3. INSERTAR USUARIOS
INSERT INTO usuarios (nombre, email, fecha_registro) VALUES
('Juan Pérez', 'juan.perez@email.com', '2023-01-15'),
('María González', 'maria.g@email.com', '2023-02-20'),
('Carlos López', 'clopez@email.com', '2023-03-10'),
('Ana Martínez', 'ana.martinez@email.com', '2023-04-05'),
('Luis Fernández', 'luis.f@email.com', '2023-05-12');

-- 4. INSERTAR PRODUCTOS (Con los precios puros sin puntos)
INSERT INTO productos (nombre, precio, categoria) VALUES
('Laptop Lenovo ThinkPad', 7500000, 'Electrónica'),
('Mouse Inalámbrico Logitech', 150000, 'Accesorios'),
('Teclado Mecánico Redragon', 350000, 'Accesorios'),
('Monitor Samsung 24 pulgadas', 1200000, 'Electrónica'),
('Auriculares Sony Bluetooth', 1800000, 'Audio'),
('Disco Duro Externo 1TB', 450000, 'Almacenamiento');

-- 5. INSERTAR ÓRDENES
INSERT INTO ordenes (usuario_id, fecha_orden) VALUES
(1, '2023-06-01 10:30:00'),
(2, '2023-06-05 14:15:00'),
(1, '2023-06-10 09:45:00'),
(3, '2023-06-15 16:20:00'),
(4, '2023-06-20 11:10:00');

-- 6. INSERTAR DETALLES DE ORDEN
INSERT INTO detalles_orden (orden_id, producto_id, cantidad) VALUES
(1, 1, 1),
(1, 2, 1),
(2, 4, 2),
(3, 3, 1),
(4, 5, 1),
(5, 1, 1),
(5, 6, 2);