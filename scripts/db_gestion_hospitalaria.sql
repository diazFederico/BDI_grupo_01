CREATE DATABASE gestion_de_medicamentos;
GO
USE gestion_de_medicamentos;
GO

CREATE TABLE paciente
(
  id_paciente INT NOT NULL,
  nombre CHAR(30) NOT NULL,
  fecha_nacimiento DATE NOT NULL,
  genero CHAR NOT NULL,
  direccion VARCHAR(80) NOT NULL,
  telefono NUMERIC(16) NOT NULL,
  email VARCHAR(100) NOT NULL,
  apellido CHAR(30) NOT NULL,
  CONSTRAINT PK_id_paciente PRIMARY KEY (id_paciente)
);

CREATE TABLE Especialidad
(
  id_especialidad INT NOT NULL,
  descripcion VARCHAR(30) NOT NULL,
  CONSTRAINT PK_id_especialidad PRIMARY KEY (id_especialidad)
);

CREATE TABLE medicacion
(
  id_medicacion INT NOT NULL,
  nombre_medicamento CHAR(50) NOT NULL,
  descripcion VARCHAR(100) NOT NULL,
  dosis_estandar FLOAT NOT NULL,
  CONSTRAINT PK_id_medicacion PRIMARY KEY (id_medicacion)
);

CREATE TABLE medico
(
  id_medico INT NOT NULL,
  nombre CHAR(30) NOT NULL,
  apellido CHAR(30) NOT NULL,
  telefono NUMERIC(15) NOT NULL,
  email VARCHAR(60) NOT NULL,
  id_especialidad INT NOT NULL,
  CONSTRAINT PK_id_medico PRIMARY KEY (id_medico),
  CONSTRAINT FK_medico_id_especialidad FOREIGN KEY (id_especialidad) REFERENCES Especialidad(id_especialidad)
);

CREATE TABLE tratamiento
(
  id_tratamiento INT NOT NULL,
  fecha_inicio DATE NOT NULL,
  fecha_fin DATE,
  dosis_recetada FLOAT NOT NULL,
  frecuencia INT NOT NULL,
  observaciones VARCHAR(100) NOT NULL,
  id_paciente INT NOT NULL,
  id_medicacion INT NOT NULL,
  id_medico INT NOT NULL,
  CONSTRAINT PK_id_tratamiento PRIMARY KEY (id_tratamiento),
  CONSTRAINT FK_tratamiento_id_paciente FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente),
  CONSTRAINT FK_tratamiento_id_medicacion FOREIGN KEY (id_medicacion) REFERENCES medicacion(id_medicacion),
  CONSTRAINT FK_tratamiento_id_medico FOREIGN KEY (id_medico) REFERENCES medico(id_medico)
);

CREATE TABLE internacion
(
  id_internacion INT NOT NULL,
  fecha_ingreso DATE NOT NULL,
  fecha_egreso DATE,
  motivo_internacion VARCHAR(60) NOT NULL,
  observaciones VARCHAR(100) NOT NULL,
  id_paciente INT NOT NULL,
  id_medico INT NOT NULL,
  CONSTRAINT PK_id_internacion PRIMARY KEY (id_internacion),
  CONSTRAINT FK_internacion_id_paciente FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente),
  CONSTRAINT FK_internacion_id_medico FOREIGN KEY (id_medico) REFERENCES medico(id_medico)
);

CREATE TABLE historia_clinica
(
  id_historia INT NOT NULL,
  fecha_registro DATE NOT NULL,
  diagnostico VARCHAR(90) NOT NULL,
  observaciones VARCHAR(100) NOT NULL,
  id_paciente INT NOT NULL,
  id_medico INT NOT NULL,
  CONSTRAINT PK_id_historia PRIMARY KEY (id_historia),
  CONSTRAINT FK_historia_clinica_id_paciente FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente),
  CONSTRAINT FK_historia_clinica_id_medico FOREIGN KEY (id_medico) REFERENCES medico(id_medico)
);