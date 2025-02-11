-- Base de Datos
CREATE DATABASE IF NOT EXISTS VideoClubCulto;
USE VideoClubCulto;

-- Tabla PELICULA

CREATE TABLE IF NOT EXISTS PELICULA (
    id_pelicula INT AUTO_INCREMENT,      
    titulo VARCHAR(255) NOT NULL,         
    director VARCHAR(100) NOT NULL,   
    año YEAR NOT NULL,             
    genero VARCHAR(50),                     
    duracion INT,                         
    PRIMARY KEY (id_pelicula)
) ENGINE=InnoDB;

-- la Tabla CLIENTE

CREATE TABLE IF NOT EXISTS CLIENTE (
    id_cliente INT AUTO_INCREMENT,         
    nombre VARCHAR(100) NOT NULL,          
    apellido VARCHAR(100) NOT NULL,           
    email VARCHAR(150) NOT NULL,             
    telefono VARCHAR(20),                     
    PRIMARY KEY (id_cliente)
) ENGINE=InnoDB;


-- Tabla EMPLEADO

CREATE TABLE IF NOT EXISTS EMPLEADO (
    id_empleado INT AUTO_INCREMENT,       
    nombre VARCHAR(100) NOT NULL,          
    apellido VARCHAR(100) NOT NULL,         
    cargo VARCHAR(50),                        
    email VARCHAR(150),                       
    PRIMARY KEY (id_empleado)
) ENGINE=InnoDB;

-- Tabla Alquiler

CREATE TABLE IF NOT EXISTS ALQUILER (
    id_alquiler INT AUTO_INCREMENT,        
    id_cliente INT NOT NULL,                 
    id_pelicula INT NOT NULL,                
    id_empleado INT NOT NULL,               
    fecha_alq DATE NOT NULL,               
    fecha_dev DATE,                         
    PRIMARY KEY (id_alquiler),
    
    -- Definición de las claves foráneas
    CONSTRAINT fk_alquiler_cliente FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_alquiler_pelicula FOREIGN KEY (id_pelicula) REFERENCES PELICULA(id_pelicula)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_alquiler_empleado FOREIGN KEY (id_empleado) REFERENCES EMPLEADO(id_empleado)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

