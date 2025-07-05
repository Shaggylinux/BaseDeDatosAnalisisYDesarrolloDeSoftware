/*DDL */

/*crea una nueva base de datos llamada delivery_db.*/

-- CREATE DATABASE delivery_db;

USE delivery_db;

-- drop table productos;

create table usuario(
ID_usuario INT primary key auto_increment,
nombre VARCHAR(100) NOT NULL,
email VARCHAR (100) NOT NULL UNIQUE,
telefono VARCHAR(20),
direccion VARCHAR (255) NOT NULL
);

create table Restaurante (
ID_restaurante INT PRIMARY KEY auto_increment,
nombre VARCHAR(100) NOT NULL,
direccion VARCHAR(255) NOT NULL UNIQUE,
telefono VARCHAR(20) NOT NULL
);

create table  productos(
ID_productos INT primary key auto_increment,
ID_restaurante INT NOT NULL,
nombre VARCHAR(100)NOT NULL,
descripcion text,
precio decimal(10,2) NOT NULL,
foreign key (ID_restaurante) references restaurante(ID_restaurante),
foreign key (ID_restaurante) references usuario(ID_usuario)
);

CREATE TABLE pedidos(
id INT PRIMARY KEY AUTO_INCREMENT,
usuario_id INT NOT NULL,
restaurante_id INT,
fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
estado VARCHAR(50) DEFAULT 'pendiente', -- Ej: pendiente, En camino, Entregado, Cancelado
foreign KEY (restaurante_id) REFERENCES Restaurante(ID_restaurante)
);

CREATE TABLE Detalles_Pedido (
id INT PRIMARY KEY AUTO_INCREMENT,
pedido_id INT NOT NULL,
producto_id INT NOT NULL,
cantidad INT NOT NULL,
precio_unitario DECIMAL(10, 2) NOT NULL,
FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
FOREIGN KEY (producto_id) REFERENCES productos(id)
);

/*DML */
