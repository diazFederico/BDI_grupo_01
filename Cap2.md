# 2. Marco conceptual 📝

## Conceptos clave en un marco conceptual sobre triggers en SQL:
1. **Trigger (Desencadenador)**:

Es un objeto asociado a una tabla en una base de datos que se activa automáticamente en respuesta a un evento específico, como la inserción, actualización o eliminación de registros.

Su propósito principal es permitir la automatización de tareas y la validación de datos sin la necesidad de intervención directa del usuario o su codificación en la aplicación.

2. **Eventos que los activan**:

Llamamos a estas "operaciones" **eventos** ya que ocurren en la tabla y estos pueden ser:

|Sentencia SQL|Momento de activación|
|---|---|
|INSERT|Cuando se inserta una nueva fila en la tabla.|
|UPDATE|Cuando se actualiza una fila existente en la tabla.|
|DELETE|Cuando se elimina una fila de la tabla.|

Estos eventos permiten que las bases de datos reaccionen a las modificaciones de manera dinámica.

Un uso práctico de lo antes mencionado es por ejemplo: la validación de datos, auditoría o actualización de registros relacionados de forma segura y manteniendo la consistencia.

3. **Operación de un trigger**:

Son definidos para ejecutarse **de forma automática**, sin intervención externa, lo que implica que el código que se ejecuta dentro de un trigger no es invocado explícitamente por el usuario.

Esto establece por ejemplo una diferencia con los procedimientos y funciones, que son bloques de código que se pueden ejecutar explícitamente para realizar tareas específicas, mientras que los triggers son eventos que se ejecutan automáticamente **de forma implícita** en respuesta a cambios en la base de datos.

Pueden modificarse, por ejemplo, para ajustar los datos a ciertas reglas de negocio (como en el caso de validaciones de rangos o formatos), o bien para realizar tareas adicionales como el registro de auditoría o la actualización de registros en otras tablas (como mantener consistencia entre datos relacionados).

4. **Elementos y estructuras de un trigger**:

- Nuevo Valor (NEW): Dentro de un trigger, el término NEW se refiere a los valores que se están insertando o actualizando en una fila.

- Viejo Valor (OLD): En un trigger de tipo DELETE o UPDATE, el término OLD hace referencia a los valores de la fila antes de la modificación.

- Cuerpo del Trigger: El cuerpo del trigger es el bloque de código donde se define la acción a ejecutar, ya sea para validar valores, realizar cálculos o modificar otras tablas.

5. **Tipos de triggers**:

Los triggers pueden ejecutarse antes **BEFORE** o después **AFTER** de que se lleve a cabo la operación en la tabla, dependiendo de cuándo se desea que se ejecuten las acciones automatizadas.

- **BEFORE** Trigger: Se ejecuta **antes** de que la operación de inserción, actualización o eliminación se lleve a cabo. Esto permite hacer verificaciones o modificaciones en los datos antes de que sean comprometidos en la base de datos.

- **AFTER** Trigger: Se ejecuta **después** de que la operación haya sido realizada. Es útil cuando se desea realizar acciones que dependen de los cambios ya aplicados, como actualizaciones en tablas relacionadas o el registro de auditoría.

6. **Casos de uso de triggers**:

- **Validación de datos**: Por ejemplo, un trigger puede garantizar que un valor de nota en una tabla de estudiantes no sea negativo ni mayor que un límite máximo.

- **Auditoría**: Un trigger puede registrar los cambios realizados en las tablas para mantener un historial de las operaciones.

- **Actualización de tablas relacionadas**: Un trigger puede actualizar otras tablas relacionadas para mantener la consistencia referencial entre ellas.

- **Implementación de reglas de negocio**: Triggers pueden garantizar que ciertas reglas de negocio se apliquen automáticamente cuando se insertan o actualizan datos.

<table>
  <tr>
    <td><a href="Cap1.md"><button style="border-radius: 7px; padding: 10px 20px;">Anterior</button></a></td>
    <td><a href="Cap3.md"><button style="border-radius: 7px; padding: 10px 20px;">Siguiente</button></a></td>
  </tr>
</table>
