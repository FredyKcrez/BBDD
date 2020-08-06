/*
 * C�ceres Ramos, Fredy Antonio
 * CR11005
 * 2016/09/26 11:47 p.m.
 * Fundamentos de Base de Datos
 * Gu�a 2 - DDL & DML
 */

 -- Diferentes alternativas para obtener informaci�n de las
 -- tablas de la base de datos en uso

 /*
  * Espec�ficamos la BD a utilizar en el script, seleccionamos la informaci�n de la BD
  * contenida en tablas, objetos.
  */

  USE AdventureWorksLT2008
  SELECT * FROM INFORMATION_SCHEMA.TABLES
  SELECT * FROM SYSOBJECTS
  SELECT * FROM SYSOBJECTS WHERE  xtype = 'U'
  SELECT TABLE_NAME FROM  INFORMATION_SCHEMA.TABLES