--A
SELECT DNI FROM EMPLEADOS WHERE NOMBRE NOT IN('LUIS','ANTONIO') AND PRAPELLIDO ='GARCIA' AND CIUDAD IN('MADRID','BARCELONA','SEVILLA','MALAGA');
--B
SELECT DNI FROM EMPLEADOS WHERE CIUDAD !='SEVILLA' AND CUIDAD IN('MADRID', 'BARCELONA') AND NOMBRE LIKE ('M%');
--C 
SELECT DNI FROM EMPLEADOS WHERE CUIDAD = 'SEVILLA' AND CUIDAD NOT IN ('MADRID', 'BARCELONA') AND NOMBRE NOT LIKE 'M%';
--D
SELECT NOMBRE, PRAPELLIDO FROM EMPLEADOS WHERE (CUIDAD IN ('VALENCIA', 'VIZCAYA')OR CIUDAD LIKE '%A') ORDER BY PRAPELLIDO DESC;
--E
SELECT DNI FROM EMPLEADO WHERE CUIDAD IN('BARCELONA') AND NOMBRE IN('ANTONIO','LUIS','IVAN','PEDRO') AND PRAPELLIDO IN('GARCIA') AND SGAPELLIDO IN('CANTOS');
--F
SELECT NOMBRE, PRAPELLIDO, SGAPELLIDO FROM EMPLEADO WHERE DNI LIKE'[4]' AND NOMBRE IN('ROSA','LUIS','RAMON','ANTONIO') ORDER BY PRAPELLIDO DESC;
--G
SELECT DNI FROM EMPLEADO WHERE NOMBRE IN('ANTONIO') AND PRAPELLIDO LIKE'[C]' AND SGAPELLIDO IN('GARCIA','GOMEZ','SANCHEZ') ORDER BY SGAPELLIDO;
--H
SELECT DNI FROM EMPLEADO WHERE SGAPELLIDO is NULL;