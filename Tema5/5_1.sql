
-- a) Mostrar el Nombre de los Ciclos Formativos que son de GRADO SUPERIOR.
SELECT nombre FROM CICLOFORM WHERE CICLOFORM.tipo = 'GRADO SUPERIOR';
-- b) Mostrar el Nombre, Apellidos y Direccion de los profesores.
SELECT NOMBRE, APELLIDO1, APELLIDO2, DIRECCION FROM DATOSPERSONALES WHERE DATOSPERSONALES.tipo = 'PROFESOR';
-- c) Mostrar el nombre de los ciclos que tienen n?mero de horas entre 150 y 250.
SELECT nombre FROM asignatura WHERE NUMHORAS  BETWEEN 150 AND 200;
-- d) Muestre el nombre y el numCuenta de los profesores.
SELECT DATOSPERSONALES.NOMBRE, CUENTA FROM profesor, datospersonales WHERE datospersonales.tipo = 'PROFESOR' AND DATOSPERSONALES.DNI = PROFESOR.DNI;
-- e) Muestra el DNI de los alumnos que est?n matriculados en la asignatura codAsig=3.
SELECT dni FROM matricula WHERE codasig = 3;
-- f) Muestra el DNI de los profesores que hablan el idioma ingl?s, utilizando el codIdioma=30.
SELECT DNI FROM idiomasprof WHERE codidioma = 30;
-- g) Muestra el nombre de las asignaturas del profesor con DNI 89621477
SELECT nombre FROM asignatura WHERE dni LIKE '89621477%';
-- h) Muestra el DNI de ANDREA y LUIS.
SELECT DNI FROM datospersonales WHERE nombre IN ('ANDREA', 'LUIS'); 