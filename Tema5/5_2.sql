
CREATE TABLE DEPARTAMENTO(
    CLAVE_DEPTO NUMBER(1),
    NOMBRE VARCHAR(30) NOT NULL,
    PRESUPUESTO NUMBER(5),
    
    CONSTRAINT PK_DEPARTAMENTO PRIMARY KEY (CLAVE_DEPTO)
);

CREATE TABLE EMPLEADOS(
    CLAVE_EMPLEADO VARCHAR(5),
    NOMBRE VARCHAR(30) NOT NULL,
    APELLIDO1 VARCHAR(30) NOT NULL,
    CLAVE_DEPTO NUMBER(1),
    
   CONSTRAINT PK_EMPLEADOS PRIMARY KEY (CLAVE_EMPLEADO),
   CONSTRAINT FK_DEPTO FOREIGN KEY (CLAVE_DEPTO) REFERENCES DEPARTAMENTO(CLAVE_DEPTO)ON DELETE CASCADE
);

CREATE SEQUENCE SEQ_DEPTO START WITH 1  INCREMENT BY 1 MAXVALUE 999 NOCYCLE;

INSERT INTO departamento(clave_depto, nombre, presupuesto) VALUES (SEQ_DEPTO.NEXTVAL, 'PERSONAL', 80000);
INSERT INTO departamento(clave_depto, nombre, presupuesto) VALUES (SEQ_DEPTO.NEXTVAL, 'ALMAC�N', 70000);
INSERT INTO departamento(clave_depto, nombre, presupuesto) VALUES (SEQ_DEPTO.NEXTVAL, 'CONTABILIDAD', 60000);
INSERT INTO departamento(clave_depto, nombre, presupuesto) VALUES (SEQ_DEPTO.NEXTVAL, 'MANUFACTURA', 50000);
INSERT INTO departamento(clave_depto, nombre, presupuesto) VALUES (SEQ_DEPTO.NEXTVAL, 'EMPAQUE', 30000);

INSERT INTO EMPLEADOS (CLAVE_EMPLEADO, NOMBRE, APELLIDO1, CLAVE_DEPTO) VALUES ('EMP01', 'Armando', 'L�pez' , 2);
INSERT INTO EMPLEADOS (CLAVE_EMPLEADO, NOMBRE, APELLIDO1, CLAVE_DEPTO) VALUES ('EMP02', 'Tatiana', 'V�rgas' , 1);
INSERT INTO EMPLEADOS (CLAVE_EMPLEADO, NOMBRE, APELLIDO1, CLAVE_DEPTO) VALUES ('EMP03', 'Laura', 'Garc�a' , 3);
INSERT INTO EMPLEADOS (CLAVE_EMPLEADO, NOMBRE, APELLIDO1, CLAVE_DEPTO) VALUES ('EMP04', 'Juan', 'P�rez' , 4);
INSERT INTO EMPLEADOS (CLAVE_EMPLEADO, NOMBRE, APELLIDO1, CLAVE_DEPTO) VALUES ('EMP05', 'Iv�n', 'L�pez' , 5);
INSERT INTO EMPLEADOS (CLAVE_EMPLEADO, NOMBRE, APELLIDO1, CLAVE_DEPTO) VALUES ('EMP06', 'Margarita', 'Hern�ndez' , 1);
INSERT INTO EMPLEADOS (CLAVE_EMPLEADO, NOMBRE, APELLIDO1, CLAVE_DEPTO) VALUES ('EMP07', 'Jes�s', 'P�rez' , 3);
INSERT INTO EMPLEADOS (CLAVE_EMPLEADO, NOMBRE, APELLIDO1, CLAVE_DEPTO) VALUES ('EMP08', 'To�o', 'Flores' , 2);
INSERT INTO EMPLEADOS (CLAVE_EMPLEADO, NOMBRE, APELLIDO1, CLAVE_DEPTO) VALUES ('EMP09', 'Juan', 'L�pez' , 4);
INSERT INTO EMPLEADOS (CLAVE_EMPLEADO, NOMBRE, APELLIDO1, CLAVE_DEPTO) VALUES ('EMP10', 'Jos�', 'Hern�ndez' , 5);


-- a)
SELECT nombre,apellido1 FROM empleados;
-- b)
SELECT DISTINCT apellido1 FROM empleados;
-- c)
SELECT * FROM empleados WHERE apellido1 = 'L�pez';
-- d)
SELECT empleados.nombre, apellido1, departamento.nombre FROM empleados, departamento WHERE empleados.clave_depto = departamento.clave_depto AND empleados.nombre LIKE '%a';
-- e)
SELECT apellido1 FROM empleados, departamento WHERE apellido1 IN('L�pez', 'P�rez');
-- f)
SELECT empleados.nombre, empleados.clave_empleado FROM empleados WHERE CLAVE_DEPTO = 4;
-- g)
SELECT NOMBRE, APELLIDO1 FROM empleados WHERE apellido1 LIKE 'H%';
-- h)
SELECT * FROM departamento WHERE presupuesto BETWEEN 50000 AND 70000;
-- i)
SELECT empleado.clave_empleado, empleado.nombre, empleado.apellido1 FROM empleados, departamento WHERE empleado.clave_depto = departamento.clave_depto AND departamento.nombre = 'contabilidad';
-- j)
SELECT empleados.nombre, departamento.nombre, empleados.apellido1 FROM empleados, departamento WHERE empleados.clave_depto = departamento.clave_depto;
-- k)
SELECT SUM(PRESUPUESTO)/10 FROM departamento;
-- l)
SELECT * FROM empleados WHERE nombre LIKE 'J%' AND clave_depto = 4;
