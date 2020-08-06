/*
 * Cáceres Ramos, Fredy Antonio
 * CR11005
 * 2016/10/02 7:27 p.m.
 * Fundamentos de Base de Datos
 * Guía 3 - Ejercicio
 */

-- Creacion de la BD --
CREATE DATABASE Facturacion
GO

-- Creación de tablas --
USE Facturacion
CREATE TABLE Clientes
(
	CodCliente int primary key not null, -- Se agrega PK desde la creación de la tabla --
	Nombre varchar(30) not null,
	Apellido varchar(30) not null,
	EsMayorista varchar(1),
	SaldoCliente numeric(8,2)
)

CREATE TABLE Facturas
(
	NumeroFactura int not null,
	CodCliente int not null,
	SaldoFact numeric(8,2) not null,
	MontoFact numeric(8,2) not null,
	FechaFact date
)
-- Agregamos PK con sentencia ALTER --
ALTER TABLE Facturas ADD PRIMARY KEY (NumeroFactura)
-- Agregamos FK para relacionar la tabla Facturas con la tabla Clientes --
ALTER TABLE Facturas ADD CONSTRAINT fk_FacturaClientes
FOREIGN KEY(CodCliente)
REFERENCES Clientes(CodCliente)

CREATE TABLE Pagos
(
	CodPago int not null,
	NumeroFact int not null,
	MontoPago numeric(8,2) not null,
	FechaPago date
)
-- Agregamos PK con sentencia ALTER --
ALTER TABLE Pagos ADD PRIMARY KEY(CodPago)
-- Agregamos FK para relacionar la tabla Pagos con la tabla Facturas --
ALTER TABLE Pagos ADD CONSTRAINT fk_PagosFactura
FOREIGN KEY(NumeroFact)
REFERENCES Facturas(NumeroFactura)

-- Agregamos las restricciones  --
ALTER TABLE Facturas ADD CONSTRAINT ck_MontoFact
CHECK (MontoFact >= 2)

ALTER TABLE Clientes ADD CONSTRAINT ck_SaldoCliente
CHECK (SaldoCliente > 0)

ALTER TABLE Facturas ADD CONSTRAINT ck_SaldoFact
CHECK (SaldoFact > 0)

-- Insertando datos a las tablas --
USE Facturacion
INSERT INTO Clientes VALUES (1,'Juan José','Perez','M',12.50)
INSERT INTO Clientes VALUES (2,'Marta Alicia','Dominguez Argueta','D',25.37)
INSERT INTO Clientes VALUES (3,'Luisa Arminda','Ramirez López','D',128.43)

INSERT INTO Facturas VALUES (1,3,7.33,8.23,'2016/09/25')
INSERT INTO Facturas VALUES (2,1,25.20,27.38,'2016/09/28')
INSERT INTO Facturas VALUES (3,2,17.31,17.36,'2016/09/28')

INSERT INTO Pagos VALUES (1,1,8.23,'2016/09/27')
INSERT INTO Pagos VALUES (2,2,27.38,'2016/09/30')
INSERT INTO Pagos VALUES (3,3,17.36,'2016/09/30')