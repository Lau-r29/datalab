# Preguntas de Negocio — Semana 6

## DataLab — Consultas SQL básicas

**Proyecto:** DataLab  
**Semana:** 6  
**Tema:** SQL como lenguaje relacional y sintaxis básica  
**SGBD:** SQL Server  
**Herramienta:** SQL Server Management Studio (SSMS)

---

## 1. Propósito

Este documento registra las **preguntas de negocio** que el equipo desea responder utilizando la base de datos DataLab.

El objetivo no es comenzar directamente escribiendo SQL.

Primero debemos comprender:

> **¿Qué información necesitamos conocer?**

Después identificaremos:

- qué tabla contiene la información;
- qué columnas necesitamos;
- si la pregunta puede resolverse utilizando una sola tabla;
- si requiere información de varias tablas;
- qué consulta SQL permite responderla.

Este documento evolucionará durante el semestre junto con el proyecto.

---

# 2. Proceso de trabajo

Para cada pregunta seguiremos este proceso:

```text
Pregunta de negocio
        ↓
¿Qué queremos conocer?
        ↓
¿Qué tabla(s) contienen la información?
        ↓
¿Qué columna(s) necesitamos?
        ↓
¿Una tabla o varias?
        ↓
Consulta SQL
        ↓
Resultado
        ↓
Validación
```

---

# 3. Preguntas de negocio — Consultas básicas

En esta sección se documentarán preguntas que puedan resolverse principalmente utilizando una tabla.

---

## Pregunta 01 — Científicos de datos

### Pregunta de negocio

> ¿Cuáles son los científicos de datos registrados en DataLab?

### Objetivo

Obtener el listado de científicos de datos registrados en la plataforma.

### Tabla involucrada

```text
cientifico_datos
```

### Columnas necesarias

```text
id_cientifico
nombre
correo
```

### Tipo de consulta

```text
☐ Una tabla

```

### Consulta SQL

```sql
-- SELECT id_cientifico, nombre, correo_institucional
FROM cientifico_datos;
GO
```

### Resultado esperado

Describa brevemente qué información debería devolver la consulta.

```text
Debe de mostrar los datos id_cientifico, nombre y correo_instituional que se encuentran en la tabla cientifico_datos
```

---

## Pregunta 02 — Proyectos

### Pregunta de negocio

> ¿Cuáles son los proyectos registrados en DataLab?

### Objetivo

Obtener el listado de proyectos disponibles.

### Tabla involucrada

```text
proyecto
```

### Columnas necesarias

```text
id_proyecto
nombre
descripcion
```

### Tipo de consulta

```text
☐ Una tabla

```

### Consulta SQL

```sql
SELECT id_proyecto, nombre_proyecto, descripcion
FROM proyecto

```

### Resultado esperado

```text
todos los datos registrados que se encuentran en las columnas id_proyecto, nombre_proyecto, descripcion de la tabla proyecto
```

---

## Pregunta 03 — Datasets

### Pregunta de negocio

> ¿Qué datasets están registrados en DataLab y cuál es su fuente?

### Objetivo

Identificar los datasets disponibles y su procedencia.

### Tabla involucrada

```text
dataset
```

### Columnas necesarias

```text
id_dataset
nombre
fuente
```

### Tipo de consulta

```text
☐ Una tabla

```

### Consulta SQL

```sql
SELECT id_dataset, nombre, fuente
FROM dataset

```

### Resultado esperado

```text
todos los datos registrados que se encuentran en las columnas id_dataset, nombre, fuente descripcion de la tabla dataset
```

---

## Pregunta 04 — Experimentos

### Pregunta de negocio

> ¿Cuáles son los experimentos registrados en DataLab?

### Objetivo

Obtener información básica sobre los experimentos realizados.

### Tabla involucrada

```text
experimento
```

### Columnas necesarias

```text
id_experimento
id_proyecto
id_cientifico
fecha_ejecucion
```

### Tipo de consulta

```text
☐ Una tabla
```

### Consulta SQL

```sql
SELECT id_experimento, id_proyecto, id_cientifico, fecha_ejecucion
FROM experimento

```

### Resultado esperado

```text
todos los datos registrados que se encuentran en las columnas id_experimento, id_proyecto, id_cientifico, fecha_ejecucion de la tabla experimento
```

---

## Pregunta 05 — Modelos

### Pregunta de negocio

> ¿Qué modelos están registrados y qué algoritmo utiliza cada uno?

### Objetivo

Identificar los modelos disponibles y los algoritmos utilizados.

### Tabla involucrada

```text
modelo
```

### Columnas necesarias

```text
id_modelo
nombre
version
algoritmo
```

### Tipo de consulta

```text
☐ Una tabla

```

### Consulta SQL

```sql
SELECT id_modelo , nombre, version, algoritmo
FROM modelo
```

### Resultado esperado

```text
todos los datos registrados que se encuentran en las columnas id_modelo , nombre, version, algoritmo de la tabla modelo

```

---

# 4. Preguntas que requieren información de varias tablas

Algunas preguntas de negocio no pueden responderse adecuadamente utilizando una sola tabla.

En esta sección **no es necesario construir todavía el `JOIN`**.

El objetivo de esta semana es reconocer que la pregunta necesita información distribuida en diferentes tablas.

---

## Pregunta 06 — Científico y experimento
### Pregunta de negocio

> ¿Qué científico de datos ejecutó cada experimento?

### Información necesaria

```text
cientifico_datos
experimento
```

### ¿Por qué necesitamos varias tablas?

Explique qué información se encuentra en cada tabla.

```text
cientifico_datos:
id_cientifico
nombre

experimento:
[Escriba aquí]
```
id_cientifico
nombre

### Tipo de consulta

```text

☒ Varias tablas
```

### ¿Requiere JOIN?

```text
☒ Sí
☐ No
```

### Consulta SQL

```sql
-- No es necesario resolver todavía el JOIN.
-- Describa aquí qué información necesitaría relacionar.
```
Es necesario relacionar las dos tablas para encontrar en que experimentos participo cada cientifico, de talanera que cada id_cientifico debe coincidir con un id_experimento 

### Resultado esperado

```text
El id_cientifico.= "1" participo en el id_dxperimento ="5"
```

---

## Pregunta 07 — Proyecto y experimento

### Pregunta de negocio

> ¿Qué experimentos pertenecen a cada proyecto?

### Información necesaria

```text
proyecto
experimento
```

### Tipo de consulta

```text
☐ Una tabla
☒ Varias tablas
```

### ¿Requiere JOIN?

```text
☒ Sí
☐ No
```

### Consulta SQL

```sql
-- El JOIN se desarrollará posteriormente.
```

### Resultado esperado

```text
Resultado en el que se relacione que experimentos son realizados por que proyecto
```

---

## Pregunta 08 — Experimento y modelo

### Pregunta de negocio

> ¿Qué modelos fueron generados a partir de cada experimento?

### Información necesaria

```text
experimento
modelo
```

### Tipo de consulta

```text
☐ Una tabla
☒ Varias tablas
```

### ¿Requiere JOIN?

```text
☒ Sí
☐ No
```

### Resultado esperado

```text
[Escriba aquí]
```
Relación en la que se identifica que modelo está asociado con que experimento en dado caso que sea un experimento exitoso
---

## Pregunta 09 — Dataset y experimento

### Pregunta de negocio

> ¿Qué datasets fueron utilizados en cada experimento?

### Información necesaria

```text
dataset
uso_dataset
experimento
```

### Tipo de consulta

```text
☐ Una tabla
☒ Varias tablas
```

### ¿Requiere JOIN?

```text
☒ Sí
☐ No
```

### Resultado esperado

```text
Relaciona que experimento utilizo que dataset para ser ejecutar
```

---

# 5. Consultas que utilizan `DISTINCT`

Identifique al menos una pregunta que requiera obtener valores únicos.

### Pregunta de negocio

> ¿Qué algoritmos diferentes se han utilizado en los modelos?

### Tabla

```text
modelo
```

### Columna

```text
algoritmo
```

### ¿Puede haber valores repetidos?

```text
☐ No
```

### ¿Necesitamos `DISTINCT`?

```text
☐ Sí

```

### Consulta SQL

```sql
-- Escriba aquí la consulta
```
SELECT DISTICT algoritmo
FROM modelo;
---

# 6. Consultas que utilizan `ORDER BY`

Identifique una pregunta que requiera ordenar los resultados.

### Pregunta de negocio

> ¿Cómo podemos listar los proyectos en orden alfabético?

### Tabla

```text
proyecto
```

### Columna utilizada para ordenar

```text
nombre_proyecto
```

### Orden

```text
☐ ASC

```

### Consulta SQL

```sql
SELECT nombre_proyecto
FROM proyecto
ORDER BY ASC;
```


---

# 7. Consultas que utilizan `TOP`

Identifique una pregunta que requiera limitar la cantidad de resultados.

### Pregunta de negocio

> ¿Cuáles son los tres primeros proyectos según un criterio de orden?

### Tabla

```text
proyecto
```

### Cantidad de registros

```text
3
```

### Criterio de orden

```text
Siguiendo los id_proyecto
```

### Consulta SQL

```sql
-- Escriba aquí la consulta
``` SELECT TOP 3 id_proyecto, nombre_proyecto, descripción 
FROM proyecto
ORDER BY id_proyecto ASC;

---

# 8. Matriz de preguntas

Complete la siguiente tabla con las preguntas desarrolladas.

| # | Pregunta | Tabla(s) | ¿Una o varias tablas? | ¿DISTINCT? | ¿ORDER BY? | ¿TOP? | ¿JOIN futuro? |
|---|---|---|---|---|---|---|---|
| 01 | Científicos registrados | una|no | no| no| no|no |
| 02 | Proyectos registrados | una|no |no |no | no|no |
| 03 | Datasets registrados |una |no |no |no | no|no |
| 04 | Experimentos registrados |una |no |no | no| no|no |
| 05 | Modelos y algoritmos |una |no |no |si |no |no |
| 06 | Científico y experimento |varias |no | no| no|no | si|
| 07 | Proyecto y experimento |varias | no|no | no|no |si |
| 08 | Experimento y modelo |varias |no |no | no| no|si |
| 09 | Dataset y experimento |varias |no | no|no | no| no|

---

# 9. Validación de las consultas

Para cada consulta básica debemos verificar:

### Pregunta

¿La consulta responde exactamente la pregunta de negocio?

```text
☐ Sí
```

### Columnas

¿La consulta devuelve solamente las columnas necesarias?

```text
☐ Sí

```

### Datos

¿Los resultados corresponden con los datos existentes en DataLab?

```text
☐ Sí

```

### Duplicados

¿Existen registros repetidos que deberían eliminarse del resultado?

```text

☐ No
``

### Orden

¿Los resultados necesitan un orden específico?

```text
☐ Sí
```

---

# 10. Preguntas pendientes para próximas semanas

Las siguientes preguntas fueron identificadas pero requieren conocimientos que se desarrollarán posteriormente.

| Pregunta | Tablas involucradas | Concepto futuro |
|---|---|---|
| ¿Qué científico ejecutó cada experimento? | cientifico_datos + experimento | JOIN |
| ¿Qué experimentos pertenecen a cada proyecto? | proyecto + experimento | JOIN |
| ¿Qué modelos fueron generados por cada experimento? | experimento + modelo | JOIN |
| ¿Qué datasets fueron utilizados en cada experimento? | dataset + uso_dataset + experimento | JOIN |

> **Importante:** identificar una pregunta como "pendiente" no significa que esté incompleta. Significa que estamos reconociendo qué conocimiento SQL necesitamos aprender para resolverla.

---

# 11. Reflexión Feynman

Explique con sus propias palabras:

### ¿Qué diferencia existe entre una pregunta de negocio y una consulta SQL?

```text
[Escriba aquí]
```

### ¿Por qué no debemos comenzar escribiendo SQL antes de comprender la pregunta?

```text
[Escriba aquí]
```

### ¿Cómo puedo determinar si una pregunta necesita una o varias tablas?

```text
[Escriba aquí]
```

### ¿Qué significa que una consulta sea declarativa?

```text
[Escriba aquí]
```

---

# 12. Evidencia de trabajo

Cada integrante del equipo debe poder explicar al menos una de las consultas desarrolladas.

Para la sustentación, el estudiante puede ser preguntado:

- ¿Qué pregunta responde esta consulta?
- ¿Por qué seleccionaste esas columnas?
- ¿Por qué utilizaste `DISTINCT`?
- ¿Por qué utilizaste `ORDER BY`?
- ¿Por qué utilizaste `TOP`?
- ¿Qué tabla contiene la información?
- ¿Qué consulta requerirá posteriormente un `JOIN`?
- ¿Cómo sabes que el resultado obtenido es correcto?

---

# 13. Relación con el repositorio

Este documento debe almacenarse en:

```text
casos_uso/s06-preguntas-negocio.md
```

La consulta SQL correspondiente debe almacenarse en:

```text
scripts/consultas/s06-consultas-basicas.sql
```

Los datos utilizados deben prepararse mediante:

```text
scripts/dml/s06-reset-datos.sql
scripts/dml/s06-datos-semilla.sql
```

---

# 14. Commit sugerido

```bash
git add .
git commit -m "consulta: primeras consultas SELECT básicas sobre DataLab"
git push
```

---

# 15. Checklist

Antes de finalizar:

- [ ] Las preguntas de negocio están claramente redactadas.
- [ ] Identifiqué las tablas involucradas.
- [ ] Identifiqué las columnas necesarias.
- [ ] Diferencié preguntas de una tabla y de varias tablas.
- [ ] Implementé las consultas básicas.
- [ ] Utilicé `DISTINCT` cuando corresponde.
- [ ] Utilicé `ORDER BY` cuando corresponde.
- [ ] Utilicé `TOP` cuando corresponde.
- [ ] Identifiqué las preguntas que posteriormente requerirán `JOIN`.
- [ ] Validé los resultados.
- [ ] Documenté mis decisiones.
- [ ] El archivo está almacenado en `casos_uso/`.
- [ ] El trabajo está versionado en Git.

---

## Nota para el equipo

Este documento **evolucionará durante el semestre**.

No es necesario resolver desde ahora todas las preguntas.

La intención es que DataLab pase progresivamente de:

```text
Preguntas
   ↓
Consultas básicas
   ↓
JOIN
   ↓
Agrupaciones
   ↓
Subconsultas
   ↓
Consultas de negocio
```

Cada semana agregaremos nuevas capacidades para responder preguntas más complejas sobre los mismos datos.

// SEMANA 8 //

# Actividad 17 — Nuevas preguntas de negocio

Resuelve las siguientes preguntas utilizando SQL.

## Pregunta de negocio 1

**¿Cuántos datasets existen por fuente?**

Requisito:

```text

SELECT fuente, count(*) as datasets_x_fuente
FROM dataset
group by fuente;

```

---

## Pregunta de negocio 2

**¿Cuántos experimentos se encuentran en cada estado?**

Requisito:

```text
SELECT estado, count(*) as experimentos_x_estado
FROM experimento
group by estado;

```

---

## Pregunta de negocio 3

**¿Cuál es el promedio de cada tipo de métrica?**

Requisito:

```text
SELECT nombre_metrica, avg(valor) as promedio
FROM metrica
group by nombre_metrica;

```

---

## Pregunta de negocio 4

**¿Qué tipos de métrica tienen un promedio superior a 0.8?**

Requisito:

```text
GROUP BY + AVG + HAVING
```
SELECT nombre_metrica, avg(valor) as promedio
FROM metrica
group by nombre_metrica
having avg(valor) > 0.8;
---

## Pregunta de negocio 5

**¿Cuál es el dataset más reciente de cada fuente?**

Resolver primero con los conceptos disponibles esta semana.

Pista:

```text
filtro + ordenamiento

SELECT  fuente, max(fecha_carga) as ultima_carga
FROM dataset
group by fuente;
```

Si consideran que la solución completa requiere conceptos todavía no estudiados, documenten la limitación y propongan una aproximación.

---

## Pregunta de negocio 6

**¿Qué experimentos tienen estados considerados como exitosos o fallidos?**

Requisito:

```text
IN
```
SELECT *
from experimento
where estado in ('exitoso', 'fallido');
---

## Pregunta de negocio 7

**¿Qué datasets tienen información en el campo `notas`?**

Requisito:

```text
IS NOT NULL
```
SELECT * 
FROM dataset
where notas is not null;
---

## Pregunta de negocio 8

**¿Qué métricas tienen valores entre 0.70 y 0.90?**

Requisito:

```text
BETWEEN
```
SELECT * 
FROM metrica
where valor between 0.70 and 0.80;

---
