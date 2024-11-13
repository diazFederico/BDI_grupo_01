# 2. Marco conceptual 📝

Un marco conceptual sobre triggers en SQL implica establecer una comprensión teórica y operativa sobre qué son los triggers (o desencadenadores), cómo funcionan y cuál es su propósito dentro de una base de datos relacional. En este contexto, el marco conceptual de los triggers en SQL se basa en varios conceptos clave que se interrelacionan para automatizar y controlar el flujo de operaciones sobre los datos.

## Conceptos clave en un marco conceptual sobre triggers en SQL:
1. **Trigger (Desencadenador)**:

- Un trigger es un objeto asociado a una tabla en una base de datos que se activa automáticamente en respuesta a un evento específico, como la inserción, actualización o eliminación de registros. Su propósito principal es permitir la automatización de tareas y la validación de datos sin la necesidad de intervención directa del usuario o aplicación.

- Los triggers pueden ejecutarse antes (BEFORE) o después (AFTER) de que se lleve a cabo la operación en la tabla, dependiendo de cuándo se desea que se ejecuten las acciones automatizadas.

2. **Eventos que activan los triggers**:
- INSERT: Un trigger puede activarse cuando se inserta una nueva fila en la tabla.
- UPDATE: Un trigger puede ejecutarse cuando se actualiza una fila existente en la tabla.
- DELETE: Un trigger se activa cuando se elimina una fila de la tabla.
Estos eventos permiten que las bases de datos reacciones a las modificaciones de manera dinámica, como la validación de datos, auditoría o actualización de registros relacionados.

3. Operación de un trigger:

- Los triggers son definidos para ejecutarse de forma automática, sin intervención externa, lo que implica que el código que se ejecuta dentro de un trigger no es invocado explícitamente por el usuario.

- Los triggers pueden modificarse, por ejemplo, para ajustar los datos a ciertas reglas de negocio (como en el caso de validaciones de rangos o formatos), o bien para realizar tareas adicionales como el registro de auditoría o la actualización de registros en otras tablas (como mantener consistencia entre datos relacionados).

4. **Elementos y estructuras de un trigger**:

- Nuevo Valor (NEW): Dentro de un trigger, el término NEW se refiere a los valores que se están insertando o actualizando en una fila.
- Viejo Valor (OLD): En un trigger de tipo DELETE o UPDATE, el término OLD hace referencia a los valores de la fila antes de la modificación.
- Cuerpo del Trigger: El cuerpo del trigger es el bloque de código donde se define la acción a ejecutar, ya sea para validar valores, realizar cálculos o modificar otras tablas.

5. **Tipos de triggers**:

- BEFORE Trigger: Se ejecuta antes de que la operación de inserción, actualización o eliminación se lleve a cabo. Esto permite hacer verificaciones o modificaciones en los datos antes de que sean comprometidos en la base de datos.
- AFTER Trigger: Se ejecuta después de que la operación haya sido realizada. Es útil cuando se desea realizar acciones que dependen de los cambios ya aplicados, como actualizaciones en tablas relacionadas o el registro de auditoría.

6. **Casos de uso de triggers**:

- Validación de datos: Por ejemplo, un trigger puede garantizar que un valor de nota en una tabla de estudiantes no sea negativo ni mayor que un límite máximo.
- Auditoría: Un trigger puede registrar los cambios realizados en las tablas para mantener un historial de las operaciones.
- Actualización de tablas relacionadas: Un trigger puede actualizar otras tablas relacionadas para mantener la consistencia referencial entre ellas.
- Implementación de reglas de negocio: Triggers pueden garantizar que ciertas reglas de negocio se apliquen automáticamente cuando se insertan o actualizan datos.

<table>
  <tr>
    <td><a href="Cap1.md"><button style="border-radius: 7px; padding: 10px 20px;">Anterior</button></a></td>
    <td><a href="Cap3.md"><button style="border-radius: 7px; padding: 10px 20px;">Siguiente</button></a></td>
  </tr>
</table>
