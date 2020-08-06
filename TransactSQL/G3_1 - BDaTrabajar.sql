/*
 * Cáceres Ramos, Fredy Antonio
 * CR11005
 * 2016/10/02 7:00 p.m.
 * Fundamentos de Base de Datos
 * Guía 3 - Práctica
 */

 -- Creando BD --
 CREATE DATABASE Empresa
 GO
 
 USE Empresa
 GO

 -- Creando tablas --
 CREATE TABLE Cliente(
	IdCliente INT NOT NULL,
	Nombre VARCHAR(50) NOT NULL,
	Puntos INTEGER NOT NULL,
	NumCompras INTEGER NOT NULL
 )

 CREATE TABLE Compras(
	IdCompras INTEGER NOT NULL,
	IdAlmacen INTEGER NOT NULL,
	IdCliente INTEGER NOT NULL,
	TotalCompra NUMERIC(8,2)
 )

 CREATE TABLE Almacen(
	IdAlmacen INT NOT NULL,
	NombreTitular VARCHAR(100) NOT NULL,
	Puntaje INT NOT NULL,
	MontoMinimo NUMERIC(8,2) NOT NULL
 )

 -- Creando PK --
 ALTER TABLE Cliente ADD PRIMARY KEY(IdCliente)
 ALTER TABLE Compras ADD PRIMARY KEY(IdCompras)
 ALTER TABLE Almacen ADD PRIMARY KEY(IdAlmacen)

 -- Creando FK --
 ALTER TABLE Compras ADD CONSTRAINT fk_ComprasClientes
 FOREIGN KEY (IdCliente)
 REFERENCES Cliente(IdCliente)

 ALTER TABLE Compras ADD CONSTRAINT fk_ComprasAlmacen
 FOREIGN KEY (IdAlmacen)
 REFERENCES ALmacen(IdAlmacen)

 -- Creando restricciones --
 ALTER TABLE Almacen ADD CONSTRAINT ck_Puntaje
 CHECK (Puntaje > 0)

 ALTER TABLE Almacen ADD CONSTRAINT ck_MontoMinimo
 CHECK (MontoMinimo > 0)
 
 ALTER TABLE Compras ADD CONSTRAINT ck_TotalCompra
 CHECK (TotalCompra > 0)