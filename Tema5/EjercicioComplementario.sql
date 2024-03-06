CREATE TABLE AUTOBUS(
	MATRICULA VARCHAR(7) NOT NULL,
	ANTIGUEDAD NUMBER(2) NOT NULL,
	FECHA_VALIDEZ_ITV DATE NOT NULL,
	NUM_PLAZAS NUMBER(3) NOT NULL,
	CONSTRAINT pk_autobus PRIMARY KEY(MATRICULA),
	CONSTRAINT ck_plazas CHECK(NUM_PLAZAS < 100)
);

CREATE TABLE CONDUCTOR(
	DNI VARCHAR2(9) NOT NULL,
	NOMBRE VARCHAR2(40) NOT NULL,
	PRAPELLIDO VARCHAR2(40) NOT NULL,
	SGAPELLIDO VARCHAR2(30),
	NUM_EMPLEADO NUMBER(6) NOT NULL,
	CONSTRAINT pk_conductor PRIMARY KEY(DNI),
	CONSTRAINT uk_empleado UNIQUE(NUM_EMPLEADO)
);

CREATE TABLE VIAJES(
	DNI_CONDUCTOR VARCHAR2(9) NOT NULL,
	MATRICULA_AUTOBUS VARCHAR(7) NOT NULL,
	FECHA DATE NOT NULL,
	TIPO VARCHAR(7) NOT NULL,
	DESTINO VARCHAR2(20) NOT NULL,
	CONSTRAINT pk_viajes PRIMARY KEY(DNI_CONDUCTOR,MATRICULA_AUTOBUS,FECHA),
	CONSTRAINT fk_conductor FOREIGN KEY(DNI_CONDUCTOR) REFERENCES CONDUCTOR(DNI) ON DELETE CASCADE,
	CONSTRAINT fk_auto FOREIGN KEY(MATRICULA_AUTOBUS) REFERENCES AUTOBUS(MATRICULA) ON DELETE CASCADE
);

INSERT INTO AUTOBUS(matricula, antiguedad, fecha_validez_itv, num_plazas) VALUES('4598DLM', 15, '12/12/2025', 50);
INSERT INTO AUTOBUS(matricula, antiguedad, fecha_validez_itv, num_plazas) VALUES('2526LMX', 5, '06/04/2023', 96);
INSERT INTO AUTOBUS(matricula, antiguedad, fecha_validez_itv, num_plazas) VALUES('2130HGF', 9, '25/10/2024', 70);
INSERT INTO AUTOBUS(matricula, antiguedad, fecha_validez_itv, num_plazas) VALUES('9995GVC', 7, '30/08/2023', 63);

INSERT INTO CONDUCTOR(dni, nombre, prapellido, sgapellido, num_empleado) VALUES ('93606885J', 'PEDRO', 'MARTIN', 'LUNA', 852963);
INSERT INTO CONDUCTOR(dni, nombre, prapellido, sgapellido, num_empleado) VALUES ('57927673L', 'LUCAS', 'PEREZ', NULL, 789456);
INSERT INTO CONDUCTOR(dni, nombre, prapellido, sgapellido, num_empleado) VALUES ('83119803B', 'VERONICA', 'LOPEZ', 'GOMEZ', 125478);
INSERT INTO CONDUCTOR(dni, nombre, prapellido, sgapellido, num_empleado) VALUES ('31207982H', 'MARCO', 'GARCIA', 'DIAZ', 669874);

INSERT INTO VIAJES(dni_conductor, matricula_autobus, fecha, destino, tipo) VALUES ('93606885J', '4598DLM', '01/02/2023', 'MADRID', 'PUBLICO');
INSERT INTO VIAJES(dni_conductor, matricula_autobus, fecha, destino, tipo) VALUES ('57927673L', '2130HGF', '20/03/2023', 'VALENCIA', 'PRIVADO');
INSERT INTO VIAJES(dni_conductor, matricula_autobus, fecha, destino, tipo) VALUES ('83119803B', '9995GVC', '13/04/2023', 'SEVILLA', 'PRIVADO');
INSERT INTO VIAJES(dni_conductor, matricula_autobus, fecha, destino, tipo) VALUES ('31207982H', '2526LMX', '17/04/2023', 'MADRID', 'PUBLICO');
INSERT INTO VIAJES(dni_conductor, matricula_autobus, fecha, destino, tipo) VALUES ('57927673L', '2130HGF', '05/05/2023', 'LUGO', 'PUBLICO');
INSERT INTO VIAJES(dni_conductor, matricula_autobus, fecha, destino, tipo) VALUES ('83119803B', '2526LMX', '23/03/2023', 'BARCELONA', 'PUBLICO');

--COMSULTAS--
--EJERCICIO 1
--1.A
SELECT c.nombre FROM viajes V, conductor C WHERE  v.dni_conductor=c.dni AND v.destino ='MADRID';
--1.B
SELECT a.num_plazas FROM autobus A, viajes V WHERE a.matricula=v.matricula_autobus AND TIPO='PRIVADO';
--1.C 
SELECT C.DNI FROM conductor C WHERE NOMBRE ='MARCO';
SELECT C.DNI FROM conductor C WHERE NOMBRE ='VERONICA';
UPDATE VIAJES SET dni_conductor='83119803B' WHERE dni_conductor='31207982H';
--1.D
SELECT V.fecha FROM viajes V WHERE V.destino ='MADRID';
--1.E
SELECT * FROM conductor C WHERE C.sgapellido IS NULL;
--1.F
SELECT C.dni FROM conductor C WHERE C.nombre IN('VERONICA','PEDRO');
--1.G
SELECT * FROM autobus A WHERE TO_CHAR(A.fecha_validez_itv, 'YYYY')<='2023';
--1.H
SELECT A.num_plazas FROM autobus A WHERE A.matricula LIKE('2%');
--1.I
SELECT * FROM viajes V WHERE V.fecha BETWEEN TO_DATE('01/04/2023') AND TO_DATE('30/06/2023');
--1.J
SELECT C.num_empleado FROM conductor C WHERE C.nombre LIKE('%R%');
--1.K
SELECT C.nombre FROM conductor C WHERE C.nombre NOT LIKE('%Z');
--1.L
SELECT * FROM viajes V WHERE v.matricula_autobus IN('9995GVC','2526LMX');
--1.M
SELECT C.nombre, C.prapellido, C.sgapellido FROM conductor C WHERE C.dni NOT LIKE('%0%');
--1.N
SELECT * FROM autobus A WHERE A.num_plazas > 65 AND A.antiguedad<=5;
--1.O
SELECT V.destino FROM viajes V WHERE V.dni_conductor LIKE('5%L');


--EJERCICIO 2
INSERT INTO CONDUCTOR(DNI, NOMBRE, PRAPELLIDO, SGAPELLIDO, NUM_EMPLEADO) VALUES ('38607982N', 'LUCIA', 'GARCIA', 'MEDINA', 526987);
INSERT INTO CONDUCTOR(DNI, NOMBRE, PRAPELLIDO, SGAPELLIDO, NUM_EMPLEADO) VALUES ('31207102C', 'BEATRIZ', 'MENDEZ', 'GARCIA', 445879);
INSERT INTO CONDUCTOR(DNI, NOMBRE, PRAPELLIDO, SGAPELLIDO, NUM_EMPLEADO) VALUES ('99207123L', 'DAVID', 'PEREZ', 'HOYO', 362201);
INSERT INTO CONDUCTOR(DNI, NOMBRE, PRAPELLIDO, SGAPELLIDO, NUM_EMPLEADO) VALUES('45204004G', 'DANIEL', 'SANTOS', 'PEREZ', 899630);
--2.A
SELECT * FROM conductor C WHERE C.prapellido = 'PEREZ' AND C.nombre <>'DAVID';
--2.B
SELECT C.dni FROM conductor C WHERE C.nombre LIKE 'L%' AND C.sgapellido IS NOT NULL;
--2.C
SELECT C.nombre FROM conductor C WHERE C.prapellido IN ('PEREZ','GARCIA') AND C.dni NOT LIKE '%L';
--2.D
SELECT C.nombre, C.prapellido, C.sgapellido FROM conductor C ORDER BY C.prapellido;
--2.E
SELECT C.nombre, C.prapellido, C.sgapellido FROM conductor C ORDER BY C.prapellido, C.sgapellido;
--2.F
SELECT C.nombre FROM conductor C WHERE C.prapellido <> 'PEREZ' AND C.sgapellido <> 'PEREZ';
--2.G
SELECT DISTINCT C.DNI FROM conductor C, viajes V WHERE c.dni = v.dni_conductor ;
SELECT DISTINCT(V.dni_conductor) FROM viajes V;
--2.H
SELECT DISTINCT V.DESTINO FROM VIAJES V ORDER BY V.destino;

--EJERCICIO 1 SEGUNDA PARTE--
--2.I
SELECT a.matricula, a.precio FROM AUTOBUS A WHERE A.PRECIO=(SELECT MAX(PRECIO) FROM AUTOBUS);
SELECT MATRICULA, PRECIO FROM (SELECT MATRICULA, PRECIO FROM AUTOBUS ORDER BY PRECIO DESC) WHERE ROWNUM = 1;
--2.J

