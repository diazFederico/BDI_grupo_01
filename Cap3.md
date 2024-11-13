# 3. Metodología Seguida🧠

**a) Identificación del Tema y Objetivos:**

Lo que hicimos primeramente fue definir el alcance del trabajo y delimitar el tema principal: tipos de triggers 
en bases de datos. Los objetivos incluyeron identificar, clasificar y analizar los diferentes tipos de triggers existentes.

**Revisión Bibliográfica y Teórica:**

Individualmente hicimos una investigación en internet mediante revisión de artículos, documentación técnica y
mirando videos en YouTube, para entender cómo funcionan los triggers, sus usos, beneficios y limitaciones. 
Luego nos reunimos vía meet para comentar que fue lo que cada uno investigo y de esta manera llegamos a un mutuo
acuerdo para realizar el trabajo.

 **Instrumentos de Recolección de Información:**

**Fuentes bibliográficas y técnicas:** Mayormente el método que utilizamos para recabar información fue internet para entender las 
especificaciones técnicas y la funcionalidad de los triggers.

**b) Herramientas (Instrumentos y Procedimientos)**

**Implementación y Pruebas:**

**Lenguajes y Scripts SQL:** El código SQL fue el lenguaje para la creación y prueba de triggers.

Durante el proceso algunas de **las dificultades encontradas** incluyeron en:

**Coherencia en el Esquema Relacional y Normalización:**
Una de las primeras dificultades fue lograr que el esquema relacional sea coherente y bien estructurado, y que facilitara la implementación de triggers sin generar conflictos de integridad. La normalización de la base de datos resultó ser un desafío adicional, ya que implicaba dividir las tablas en entidades más pequeñas para evitar redundancias y mejorar la integridad referencial, sin perder de vista la estructura necesaria para la aplicación de los triggers.

**Variabilidad de la Sintaxis SQL:**
Cada sistema de gestión de bases de datos (SGBD) tiene una sintaxis ligeramente distinta para la creación y el manejo de triggers. Esta variabilidad hizo que el proceso fuera más laborioso, ya que fue necesario realizar pruebas y ajustes en el sistema para asegurar la funcionalidad esperada.

**Manejo de Errores en la Ejecución:**
Implementar triggers implica anticipar y gestionar posibles errores que puedan surgir en su ejecución, especialmente cuando se trata de operaciones que alteran datos en varias tablas de forma automática. Al configurar los triggers, surgieron errores no anticipados, como conflictos en la restricción de llaves foráneas y problemas de concurrencia al realizar operaciones simultáneas. Estos errores requirieron un análisis exhaustivo y ajustes en el código para asegurar la integridad de los datos y la estabilidad del sistema.

<table>
  <tr>
    <td><a href="Cap2.md"><button style="border-radius: 7px; padding: 10px 20px;">Anterior</button></a></td>
    <td><a href="Cap4.md"><button style="border-radius: 7px; padding: 10px 20px;">Siguiente</button></a></td>
  </tr>
</table>