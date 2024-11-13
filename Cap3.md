# 3. Metodología Seguida🧠

## Identificación del Tema y Objetivos:

Lo que hicimos primeramente fue definir el alcance del trabajo y delimitar el tema principal **los desencadenadores** en bases de datos. Los objetivos incluyeron identificar, clasificar y analizar los diferentes tipos de triggers existentes y aplicarlos a nuestro esquema de base de datos de historias clínicas, internaciones y eventos hospitalarios.

## Revisión Bibliográfica y Teórica:

Individualmente hicimos una investigación en internet mediante revisión de artículos, documentación técnica y videos educativos de YouTube, para entender cómo funcionan los triggers, sus usos, alcances y limitaciones. 
Luego nos reunimos vía meet para comentar que fue lo que cada uno investigó y de esta manera llegamos a una sintesis para realizar el trabajo.

## Recolección de Información:

**Fuentes bibliográficas y técnicas:**

Mayormente el método que utilizamos para recabar información fue internet y los LLM redactores y explicadores de codigo para entender las especificaciones técnicas y funcionalidad de los triggers.

## Herramientas (Instrumentos y Procedimientos)
- Microsoft SQL server: como motor de bases de datos
- DuckDuckGo: como motor de búsqueda
- ELibro: como plataforma de recolección de información bibliográfica
- ChatGPT y datalab: como LLM explicadores de código

## Implementación y Pruebas:

**Lenguajes y Scripts SQL:** El código SQL fue el lenguaje para la creación y prueba de la base de datos, las distintas tablas, implementacion de restricciones y triggers.

Durante el proceso algunas de **las dificultades encontradas** incluyeron:

- **Coherencia en el Esquema Relacional y Normalización:**
Una de las primeras dificultades fue lograr que el esquema relacional sea coherente y bien estructurado, que estuviera normalizado y que no se generaran conflictos de integridad. La normalización de la base de datos resultó ser un desafío adicional, ya que implicaba dividir las tablas en entidades más pequeñas para evitar redundancias y mejorar la integridad referencial, sin perder de vista la estructura necesaria para la aplicación de los triggers.

- **Variabilidad de la Sintaxis SQL:**
Cada sistema de gestión de bases de datos (SGBD) tiene una sintaxis ligeramente distinta para la creación y el manejo de triggers. Esta variabilidad hizo que el proceso fuera más laborioso, ya que fue necesario realizar pruebas y ajustes en el sistema para asegurar la funcionalidad esperada. Por ejemplo: en SQLSERVER el tipo de dato no es BOOLEAN sino BIT.

- **Manejo de Errores en la Ejecución:**
Implementar triggers implica anticipar y gestionar posibles errores que puedan surgir en su ejecución, especialmente cuando se trata de operaciones que alteran datos en varias tablas de forma automática. Al configurar los triggers, surgieron errores no anticipados, como conflictos en la restricción de llaves foráneas y problemas de concurrencia al realizar operaciones simultáneas. Estos errores requirieron un análisis exhaustivo y ajustes en el código para asegurar la integridad de los datos y la estabilidad del sistema.

<table>
  <tr>
    <td><a href="Cap2.md"><button style="border-radius: 7px; padding: 10px 20px;">Anterior</button></a></td>
    <td><a href="Cap4.md"><button style="border-radius: 7px; padding: 10px 20px;">Siguiente</button></a></td>
  </tr>
</table>