-- Triggers para auditoria de pacientes agregados, actualizados o eliminados
-- select * from paciente_audit_log;

-- Esta tabla es necesaria para ir guardando el log de los pacientes ABM
CREATE TABLE paciente_audit_log
(
    id_log INT IDENTITY(1,1) PRIMARY KEY,
    id_paciente NUMERIC(15),
    nombre VARCHAR(30),
    apellido CHAR(30),
    fecha_nacimiento DATE,
    accion VARCHAR(10),  -- 'INSERT', 'UPDATE', 'DELETE'
    fecha_accion DATETIME
);


CREATE TRIGGER trg_audit_paciente
ON paciente
FOR INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @action VARCHAR(10)
    DECLARE @id_paciente NUMERIC(15)
    DECLARE @nombre VARCHAR(30)
    DECLARE @fecha_nacimiento DATE
    DECLARE @genero CHAR
    DECLARE @direccion VARCHAR(80)
    DECLARE @telefono NUMERIC(16)
    DECLARE @email VARCHAR(100)
    DECLARE @apellido CHAR(30)
    DECLARE @activo BIT

    IF EXISTS (SELECT * FROM inserted)
    BEGIN
        SET @action = 'INSERT'
        SELECT @id_paciente = id_paciente, @nombre = nombre, @fecha_nacimiento = fecha_nacimiento, @genero = genero, 
               @direccion = direccion, @telefono = telefono, @email = email, @apellido = apellido, @activo = activo
        FROM inserted
    END
    ELSE IF EXISTS (SELECT * FROM deleted)
    BEGIN
        SET @action = 'DELETE'
        SELECT @id_paciente = id_paciente, @nombre = nombre, @fecha_nacimiento = fecha_nacimiento, @genero = genero, 
               @direccion = direccion, @telefono = telefono, @email = email, @apellido = apellido, @activo = activo
        FROM deleted
    END

    -- Insertar un registro de auditoría en una tabla de log (que deberías crear)
    INSERT INTO paciente_audit_log (id_paciente, nombre, apellido, fecha_nacimiento, accion, fecha_accion)
    VALUES (@id_paciente, @nombre, @apellido, @fecha_nacimiento, @action, GETDATE());
END;

-- Para probar:
-- Insertar un nuevo paciente
--INSERT INTO paciente (id_paciente, nombre, fecha_nacimiento, genero, direccion, telefono, email, apellido, activo)
--VALUES (123456, 'Juan', '1985-05-15', 'M', 'Calle Ficticia 123', 123456789012, 'juan@email.com', 'Pérez', 1);
-- Eliminar un paciente por su id
--DELETE FROM paciente
--WHERE id_paciente = 123456;
-- Modificar los datos de un paciente existente
--UPDATE paciente
--SET nombre = 'Juan Carlos', direccion = 'Calle Ficticia 456', telefono = 987654321012, email = 'juancarlos@email.com', activo = 1
--WHERE id_paciente = 123456;

-- Guardar en medicacion_anterior los distintos cambios (eliminaciones) de las medicaciones actuales
CREATE TRIGGER trg_guardar_medicacion_eliminada
ON medicacion_actual
FOR DELETE
AS
BEGIN
    -- Variables para almacenar los valores de los registros eliminados
    DECLARE @dosis VARCHAR(35)
    DECLARE @frecuencia VARCHAR(35)
    DECLARE @id_tratamiento INT
    DECLARE @id_medicamento INT

    -- Insertar los registros eliminados en medicacion_anterior
    INSERT INTO medicacion_anterior (dosis, frecuencia, id_tratamiento, id_medicamento)
    SELECT dosis, frecuencia, id_tratamiento, id_medicamento
    FROM deleted
END;

-- Para probar:
-- Eliminar el registro con id_tratamiento = 2 de medicacion_actual
-- DELETE FROM medicacion_actual
-- WHERE id_tratamiento = 2;


--EVITAR QUE LA FECHA DE EGRESO SEA MENOR A LA FECHA DE INGRESO
CREATE TRIGGER trg_check_fecha_egreso
ON internacion
AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @fecha_ingreso DATE, @fecha_egreso DATE;
    
    -- Obtener los valores de fecha_ingreso y fecha_egreso de las filas afectadas
    SELECT @fecha_ingreso = fecha_ingreso, @fecha_egreso = fecha_egreso
    FROM inserted;
    
    -- Verificar la condición
    IF @fecha_egreso < @fecha_ingreso
    BEGIN
        RAISERROR('La fecha de egreso no puede ser anterior a la fecha de ingreso.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;

