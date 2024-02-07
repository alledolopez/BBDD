--A
SELECT MAX(PRECIO) FROM LIBRO;
--B
SELECT MIN(PRECIO) FROM LIBRO;
--C
SELECT MIN(FECHA_SAL) FROM EDITA WHERE DNI = '443042293';
--D
SELECT MAX(FECHA_SAL) FROM EDITA WHERE DNI = '29110302';
--E
SELECT MAX(NUMPAG) FROM LIBRO, TEMATICA WHERE TEMATICA = 'NOVELA';
--F
SELECT MIN(NUMPAG) FROM LIBRO, TEMATICA WHERE TEMATICA IN ('INFANTIL','CIENTIFICA','NOVELA','COMICO');
--G
SELECT COUNT(*) FROM LIBRO, TEMATICA WHERE PRECIO BETWEEN 5 AND 15;