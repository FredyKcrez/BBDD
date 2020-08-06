/*
 * Cáceres Ramos, Fredy Antonio
 * CR11005
 * 2016/10/02 1:47 p.m.
 * Fundamentos de Base de Datos
 * Clase 5 - Funciones
 */

USE AdventureWorksLT2008

SELECT cliente.FirstName AS 'Primer Nombre', cliente.LastName AS 'Apellido', cliente.CompanyName AS 'Compañia', direccion.AddressType AS 'TipoDireccion'
FROM SalesLT.Customer cliente
INNER JOIN SalesLT.CustomerAddress direccion
ON cliente.CustomerID = direccion.CustomerID

-- FUNCION AVG --
SELECT AVG(column_name) FROM table_name

-- FUNCION MAX --
SELECT MAX(price) AS HighestPrice FROM table_name

-- FUNCION ROUND --
SELECT ROUND(nombre_columna, decimales)
FROM nombre_tabla