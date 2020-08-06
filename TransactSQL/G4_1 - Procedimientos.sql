/*
 * Cáceres Ramos, Fredy Antonio
 * CR11005
 * 2016/10/04 10:49 p.m.
 * Fundamentos de Base de Datos
 * Guía 4 - Procedimientos
 */

 -- Solo puede haber una declaración ejecutandose, comentar la creación de
 -- los otros procedimientos

 USE Transaccion
 GO
 
 CREATE PROCEDURE Insertar
 @Id_Cliente INT,
 @Nombre_Cliente VARCHAR(50),
 @Puntos_Cliente INT,
 @Numero_Compras INT
 AS
 BEGIN
	INSERT INTO Clientes VALUES (@Id_Cliente,@Nombre_Cliente,@Puntos_Cliente,@Numero_Compras)
 END
 GO

 EXEC Insertar 1,'Juan Perez',6,2
 EXEC Insertar 2,'Alejandro Fonseca Aguilar',2,7
 EXEC Insertar 3,'Giovanni Barahona',23,3
 EXEC Insertar 4,'Edwin Iraheta',1,2
 
 CREATE PROCEDURE Eliminar
 @Variable_Entrada INT
 AS
 BEGIN
	DELETE FROM Clientes WHERE IdCliente = @Variable_Entrada
 END

 EXEC Eliminar 1

 CREATE PROCEDURE Contador
 AS
 BEGIN
	SELECT COUNT(*) FROM Clientes
 END

 EXEC Contador