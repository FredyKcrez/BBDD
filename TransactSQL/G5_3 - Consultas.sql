/*
 * Cáceres Ramos, Fredy Antonio
 * CR11005
 * 2016/10/08 8:11 p.m.
 * Fundamentos de Base de Datos
 * Guía 5 - DML - Parte 3
 */

 USE Trabajo
 GO

 /*
  * 1. Área de trabajo de la empleada diana.
  */
 SELECT e.Nombre AS 'Nombre empleado', a.Nombre AS 'Área'
 FROM Empleado e
 JOIN Area a
 ON e.Nombre = 'Diana' AND e.IdArea = a.IdArea

 /*
  * 2. Nombre de todos los empleados con sus respectivos gerentes y áreas.
  */
 SELECT e.Nombre AS 'Empleado', g.Nombre AS 'Gerente asignado', a.Nombre AS 'Área'
 FROM Empleado e
 INNER JOIN Area a
 ON e.IdArea = a.IdArea
 INNER JOIN Gerente g
 ON a.IdGerente = g.IdGerente

 /*
  * 3. Nombre, id y salario de los empleados en orden ascendente
  */
 SELECT e.IdEmpleado AS 'ID Empleado', e.Nombre AS 'Empleado', c.Salario
 FROM Empleado e
 JOIN Clase c
 ON e.IdClase = c.IdClase
 ORDER BY c.Salario ASC

 /*
  * 4. Nombre de áreas que tienen gerente y nombre de sus respectivos gerentes
  */
 SELECT a.Nombre AS 'Área', g.Nombre AS 'Gerente'
 FROM Area a
 JOIN Gerente g
 ON a.IdGerente = g.IdGerente

 /*
  * 5. Nombre del área en la cual beatríz es gerente
  */
 SELECT a.Nombre AS 'Gerencia de Beatríz'
 FROM Area a
 JOIN Gerente g
 ON a.IdGerente = g.IdGerente
 WHERE g.Nombre = 'Beatríz'

 /*
  * 6. Nombre de los empleados que ganan más de $500
  */
 SELECT e.Nombre AS 'Empleados que ganan $500.00'
 FROM Empleado e
 JOIN Clase c
 ON e.IdClase = c.IdClase
 WHERE c.Salario = 500

 /*
  * 7. Nombre de las áreas que tienen empleados y su cantidad de empleados respectiva.
  */
 SELECT a.Nombre AS 'Area', COUNT(e.IdArea) AS 'Cantidad de empleados'
 FROM Empleado e
 JOIN Area a
 ON e.IdArea = a.IdArea
 GROUP BY a.Nombre

 /*
  * 8. Nombre y salario (ascendente) de los empleados que ganan entre $100 y $1000
  */
 SELECT e.Nombre AS 'Empleado', c.Salario AS 'Salario'
 FROM Empleado e
 JOIN Clase c
 ON e.IdClase = c.IdClase
 WHERE c.Salario BETWEEN 100 AND 1000
 ORDER BY c.Salario ASC

 /*
  * 9. Nombre de empleados cuyo nombre termina en ‘o’.
  */
 SELECT e.Nombre AS 'Empleado'
 FROM Empleado e
 WHERE e.Nombre LIKE '%o'

 /*
  * 10. Nombre de empleados cuyo nombre empiece en ‘f’, ‘d’ o ‘p’
  */
 SELECT e.Nombre AS 'Empleado'
 FROM Empleado e
 WHERE e.Nombre LIKE 'f%' OR e.Nombre LIKE 'd%' OR e.Nombre LIKE 'p%'

 /*
  * 11. Nombre y salario del empleado que gana más.
  */
 SELECT e.Nombre AS 'Empleado', c.Salario AS 'Salario'
 FROM Empleado e
 JOIN Clase c
 ON e.IdClase = c.IdClase
 WHERE c.Salario = (SELECT MAX(d.Salario) FROM Clase d)

 /*
  * 12. Cuantos empleados hay por cada clase. Orden ascendente (clase A, clase B, clase C, etc)
  */
 SELECT c.Nombre, COUNT(e.IdClase)
 FROM Clase c
 JOIN Empleado e
 ON c.IdClase = e.IdClase
 GROUP BY c.Nombre
 ORDER BY c.Nombre ASC

 /*
  * 13. Salario promedio del departamento de compras (con dos decimales: $866.67)
  */
 SELECT a.Nombre AS 'Departamento', ROUND(AVG(c.Salario),2) AS 'Salario Promedio'
 FROM Empleado e
 JOIN Area a
 ON e.IdArea = a.IdArea
 JOIN Clase c
 ON e.IdClase = c.IdClase
 WHERE a.Nombre = 'Compras'
 GROUP BY a.Nombre

 /*
  * 14. Salario promedio de cada departamento en orden ascendente y con dos decimales. (Si no hay empleados, desplegar cero).
  */
 SELECT a.Nombre AS 'Departamento', ISNULL(ROUND(AVG(c.Salario),2),0) AS 'Salario Promedio'
 FROM Area a
 LEFT OUTER JOIN Empleado e
 ON e.IdArea = a.IdArea
 LEFT OUTER JOIN Clase c
 ON e.IdClase = c.IdClase
 GROUP BY a.Nombre
 ORDER BY a.Nombre ASC

 /*
  * 15. Nombre y salario de Vanessa y Ernesto
  */
 SELECT e.Nombre AS 'Empleado', c.Salario AS 'Salario'
 FROM Empleado e
 INNER JOIN Clase c
 ON e.IdClase = c.IdClase
 WHERE e.Nombre IN ('Vanessa', 'Ernesto')

 /*
  * 16. Nombre de empleados de los departamentos de ‘inventario’ y ‘recursos humanos’ (También nombre de los departamentos)
  */
 SELECT a.Nombre AS 'Departamento', e.Nombre AS 'Empleado'
 FROM Empleado e
 JOIN Area a
 ON e.IdArea = a.IdArea
 WHERE a.Nombre IN ('Inventario', 'RRHH')
 ORDER BY a.Nombre

 /*
  * Propuesta:
  * Desplegar  los  nombres  de  todos  los  empleados  con  su  respectivaclase  y  salario.
  * Además desplegar una columna llamada Puesto donde se muestre información según lo siguiente:
  * Clase A --> Operario
  * Clase B --> Supervisor
  * Clase C --> Jefe
  * Clase D --> Gerente
  * Clase E --> Gerente General
  *
  * Ordenados por Clase
  * Referencia: https://msdn.microsoft.com/en-us/library/ms181765.aspx
  */
 SELECT c.Nombre AS 'Clase', e.Nombre AS 'Empleado', c.Salario AS 'Salario', 'Puesto' =
	CASE
		WHEN c.Nombre = 'Clase A' THEN 'Operario'
		WHEN c.Nombre = 'Clase B' THEN 'Supervisor'
		WHEN c.Nombre = 'Clase C' THEN 'Jefe'
		WHEN c.Nombre = 'Clase D' THEN 'Gerente'
		WHEN c.Nombre = 'Clase E' THEN 'Gerente General'
	END
 FROM Clase c
 JOIN Empleado e
 ON e.IdClase = c.IdClase
 ORDER BY c.Nombre