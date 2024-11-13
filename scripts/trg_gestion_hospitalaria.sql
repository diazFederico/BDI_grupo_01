
--- Trigger para marcar automáticamente el final de un tratamiento
CREATE TRIGGER actualizar_historia_clinica_tratamiento_finalizado
AFTER UPDATE ON tratamiento
FOR EACH ROW
BEGIN
  IF NEW.fecha_fin IS NOT NULL THEN
    INSERT INTO historia_clinica (fecha_registro, diagnostico, observaciones, id_paciente, id_medico)
    VALUES (CURDATE(), 'Tratamiento finalizado', 'Tratamiento completado', NEW.id_paciente, NEW.id_medico);
  END IF;
END;


--- Verificar que la fecha de finalización de tratamiento no sea anterior a la de inicio
CREATE TRIGGER validar_fecha_tratamiento
BEFORE INSERT ON tratamiento
FOR EACH ROW
BEGIN
  IF NEW.fecha_fin IS NOT NULL AND NEW.fecha_fin < NEW.fecha_inicio THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'La fecha de fin no puede ser anterior a la fecha de inicio del tratamiento.';
  END IF;
END;


--- Evitar medicación duplicada para un mismo paciente
CREATE TRIGGER evitar_medicacion_duplicada
BEFORE INSERT ON tratamiento
FOR EACH ROW
BEGIN
  DECLARE medicacion_duplicada INT;
  SELECT COUNT(*) INTO medicacion_duplicada
  FROM tratamiento
  WHERE id_paciente = NEW.id_paciente AND id_medicacion = NEW.id_medicacion AND fecha_fin IS NULL;
  
  IF medicacion_duplicada > 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'El paciente ya está recibiendo este medicamento.';
  END IF;
END;


--- Evitar que un paciente tenga más de una internación activa a la vez
CREATE TRIGGER evitar_internacion_duplicada
BEFORE INSERT ON internacion
FOR EACH ROW
BEGIN
  DECLARE internaciones_activas INT;
  SELECT COUNT(*) INTO internaciones_activas
  FROM internacion
  WHERE id_paciente = NEW.id_paciente AND fecha_egreso IS NULL;
  
  IF internaciones_activas > 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'El paciente ya tiene una internación activa.';
  END IF;
END;


--- Validar la edad del paciente al ingresar un nuevo registro
CREATE TRIGGER verificar_edad_paciente
BEFORE INSERT ON paciente
FOR EACH ROW
BEGIN
  DECLARE edad INT;
  SET edad = TIMESTAMPDIFF(YEAR, NEW.fecha_nacimiento, CURDATE());
  IF edad < 18 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'El paciente es menor de edad.';
  END IF;
END;
