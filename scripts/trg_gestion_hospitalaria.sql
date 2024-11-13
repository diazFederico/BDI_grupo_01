
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
