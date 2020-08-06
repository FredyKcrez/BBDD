/*
 * Cáceres Ramos, Fredy Antonio
 * CR11005
 * 2016/10/05 2:30 p.m.
 * Fundamentos de Base de Datos
 * Guía 5 - DML
 */

CREATE DATABASE Trabajo
GO

USE Trabajo
GO

CREATE TABLE Gerente(
	IdGerente INT NOT NULL,
	Nombre VARCHAR(30) NOT NULL
)

CREATE TABLE Area(
	IdArea INT NOT NULL,
	Nombre VARCHAR(30) NOT NULL,
	IdGerente INT NOT NULL
)

CREATE TABLE Empleado(
	IdEmpleado INT NOT NULL,
	Nombre VARCHAR(30) NOT NULL,
	IdArea INT NOT NULL,
	IdClase CHAR(1) NOT NULL
)

CREATE TABLE Clase(
	IdClase CHAR(1) NOT NULL,
	Nombre VARCHAR(7) NOT NULL,
	Salario FLOAT NOT NULL
)

ALTER TABLE Gerente ADD PRIMARY KEY(IdGerente)
ALTER TABLE Area ADD PRIMARY KEY(IdArea)
ALTER TABLE Empleado ADD PRIMARY KEY(IdEmpleado)
ALTER TABLE Clase ADD PRIMARY KEY(IdClase)

ALTER TABLE Area ADD CONSTRAINT fk_AreaGerente
FOREIGN KEY (IdGerente)
REFERENCES Gerente(IdGerente)

ALTER TABLE Empleado ADD CONSTRAINT fk_EmpleadoArea
FOREIGN KEY (IdArea)
REFERENCES Area(IdArea)

ALTER TABLE Empleado ADD CONSTRAINT fk_EmpleadoClase
FOREIGN KEY (IdClase)
REFERENCES Clase(IdClase)