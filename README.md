# Diagrama Relacional - Gestor de Historias Clínicas, Medicaciones y Pacientes Internados

# Descripción del Trabajo Práctico
Este trabajo práctico se centra en el desarrollo de un modelo de diagrama relacional destinado a optimizar la gestión de información médica relacionada con pacientes internados. Se investigará la estructura y las relaciones entre las entidades clave que componen el sistema: Pacientes, Historias Clínicas, Internaciones, Médicos, Medicaciones y Tratamientos.

El objetivo es abordar el problema de la fragmentación de la información en el ámbito de la salud, que puede dificultar el seguimiento de la atención médica. A través de un diseño relacional claro y eficiente, se busca facilitar el acceso y la actualización de datos clínicos, permitiendo así una atención más coordinada y segura.

[imagen](./assets/diagrama.png)

## Entidades principales:

1. **Paciente**: Información sobre los pacientes.
2. **Historia Clínica**: Registros médicos de los pacientes.
3. **Internación**: Información sobre las internaciones de los pacientes.
4. **Médico**: Información sobre los médicos que atienden a los pacientes.
5. **Medicación**: Detalles de los medicamentos recetados.
6. **Tratamiento**: Relaciona la medicación con el paciente, indicando las dosis y duración.

## Relaciones:

- **Paciente** puede tener múltiples **Historias Clínicas**.
- **Paciente** puede estar **Internado** en diferentes momentos.
- **Historia Clínica** es creada y gestionada por un **Médico**.
- **Internación** se vincula con un **Médico** que gestiona el caso y con **Pacientes**.
- **Medicación** puede ser recetada a **Pacientes** durante su internación o como parte de un **Tratamiento**.

## Diagrama Relacional Propuesto:

### Tabla Paciente:
- ID_Paciente (PK)
- Nombre
- Apellido
- Fecha_Nacimiento
- Género
- Dirección
- Teléfono
- Correo_Electrónico

### Tabla Historia Clínica:
- ID_Historia (PK)
- ID_Paciente (FK)
- ID_Médico (FK)
- Fecha_Registro
- Diagnóstico
- Observaciones

### Tabla Internación:
- ID_Internación (PK)
- ID_Paciente (FK)
- ID_Médico (FK)
- Fecha_Ingreso
- Fecha_Egreso (NULLABLE)
- Motivo_Internación
- Observaciones

### Tabla Médico:
- ID_Médico (PK)
- Nombre
- Apellido
- Especialidad
- Teléfono
- Correo_Electrónico

### Tabla Medicación:
- ID_Medicación (PK)
- Nombre_Medicamento
- Descripción
- Dosis_Estandar

### Tabla Tratamiento:
- ID_Tratamiento (PK)
- ID_Paciente (FK)
- ID_Medicación (FK)
- ID_Médico (FK)
- Fecha_Inicio
- Fecha_Fin (NULLABLE)
- Dosis_Recetada
- Frecuencia
- Observaciones

## Relaciones y Claves Foráneas:
- **Paciente** → **Historia Clínica**: Relación 1 a muchos.
- **Paciente** → **Internación**: Relación 1 a muchos.
- **Médico** → **Historia Clínica**: Relación 1 a muchos.
- **Médico** → **Internación**: Relación 1 a muchos.
- **Medicación** → **Tratamiento**: Relación 1 a muchos.
- **Paciente** → **Tratamiento**: Relación 1 a muchos.
- **Médico** → **Tratamiento**: Relación 1 a muchos.

Este modelo permite gestionar eficientemente la información clínica de los pacientes, sus internaciones y las medicaciones recetadas, asegurando una visión clara y centralizada de su historial médico.
