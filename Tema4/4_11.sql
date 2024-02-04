--1
ALTER TABLE DatosPersonales ADD CONSTRAINT tipo_check CHECK (tipo IN ('N', 'D'));

--2
ALTER TABLE Departamento ADD CONSTRAINT numProf_range_check CHECK (numProf BETWEEN 1 AND 30);
ALTER TABLE Departamento ADD CONSTRAINT descripcion_departamento_unique UNIQUE (Descripcion);

--3
ALTER TABLE Doctorando ADD CONSTRAINT fecha_comienzo_check CHECK (FechaComienzo BETWEEN '2000-01-01' AND CURRENT_DATE);

--4
ALTER TABLE Doctor ADD CONSTRAINT titulo_doctor_unique UNIQUE (Titulo);
ALTER TABLE Doctor ADD CONSTRAINT titulo_length_check CHECK (LENGTH(Titulo) >= 10);
ALTER TABLE Doctor ADD CONSTRAINT calificacion_check CHECK (Calificacion BETWEEN 0 AND 10);

--5
ALTER TABLE Curso ADD CONSTRAINT duracion_curso_range_check CHECK (Duracion BETWEEN 10 AND 500);
