DROP DATABASE IF EXISTS burguer_house;
CREATE DATABASE burguer_house;
USE burguer_house;

CREATE TABLE clientes (
    cliente_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    correo VARCHAR(50) NOT NULL,
    telefono VARCHAR(15) NOT NULL
);

CREATE TABLE locales (
    local_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    ciudad VARCHAR(50) NOT NULL,
    telefono VARCHAR(15) NOT NULL
);

CREATE TABLE pedidos (
    pedido_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    fecha DATE NOT NULL,
    total_pedido DECIMAL(11, 2) NOT NULL,
    cliente_id INT NOT NULL,
    local_id INT NOT NULL
);

ALTER TABLE pedidos
ADD CONSTRAINT fk_pedidos_clientes
FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id);

ALTER TABLE pedidos
ADD CONSTRAINT fk_pedidos_locales
FOREIGN KEY (local_id) REFERENCES locales(local_id);

CREATE TABLE empleados (
    empleado_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    puesto VARCHAR(50) NOT NULL,
    local_id INT NOT NULL
);

ALTER TABLE empleados
ADD CONSTRAINT fk_empleados_locales
FOREIGN KEY (local_id) REFERENCES locales(local_id);

CREATE TABLE itemspedidos (
    item_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    pedido_id INT NOT NULL,
	nombre_producto VARCHAR(50) NOT NULL,
    precio_unitario DECIMAL(11,2) NOT NULL,
    cantidad INT NOT NULL
);

ALTER TABLE itemspedidos
ADD CONSTRAINT fk_itemspedidos_pedidos
FOREIGN KEY (pedido_id) REFERENCES pedidos(pedido_id);

CREATE TABLE calificaciones (
    calificacion_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    local_id INT NOT NULL,
	calificacion INT NOT NULL,
    opinion VARCHAR(200) NOT NULL
);

ALTER TABLE calificaciones
ADD CONSTRAINT fk_calificaciones_locales
FOREIGN KEY (local_id) REFERENCES locales(local_id);
