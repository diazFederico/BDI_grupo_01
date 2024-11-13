USE gestion_hospitalaria;

INSERT INTO paciente (id_paciente, nombre, fecha_nacimiento, genero, direccion, telefono, email, apellido, activo)
VALUES
(1, 'Juan', '1985-03-15', 'M', 'Calle Ficticia 123', 111234567890, 'juan@email.com', 'Perez', 1),
(2, 'Ana', '1990-07-22', 'F', 'Calle Verdadera 456', 112345678901, 'ana@email.com', 'Lopez', 1),
(3, 'Carlos', '1975-10-10', 'M', 'Av. Siempre Viva 789', 113456789012, 'carlos@email.com', 'Gomez', 1),
(4, 'Maria', '2000-02-03', 'F', 'Calle Larga 101', 114567890123, 'maria@email.com', 'Rodriguez', 1),
(5, 'Luis', '1982-12-30', 'M', 'Calle Sol 102', 115678901234, 'luis@email.com', 'Martinez', 0),
(6, 'Patricia', '1995-06-18', 'F', 'Calle Luna 203', 116789012345, 'patricia@email.com', 'Hernandez', 1),
(7, 'Roberto', '1988-04-10', 'M', 'Calle Estrella 204', 117890123456, 'roberto@email.com', 'Fernandez', 1),
(8, 'Lucia', '1992-08-25', 'F', 'Calle Primavera 305', 118901234567, 'lucia@email.com', 'Perez', 1),
(9, 'Javier', '1980-11-12', 'M', 'Av. Independencia 206', 119012345678, 'javier@email.com', 'Sanchez', 1),
(10, 'Elena', '1997-01-01', 'F', 'Calle Delicias 308', 120123456789, 'elena@email.com', 'Diaz', 1);

INSERT INTO especialidad (descripcion)
VALUES
('Cardiología'),
('Pediatría'),
('Dermatología'),
('Oftalmología'),
('Neurología'),
('Ginecología'),
('Oncología'),
('Traumatología'),
('Psiquiatría'),
('Endocrinología');

INSERT INTO diagnosticos (descripcion)
VALUES
('Hipertensión arterial'),
('Diabetes tipo 2'),
('Acné severo'),
('Cataratas'),
('Esclerosis múltiple'),
('Embarazo ectópico'),
('Cáncer de mama'),
('Fractura de fémur'),
('Trastorno de ansiedad'),
('Hipotiroidismo');

INSERT INTO vademecum (nombre_comercial, principio_activo)
VALUES
('Paracetamol', 'Paracetamol'),
('Ibuprofeno', 'Ibuprofeno'),
('Amoxicilina', 'Amoxicilina'),
('Loratadina', 'Loratadina'),
('Metformina', 'Metformina'),
('Enalapril', 'Enalapril'),
('Omeprazol', 'Omeprazol'),
('Diazepam', 'Diazepam'),
('Sertralina', 'Sertralina'),
('Levodopa', 'Levodopa');

INSERT INTO medico (id_medico, nombre, apellido, telefono, email, id_especialidad)
VALUES
(1, 'Dr. Ana', 'Martínez', 1122334455, 'ana.medico@email.com', 1), -- Cardiología
(2, 'Dr. Luis', 'González', 1133445566, 'luis.medico@email.com', 2), -- Pediatría
(3, 'Dr. Carlos', 'Ramírez', 1144556677, 'carlos.medico@email.com', 3), -- Dermatología
(4, 'Dr. Lucia', 'Fernández', 1155667788, 'lucia.medico@email.com', 4), -- Oftalmología
(5, 'Dr. Marta', 'Sánchez', 1166778899, 'marta.medico@email.com', 5), -- Neurología
(6, 'Dr. Pedro', 'Lopez', 1177889900, 'pedro.medico@email.com', 6), -- Ginecología
(7, 'Dr. Juan', 'Rodríguez', 1188991011, 'juan.medico@email.com', 7), -- Oncología
(8, 'Dr. Maria', 'Diaz', 1199101122, 'maria.medico@email.com', 8), -- Traumatología
(9, 'Dr. José', 'Pérez', 1200212233, 'jose.medico@email.com', 9), -- Psiquiatría
(10, 'Dr. Elena', 'Hernández', 1210323344, 'elena.medico@email.com', 10); -- Endocrinología

INSERT INTO historia_clinica (observaciones, id_paciente, id_medico, id_diagnostico)
VALUES
('Paciente con hipertensión controlada', 1, 1, 1),
('Paciente con diagnóstico de diabetes tipo 2', 2, 2, 2),
('Acné severo tratado con antibióticos', 3, 3, 3),
('Paciente con cataratas en ambos ojos', 4, 4, 4),
('Esclerosis múltiple en tratamiento', 5, 5, 5),
('Embarazo ectópico detectado en ecografía', 6, 6, 6),
('Cáncer de mama en estadio temprano', 7, 7, 7),
('Fractura de fémur tratado con cirugía', 8, 8, 8),
('Trastorno de ansiedad y depresión leve', 9, 9, 9),
('Hipotiroidismo con tratamiento con levotiroxina', 10, 10, 10);

INSERT INTO internacion (fecha_ingreso, fecha_egreso, id_paciente, id_historia)
VALUES
('2024-01-15', '2024-01-20', 1, 1),
('2024-02-05', '2024-02-10', 2, 2),
('2024-03-12', '2024-03-16', 3, 3),
('2024-04-01', '2024-04-07', 4, 4),
('2024-05-15', '2024-05-20', 5, 5),
('2024-06-02', '2024-06-06', 6, 6),
('2024-07-10', '2024-07-15', 7, 7),
('2024-08-20', NULL, 8, 8),
('2024-09-05', NULL, 9, 9),
('2024-10-15', NULL, 10, 10);

INSERT INTO tratamiento (observaciones, id_medico, id_internacion)
VALUES
('Tratamiento antihipertensivo y seguimiento mensual', 1, 1),
('Control de glucosa con medicación oral', 2, 2),
('Tratamiento tópico y antibióticos orales', 3, 3),
('Cirugía de cataratas programada', 4, 4),
('Tratamiento con interferones y seguimiento', 5, 5),
('Medicamentos para estabilizar el embarazo', 6, 6),
('Quimioterapia en ciclos semanales', 7, 7),
('Rehabilitación postquirúrgica', 8, 8),
('Medicamentos ansiolíticos y terapia psicológica', 9, 9),
('Ajuste de dosis de levotiroxina', 10, 10);

INSERT INTO evolucion_tratamiento (fecha, id_evolucion, descripcion, id_internacion)
VALUES
(CAST('2024-01-18' as DATE), 1, 'Mejoría en la presión arterial', 1),
(CAST('2024-02-08' as DATE), 2, 'Control de la glucosa en sangre', 2),
(CAST('2024-03-14' as DATE), 3, 'Mejoría en la piel', 3),
(CAST('2024-04-04' as DATE), 4, 'Intervención quirúrgica exitosa', 4),
(CAST('2024-05-17' as DATE), 5, 'Continuación del tratamiento neurológico', 5),
(CAST('2024-06-04' as DATE), 6, 'Tratamiento antibiótico para la infección', 6),
(CAST('2024-07-12' as DATE), 7, 'Intervención exitosa para el cáncer', 7),
(CAST('2024-08-22' as DATE), 8, 'Fractura en recuperación', 8),
(CAST('2024-09-07' as DATE), 9, 'Tratamiento psicológico en curso', 9),
(CAST('2024-10-18' as DATE), 10, 'Ajuste en la dosis de levotiroxina', 10);

INSERT INTO medicacion_actual (dosis, frecuencia, id_tratamiento, id_medicamento)
VALUES
('10 mg', 'Diario', 1, 6), -- Enalapril
('500 mg', 'Diario', 2, 5), -- Metformina
('250 mg', 'Cada 8 horas', 3, 3), -- Amoxicilina
('0.5 mg', 'Diario', 4, 9), -- Levodopa
('10 mg', 'Cada 12 horas', 5, 7), -- Omeprazol
('4 mg', 'Cada 24 horas', 6, 8), -- Diazepam
('20 mg', 'Cada 3 días', 7, 2), -- Ibuprofeno
('25 mg', 'Cada 6 horas', 8, 4), -- Loratadina
('50 mg', 'Diario', 9, 1), -- Paracetamol
('25 mcg', 'Cada 48 horas', 10, 10); -- Sertralina
