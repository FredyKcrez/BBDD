/*
 * Cáceres Ramos, Fredy Antonio
 * CR11005
 * 2016/10/04 10:33 p.m.
 * Fundamentos de Base de Datos
 * Guía 4 - Procedimientos
 */

 -- Creamos la Base de Datos --
 CREATE DATABASE Transaccion
 GO

 USE Transaccion
 GO

 -- Creamos las tablas --
 CREATE TABLE Clientes(
	IdCliente INT PRIMARY KEY, -- Agregamos PK desde la creación de la tabla --
	Nombre VARCHAR(50) NOT NULL,
	Puntos INT NOT NULL,
	NumCompras INT NOT NULL,
 )
 GO

 CREATE TABLE Compras(
	IdCompras INT NOT NULL,
	IdCliente INT NOT NULL,
	IdAlmacen INT NOT NULL,
	TotalCompra NUMERIC(8,2) NOT NULL,
 )
 GO

 CREATE TABLE Almacen(
	IdAlmacen INT NOT NULL,
	NombreTitular VARCHAR(100) NOT NULL,
	Puntaje INT NOT NULL,
	MontoMinimo NUMERIC(8,2) NOT NULL,
 )
 GO

 -- Agregamos llaves primarias con la sentencia ALTER --
 ALTER TABLE Compras ADD PRIMARY KEY(IdCompras)
 ALTER TABLE Almacen ADD PRIMARY KEY(IdAlmacen)

 -- Agregamos llaves foraneas --
 ALTER TABLE Compras ADD CONSTRAINT fk_ComprasClientes
 FOREIGN KEY (IdCliente)
 REFERENCES Clientes(IdCliente)

  ALTER TABLE Compras ADD CONSTRAINT fk_ComprasAlmacen
 FOREIGN KEY (IdAlmacen)
 REFERENCES Almacen(IdAlmacen)

 -- Agregamos restricciones --
 ALTER TABLE Compras ADD CONSTRAINT ck_TotalCompra
 CHECK (TotalCompra > 0)

 ALTER TABLE Almacen ADD CONSTRAINT ck_MontoMinimo
 CHECK (MontoMinimo > 0)

 ALTER TABLE Almacen ADD CONSTRAINT ck_Puntaje
 CHECK (Puntaje > 0)