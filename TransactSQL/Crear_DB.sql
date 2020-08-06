/*
 * Cáceres Ramos, Fredy Antonio
 * 2016/09/24
 * 
 * Script:
 * Crear Base de Datos con medida inicial y maxima, la dirección donde se almacenará,
 * el tamaño de crecimiento
 */

create database ventas
on
primary (
	name = ventasPrimary,
	filename = 'D:\Documentos\SQL Server Management Studio\Bases de Datos\VentasPrimary.mdf',
	size = 50MB, -- Tamaño inicial de la BD
	Maxsize = 200,
	filegrowth = 20),

filegroup ventasFG (
	name = ventasData,
	filename = 'D:\Documentos\SQL Server Management Studio\Bases de Datos\VentasData.ndf',
	size = 200MB,
	Maxsize = 800,
	filegrowth = 100)

log on (
	name = ventasLog,
	filename = 'D:\Documentos\SQL Server Management Studio\Bases de Datos\VentasData.ldf',
	size = 300MB,
	Maxsize = 800,
	filegrowth = 100)

/* drop database ventas; */ -- Eliminar base de datos