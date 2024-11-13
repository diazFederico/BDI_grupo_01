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


CREATE TRIGGER audit_paciente_changes
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
