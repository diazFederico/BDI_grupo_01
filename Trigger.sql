--Creacion de la tabla de auditoriaPaciente
CREATE TABLE auditoriaPaciente (
    id_paciente        INT,
    nombre             CHAR(30),
    fecha_nacimiento   DATE,
    genero             CHAR,
    direccion          VARCHAR(80),
    telefono           NUMERIC(16),
    email              VARCHAR(100),
    apellido           CHAR(30)
);
GO



--Triggers para INSERT en paciente
CREATE TRIGGER trg_auditPaciente_insert
ON paciente
AFTER INSERT
AS
BEGIN
    INSERT INTO auditoriaPaciente
    SELECT id_paciente, nombre, fecha_nacimiento, genero, direccion, telefono, email, apellido
    FROM inserted;
END;
GO


--Trigger para UPDATE en paciente
CREATE TRIGGER trg_auditPaciente_update
ON paciente
AFTER UPDATE
AS
BEGIN
        -- Registrar los valores antes de la modificación en una tabla auxiliar
        INSERT INTO auditoriaPaciente
        SELECT *
        FROM deleted;
END;
GO

--Trigger para DELETE en paciente
CREATE TRIGGER trg_auditPaciente_delete
ON paciente
AFTER DELETE
AS
BEGIN
    INSERT INTO auditoriaPaciente
    SELECT id_paciente, nombre, fecha_nacimiento, genero, direccion, telefono, email, apellido,
    FROM deleted;
END;
GO

--------------------------------------------------------------------------------------------------------------
--Creacion de la tabla de auditoriaMedico
CREATE TABLE auditoriaMedico (
    id_medico          INT,
    nombre             CHAR(30),
    apellido           CHAR(30),
    telefono           NUMERIC(15),
    email              VARCHAR(60),
    id_especialidad    INT,
);
GO

--Trigger para la operacion INSERT en medico
CREATE TRIGGER trg_auditMedico_insert
ON medico
AFTER INSERT
AS
BEGIN
    INSERT INTO auditoriaMedico
    SELECT id_medico, nombre, apellido, telefono, email, id_especialidad,
    FROM inserted;
END;
GO

--Trigger para la operacion de UPDATE en medico
CREATE TRIGGER trg_auditMedico_update
ON medico
AFTER UPDATE
AS
BEGIN
    INSERT INTO auditoriaMedico
    SELECT id_medico, nombre, apellido, telefono, email, id_especialidad,
    FROM deleted;
END;
GO


--Trigger para DELETE en medico
CREATE TRIGGER trg_auditMedico_delete
ON medico
AFTER DELETE
AS
BEGIN
    INSERT INTO auditoriaMedico
    SELECT id_medico, nombre, apellido, telefono, email, id_especialidad, 
    FROM deleted;
END;
GO


--------------------------------------------------------------------------------------------------------------
--Creacion de la tabla de auditoriaTratamiento
CREATE TABLE auditoriaTratamiento (
    id_tratamiento     INT,
    fecha_inicio       DATE,
    fecha_fin          DATE,
    dosis_recetada     FLOAT,
    frecuencia         INT,
    observaciones      VARCHAR(100),
    id_paciente        INT,
    id_medicacion      INT,
    id_medico          INT,
    fechayhora         DATETIME,
    usuario            VARCHAR(50),
    tipoOperacion      VARCHAR(50)
);
GO


--INSERT en tratamiento
CREATE TRIGGER trg_auditTratamiento_insert
ON tratamiento
AFTER INSERT
AS
BEGIN
    INSERT INTO auditoriaTratamiento
    SELECT id_tratamiento, fecha_inicio, fecha_fin, dosis_recetada, frecuencia, observaciones,
           id_paciente, id_medicacion, id_medico, GETDATE(), SUSER_NAME(), 'Insert'
    FROM inserted;
END;
GO

--Trigger para la operación de UPDATE en tratamiento
CREATE TRIGGER trg_auditTratamiento_update
ON tratamiento
AFTER UPDATE
AS
BEGIN
    INSERT INTO auditoriaTratamiento
    SELECT id_tratamiento, fecha_inicio, fecha_fin, dosis_recetada, frecuencia, observaciones,
           id_paciente, id_medicacion, id_medico, GETDATE(), SUSER_NAME(), 'Update'
    FROM deleted;
END;
GO

-- DELETE en tratamiento
CREATE TRIGGER trg_auditTratamiento_delete
ON tratamiento
AFTER DELETE
AS
BEGIN
    INSERT INTO auditoriaTratamiento
    SELECT id_tratamiento, fecha_inicio, fecha_fin, dosis_recetada, frecuencia, observaciones,
           id_paciente, id_medicacion, id_medico, GETDATE(), SUSER_NAME(), 'Delete'
    FROM deleted;
END;
GO

--Códigos de prueba para la prueba de los triggers

-----TABLA PACIENTE-----
--Se inserta un nuevo paciente
INSERT INTO paciente VALUES (1, 'Juan', '1990-05-15', 'M', 'Calle 123', 123456789, 'juan@mail.com', 'Perez');
INSERT INTO paciente VALUES (2, 'Ariel', '2001-05-25', 'M', 'Sin calle', 22222, 'ariel@gmail.com', 'Antinori');

SELECT * FROM auditoriapaciente;
--Se modifica el paciente ingresado anteriormente
UPDATE paciente SET nombre = 'Juan Carlos' WHERE id_paciente = 1;

--Se elimina el paciente
DELETE FROM paciente WHERE id_paciente = 1;

--Consulta la tabla de auditoría para verificar los registros
SELECT * FROM paciente;
SELECT * FROM auditoriapaciente;
SELECT * FROM paciente WHERE id_paciente = 1;

 