# 1. Introducción 📑

El presente trabajo de investigación se centra en los desencadenadores (o en inglés: *triggers*).

En el ámbito de la gestión de bases de datos SQL, los desencadenadores o triggers son mecanismos fundamentales de los cuales nos valemos para automatizar ciertas acciones en respuesta a eventos específicos que ocurren en las tablas de la base de datos.

Un trigger es un **objeto** asociado a una tabla que se activa automáticamente cuando se realiza una operación particular, estas "operaciones" son **eventos** que ocurren en la tabla:
- *INSERT*: El trigger se activa cuando se inserta una nueva fila sobre la tabla asociada.
- *UPDATE*: El trigger se activa cuando se actualiza una fila sobre la tabla asociada.
- *DELETE*: El trigger se activa cuando se elimina una fila sobre la tabla asociada.

Los desencadenadores permiten ejecutar procedimientos de manera transparente y sin intervención manual, lo que nos sirve para garantizar la integridad de los datos, validar valores o realizar auditorías.

Dependiendo del tipo de operación (hablamos de eventos), se pueden definir triggers que se ejecuten antes o después de una acción sobre los datos, lo que otorga un control flexible sobre el flujo de trabajo en la base de datos.

Por ejemplo, en una tabla de estudiantes, podríamos querer asegurarnos de que las notas de los alumnos se mantengan dentro de un rango válido, evitando que se inserten o actualicen valores incorrectos, como notas negativas o mayores a un valor máximo permitido. Para ello, se podrían crear triggers que validen las notas antes de realizar las operaciones de inserción o actualización, ajustándolas automáticamente si es necesario.

A continuación, aplicaremos el tema de los triggers sobre un ejemplo práctico donde creamos una base de datos de gestión hospitalaria que incluye diversas tablas y se implementan triggers para controlar los distintos eventos **ABM**.

<table>
  <tr>
    <td><a href="README.md"><button style="border-radius: 7px; padding: 10px 20px;">Inicio</button></a></td>
    <td><a href="Cap2.md"><button style="border-radius: 7px; padding: 10px 20px;">Siguiente</button></a></td>
  </tr>
</table>