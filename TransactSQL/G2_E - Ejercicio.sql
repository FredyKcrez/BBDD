/*
 * C�ceres Ramos, Fredy Antonio
 * CR11005
 * 2016/10/02 7:27 p.m.
 * Fundamentos de Base de Datos
 * Gu�a 2 - DDL & DML - Ejercicio
 */

-- Creacion de la BD --
CREATE DATABASE FK_practica2

-- Creaci�n de tablas --
USE FK_practica2
CREATE TABLE Estudiantes
(
	IdEstudiante int primary key not null, -- Se agrega PK desde la creaci�n de la tabla --
	Nombres varchar(25) not null,
	Apellidos varchar(25) not null,
	Direccion varchar(50),
	Telefono varchar(8),
	Sexo char(1) not null
)

CREATE TABLE Materias
(
	IdMateria int not null,
	Materia varchar(30) not null
)
-- Agregamos PK con sentencia ALTER --
ALTER TABLE Materias ADD PRIMARY KEY (IdMateria)

CREATE TABLE Notas
(
	IdEstudiante int not null,
	IdMateria int not null,
	Nota int not null
)
-- Agregamos FK para relacionar la tabla Notas con la tabla Estudiantes --
ALTER TABLE Notas ADD CONSTRAINT fk_NotasEstudiantes
FOREIGN KEY(IdEstudiante)
REFERENCES Estudiantes(IdEstudiante)

-- Agregamos FK para relacionar la tabla Notas con la tabla Materias --
ALTER TABLE Notas ADD CONSTRAINT fk_NotasMaterias
FOREIGN KEY(IdMateria)
REFERENCES Materias(IdMateria)

-- Agregamos una restriccion para que no se inserte una nota < 0 � > 10 --
ALTER TABLE Notas ADD CONSTRAINT ck_Nota
CHECK (Nota >= 0 AND Nota <= 10)

-- Insertando datos a las tablas --
USE FK_practica2
INSERT INTO Estudiantes VALUES (1,'Juan Jos�','Perez','Colonia Las Am�ricas','78592654','M')
INSERT INTO Estudiantes VALUES (2,'Marta Alicia','Dominguez Argueta','Pasaje Los Nance','78526152','F')
INSERT INTO Estudiantes VALUES (3,'Luisa Arminda','Ramirez L�pez','Colonia Las Am�ricas','68941163','F')
INSERT INTO Estudiantes VALUES (4,'Jos� Roberto','Ramos','Colonia Santa Fe','74587421','M')
INSERT INTO Estudiantes VALUES (5,'Maria Elisabeth','C�ceres','Colonia Santa Elena','65782163','F')
INSERT INTO Estudiantes VALUES (6,'Elena del Rosario','Castro Ortega','Los Amates','78743651','F')
INSERT INTO Estudiantes VALUES (7,'Diego Ediberto','Rodriguez Peraza','Colonia Las Am�ricas','71245369','M')
INSERT INTO Estudiantes VALUES (8,'Marcos Saul','Suarez Mejia','La Garita','71485311','M')
INSERT INTO Estudiantes VALUES (9,'Daniela Arely','Portillo Deras','Pasaje Los Nance','64851256','F')
INSERT INTO Estudiantes VALUES (10,'Francisco Alberto','Perez Perez','Colonia Las Am�ricas','','M')

INSERT INTO Materias VALUES (1,'Matem�tica I')
INSERT INTO Materias VALUES (2,'Matem�tica II')
INSERT INTO Materias VALUES (3,'F�sica I')
INSERT INTO Materias VALUES (4,'F�sica II')
INSERT INTO Materias VALUES (5,'Matem�tica III')

INSERT INTO Notas VALUES (1,1,7)
INSERT INTO Notas VALUES (2,2,9)
INSERT INTO Notas VALUES (5,1,6)
INSERT INTO Notas VALUES (8,3,8)
INSERT INTO Notas VALUES (9,5,8)