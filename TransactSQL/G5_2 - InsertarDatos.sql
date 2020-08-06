/*
 * Cáceres Ramos, Fredy Antonio
 * CR11005
 * 2016/10/05 2:30 p.m.
 * Fundamentos de Base de Datos
 * Guía 5 - DML
 */

 USE Trabajo
 GO
 
 INSERT INTO Gerente VALUES (1,'Juan'), (2,'Marina'), (3,'Karla'), (4,'Sandra'), (5,'Beatrîz')
 INSERT INTO Area VALUES (1,'Compras',1),(2,'Inventario',2),(3,'Ventas',3),(4,'RRHH',4),(5,'Contaduria',5),(6,'Bodega',4),(7,'Informatico',1),(8,'Activos fijos',3),(9,'Mantenimiento',2),(10,'Vigilancia',1)
 INSERT INTO Clase VALUES ('a','Clase A',300),('b','Clase B',500),('c','Clase C',1000),('d','Clase D',1500),('e','Clase E',2000)
 INSERT INTO Empleado VALUES (1,'Pedro',1,'a'),(2,'Juan',1,'a'),(3,'Marta',4,'b'),(4,'Fidel',2,'d'),(5,'Francisco',2,'d'),(6,'Ernesto',4,'b'),(7,'Vanessa',2,'c'),(8,'Walter',1,'e'),(9,'Diana',4,'c'),(10,'Sofia',3,'a'),(11,'Lidia',4,'d'),(12,'Humberto',2,'b'),(13,'Karla',4,'d'),(14,'Glenda',3,'a'),(15,'Tomas',2,'c'),(16,'Rafael',3,'b')