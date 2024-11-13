/* En caso de que la base de datos este creada se debe ejecutar esta consulta
USE master; -- Cambia al contexto de la base de datos 'master'

-- Desconecta todos los usuarios y pone la base de datos en modo de usuario único
ALTER DATABASE gestion_hospitalaria
SET SINGLE_USER
WITH ROLLBACK IMMEDIATE;

-- Elimina la base de datos
DROP DATABASE gestion_hospitalaria;
*/

CREATE DATABASE gestion_hospitalaria;
GO
USE gestion_hospitalaria;
GO

CREATE TABLE paciente
(
  id_paciente NUMERIC(15) NOT NULL,
  nombre CHAR(30) NOT NULL,
  fecha_nacimiento DATE NOT NULL,
  genero CHAR NOT NULL,
  direccion VARCHAR(80) NOT NULL,
  telefono NUMERIC(16) NOT NULL,
  email VARCHAR(100) NOT NULL,
  apellido CHAR(30) NOT NULL,
  activo BOOLEAN NOT NULL,
  CONSTRAINT PK_id_paciente PRIMARY KEY (id_paciente)
);

CREATE TABLE especialidad
(
  id_especialidad INT NOT NULL,
  descripcion VARCHAR(50) NOT NULL,
  CONSTRAINT PK_id_especialidad PRIMARY KEY (id_especialidad)
);

CREATE TABLE diagnosticos
(
  id_diagnostico INT NOT NULL,
  descripcion VARCHAR(100) NOT NULL,
  CONSTRAINT PK_id_diagnostico PRIMARY KEY (id_diagnostico)
);

CREATE TABLE vademecum
(
  id_medicamento INT NOT NULL,
  nombre_comercial VARCHAR(100) NOT NULL,
  principio_activo VARCHAR(100) NOT NULL,
  CONSTRAINT PK_id_medicamento PRIMARY KEY (id_medicamento)
);

CREATE TABLE medico
(
  id_medico INT NOT NULL,
  nombre CHAR(40) NOT NULL,
  apellido CHAR(40) NOT NULL,
  telefono NUMERIC(15) NOT NULL,
  email VARCHAR(60) NOT NULL,
  id_especialidad INT NOT NULL,
  CONSTRAINT PK_id_medico PRIMARY KEY (id_medico),
  CONSTRAINT FK_medico_id_especialidad FOREIGN KEY (id_especialidad) REFERENCES especialidad(id_especialidad)
);

CREATE TABLE historia_clinica
(
  id_historia INT NOT NULL,
  observaciones VARCHAR(100) NOT NULL,
  id_paciente NUMERIC(15) NOT NULL,
  id_medico INT NOT NULL,
  id_diagnostico INT NOT NULL,
  CONSTRAINT PK_id_historia PRIMARY KEY (id_historia),
  CONSTRAINT FK_historia_clinica_id_paciente FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente),
  CONSTRAINT FK_historia_clinica_id_medico FOREIGN KEY (id_medico) REFERENCES medico(id_medico),
  CONSTRAINT FK_historia_clinica_id_diagnostico FOREIGN KEY (id_diagnostico) REFERENCES diagnosticos(id_diagnostico)
);

CREATE TABLE internacion
(
  id_internacion INT NOT NULL,
  fecha_ingreso DATE NOT NULL,
  fecha_egreso DATE,
  id_paciente NUMERIC(15) NOT NULL,
  id_historia INT NOT NULL,
  CONSTRAINT PK_id_internacion PRIMARY KEY (id_internacion),
  CONSTRAINT FK_internacion_id_paciente FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente),
  CONSTRAINT FK_internacion_id_historia FOREIGN KEY (id_historia) REFERENCES historia_clinica(id_historia)
);

CREATE TABLE evolucion_tratamiento
(
  fecha DATETIME DEFAULT GETDATE() NOT NULL,
  id_evolucion INT NOT NULL,
  descripcion VARCHAR(MAX) NOT NULL,
  id_internacion INT NOT NULL,
  CONSTRAINT PK_id_evolucion PRIMARY KEY (id_evolucion),
  CONSTRAINT FK_evolucion_tratamiento_id_internacion FOREIGN KEY (id_internacion) REFERENCES internacion(id_internacion)
);

CREATE TABLE tratamiento
(
  id_tratamiento INT NOT NULL,
  observaciones VARCHAR(100) NOT NULL,
  id_medico INT NOT NULL,
  id_internacion INT NOT NULL,
  CONSTRAINT PK_id_tratamiento PRIMARY KEY (id_tratamiento),
  CONSTRAINT FK_tratamiento_id_medico FOREIGN KEY (id_medico) REFERENCES medico(id_medico),
  CONSTRAINT FK_tratamiento_id_internacion FOREIGN KEY (id_internacion) REFERENCES internacion(id_internacion)
);

CREATE TABLE medicacion_anterior
(
  dosis VARCHAR(35) NOT NULL,
  frecuencia VARCHAR(35) NOT NULL,
  id_tratamiento INT NOT NULL,
  id_medicamento INT NOT NULL,
  CONSTRAINT PK_id_tratamiento_id_medicamento_M_ANTERIOR PRIMARY KEY (id_tratamiento, id_medicamento),
  CONSTRAINT FK_medicacion_anterior_id_tratamiento FOREIGN KEY (id_tratamiento) REFERENCES tratamiento(id_tratamiento),
  CONSTRAINT FK_medicacion_anterior_id_medicamento FOREIGN KEY (id_medicamento) REFERENCES vademecum(id_medicamento)
);

CREATE TABLE medicacion_actual
(
  dosis VARCHAR(35) NOT NULL,
  fecuencia VARCHAR(35) NOT NULL,
  id_tratamiento INT NOT NULL,
  id_medicamento INT NOT NULL,
  CONSTRAINT PK_id_tratamiento_id_medicamento_M_ACTUAL PRIMARY KEY (id_tratamiento, id_medicamento),
  CONSTRAINT FK_medicacion_actual_id_tratamiento FOREIGN KEY (id_tratamiento) REFERENCES tratamiento(id_tratamiento),
  CONSTRAINT FK_medicacion_actual_id_medicamento FOREIGN KEY (id_medicamento) REFERENCES vademecum(id_medicamento)
);