CREATE TABLE productos (
  id NUMBER(3) PRIMARY KEY,
  nombre VARCHAR2(100) NOT NULL,
  precio  NUMBER(6,2) NOT NULL,
  id_fabricante NUMBER(3) NOT NULL,
  FOREIGN KEY (id_fabricante) REFERENCES fabricantes(id)
);


CREATE TABLE fabricantes (
  id NUMBER(3) PRIMARY KEY,
  nombre VARCHAR2(100) NOT NULL
);

INSERT INTO productos VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO productos VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO productos VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO productos VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO productos VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO productos VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO productos VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO productos VALUES(8, 'Port�til Yoga 520', 559, 2);
INSERT INTO productos VALUES(9, 'Port�til Ideapd 320', 444, 2);
INSERT INTO productos VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO productos VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

INSERT INTO fabricantes VALUES(1, 'Asus');
INSERT INTO fabricantes VALUES(2, 'Lenovo');
INSERT INTO fabricantes VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricantes VALUES(4, 'Samsung');
INSERT INTO fabricantes VALUES(5, 'Seagate');
INSERT INTO fabricantes VALUES(6, 'Crucial');
INSERT INTO fabricantes VALUES(7, 'Gigabyte');
INSERT INTO fabricantes VALUES(8, 'Huawei');
INSERT INTO fabricantes VALUES(9, 'Xiaomi');

--CONSULTAS SOBRE UNA TABLA
--A
SELECT P.NOMBRE FROM PRODUCTOS P;
--B
SELECT P.NOMBRE AS NOMBRE_PRODUCTO, P.PRECIO AS EUROS, P.PRECIO AS DOLARES FROM PRODUCTOS P;
--C
SELECT UPPER(P.NOMBRE), P.PRECIO FROM PRODUCTOS P;
--D
SELECT LOWER(P.NOMBRE), P.PRECIO FROM PRODUCTOS P;
--E
SELECT ROUND(P.PRECIO) FROM PRODUCTOS P ;
--F
SELECT P.NOMBRE, TRUNC(P.PRECIO)  FROM PRODUCTOS P;
--G
SELECT f.id FROM FABRICANTES F, PRODUCTOS P WHERE f.id = p.id_fabricante;
--H
SELECT DISTINCT(F.ID) FROM PRODUCTOS P, FABRICANTES F WHERE f.id = p.id_fabricante;
--I
SELECT F.NOMBRE FROM FABRICANTES F ORDER BY F.NOMBRE DESC;
--J
-- SELECT nombre, precio FROM productos ORDER BY precio DESC LIMIT 1;

--CONSULTAS MULTITABLA COMPOSICION EXTERNA--
--a
SELECT * FROM FABRICANTES F LEFT JOIN PRODUCTOS P ON p.id_fabricante=f.id;
--b
SELECT * FROM FABRICANTES F LEFT JOIN PRODUCTOS P ON p.id_fabricante = f.id WHERE p.id_fabricante IS NULL ;
--c
/*No, ya que la tabla productos es dependiente de fabricantes y sin un fabricante no podrian existir productos*/

--CONSULTAS MULTITABLA COMPOSICION INTERNA--
--1
SELECT p.nombre, p.precio, f.nombre FROM PRODUCTOS P INNER JOIN FABRICANTES F ON p.id_fabricante=f.id;
--2
SELECT p.nombre, p.precio, f.nombre FROM PRODUCTOS P INNER JOIN FABRICANTES F ON p.id_fabricante=f.id ORDER BY f.nombre;
--3
SELECT p.id,p.nombre,f.id, f.nombre FROM PRODUCTOS P INNER JOIN FABRICANTES F ON p.id_fabricante=f.id;
--4
SELECT P.NOMBRE, F.NOMBRE, P.PRECIO FROM PRODUCTOS P INNER JOIN FABRICANTES F ON p.id_fabricante = f.id WHERE p.precio=(SELECT MIN(precio) FROM PRODUCTOS);
--5
SELECT P.NOMBRE, F.NOMBRE, P.PRECIO FROM PRODUCTOS P INNER JOIN FABRICANTES F ON p.id_fabricante = f.id WHERE p.precio=(SELECT MAX(precio) FROM PRODUCTOS);
--6
SELECT * FROM productos P INNER JOIN fabricantes F ON p.id_fabricante = f.id WHERE f.nombre='Lenovo';
--7
SELECT * FROM productos P INNER JOIN fabricantes F ON p.id_fabricante = f.id WHERE f.nombre='Crucial' AND p.precio>200;
--8
SELECT * FROM productos P INNER JOIN fabricantes F ON p.id_fabricante = f.id WHERE f.nombre ='Asus' OR f.nombre='Hewlett-Packard' OR f.nombre='Seagate';
--9
SELECT * FROM productos P INNER JOIN fabricantes F ON p.id_fabricante = f.id WHERE f.nombre IN('Asus','Hewlett-Packard','Seagate');
--10
SELECT p.nombre, p.precio FROM productos P INNER JOIN fabricantes F ON p.id_fabricante = f.id WHERE f.nombre LIKE '%e';
--11
SELECT p.nombre, p.precio FROM productos P INNER JOIN fabricantes F ON p.id_fabricante = f.id WHERE f.nombre LIKE '%w%';
--12
SELECT p.nombre, p.precio, f.nombre FROM productos P INNER JOIN fabricantes F ON p.id_fabricante = f.id WHERE p.precio>=180 ORDER BY p.precio DESC;
SELECT p.nombre, p.precio, f.nombre FROM productos P INNER JOIN fabricantes F ON p.id_fabricante = f.id WHERE p.precio>=180 ORDER BY p.nombre;






