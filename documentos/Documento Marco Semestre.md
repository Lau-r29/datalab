# Documento Marco del Semestre — Bases de Datos

**Programa:** Ingeniería de Datos e Inteligencia Artificial (IDIA) — Universidad Santo Tomás

**Espacio académico:** Bases de Datos · III semestre

**Horizonte:** 14 semanas · un encuentro de laboratorio (3 h, con PC) + un encuentro de formalización (2 h, sin PC) por semana

---

## 1. Presentación y justificación metodológica

Este documento es el mapa del semestre: explica **por qué** el curso está construido como está, no solo **qué** se va a ver cada semana. Si en la semana 9 alguien pregunta "¿y esto para qué me sirve?", la respuesta ya está escrita aquí.

Tres decisiones metodológicas sostienen todo el diseño:

1. **Un solo caso de uso atraviesa las 14 semanas.** En lugar de ejemplos sueltos y desconectados, todo el semestre construye, capa sobre capa, la base de datos de una plataforma real de ciencia de datos e IA (**DataLab**, sección 2). Esto le da sentido acumulativo a cada tema: normalizar no es un ejercicio abstracto, es evitar que las métricas de un experimento queden inconsistentes en *su propia* base de datos.

2. **Se aprende haciendo antes de formalizar.** Cada semana, el laboratorio de 3 horas va primero: los estudiantes construyen, exploran y se equivocan sobre el caso DataLab con la herramienta en la mano. La sesión de 2 horas sin PC llega después, para nombrar con precisión lo que ya se hizo, cerrar huecos conceptuales y formalizar con el método Feynman (sección 3). Primero la experiencia, después el lenguaje técnico que la describe.

3. **Todo se entrega con Git, desde la semana 1.** Un esquema de base de datos también es algo que se versiona — así es como se hace en la industria (migraciones de esquema) — y este curso es la primera vez que la mayoría de los estudiantes lo va a practicar (sección 7).

Esta terminología - datasets, experimentos, modelos, métricas - no es decoración: es exactamente el vocabulario con el que van a trabajar como ingenieros de datos. Cuanto antes se las apropien, menos ajena les va a resultar en las materias y en los trabajos que siguen.

---

## 2. El caso de uso: DataLab

> Un equipo de ciencia de datos necesita una base de datos para llevar el control de sus **proyectos de IA**: qué **datasets** usan, qué **experimentos** corren, qué **modelos** entrenan, qué **métricas** obtienen y quién es responsable de cada cosa.

**Entidades núcleo** (se usan desde la semana 1 y no cambian de nombre en todo el semestre):

| Entidad | Qué representa |
|---|---|
| `CIENTIFICO_DATOS` | Quien ejecuta el trabajo |
| `PROYECTO` | Agrupa el esfuerzo (ej. "Detección de fraude") |
| `DATASET` | Fuente de datos usada |
| `EXPERIMENTO` | Una corrida específica (dataset + configuración) |
| `MODELO` | El artefacto entrenado, resultado de un experimento |
| `METRICA` | Resultado de evaluación de un modelo (accuracy, F1, etc.) |

**Cómo evoluciona DataLab por bloque temático:**

| Bloque | Qué le pasa a DataLab |
|---|---|
| **2.1–2.8** Modelado conceptual | Se diseña el modelo E-R: entidades, atributos, relaciones, cardinalidad y participación. Entregable: diagrama E-R. |
| **3.1–3.8** Modelo relacional | El E-R se convierte en tablas: llaves primarias/foráneas, integridad referencial, normalización (evitar métricas duplicadas o inconsistentes). |
| **4.1–4.9** SQL | La base se crea en un motor real y se consulta: ¿qué modelo tuvo mejor *accuracy*? ¿qué científico corrió más experimentos? ¿qué datasets nunca se han usado? |
| **5.1–5.9** Proyecto + documental | Se cierra y sustenta la base relacional completa. Los **hiperparámetros** de un experimento (que varían de un modelo a otro y no caben bien en columnas fijas) se modelan en MongoDB, comparando cuándo conviene relacional vs. documental. |

---

## 3. Metodología pedagógica

### 3.1 Método Feynman para las explicaciones

Toda explicación formal en las guía del estudiante sigue estos cuatro pasos:

1. **Explicar el concepto en lenguaje simple**, como si se le explicara a alguien sin conocimientos previos de bases de datos.
2. **Detectar el hueco**: el punto exacto donde la explicación se traba o recurre a una palabra técnica sin definirla — ahí está lo que aún no se entiende del todo.
3. **Volver a la fuente y llenar el hueco** con una analogía simple y concreta, preferiblemente anclada en algo de DataLab.
4. **Simplificar el lenguaje y repetir** la explicación hasta que fluya sin saltos ni palabras que no se puedan sustituir.

Las guías del estudiante piden, en ciertos puntos, que sea el propio estudiante quien la construya.

### 3.2 Orden de la sesión semanal

| Encuentro | Duración | Rol |
|---|---|---|
| **Laboratorio (con PC)** | 3 h | Va primero. Exploración y construcción práctica sobre DataLab: modelar, escribir SQL, usar la herramienta de turno. Aquí se permite el error productivo. |
| **Formalización (sin PC)** | 2 h | Va después. Se nombra con precisión lo que se construyó, se cierran huecos conceptuales con el método Feynman, y se resuelven ejercicios "a mano" (diagramas en papel, trazas de consultas, normalización sobre el tablero). |

---

## 4. Mapa de 14 semanas

| Semana | Bloque | Subtemas|
|---|---|---|
| 1 | 2.1–2.8 Modelado conceptual y E-R | Todo el bloque 
| 2 | 3.1–3.2 | Modelo relacional · Conversión E-R → relacional |
| 3 | 3.3–3.4 | Tablas, columnas, dominios, restricciones · Llaves primarias y foráneas |
| 4 | 3.5–3.6 | Integridad referencial · Normalización básica (1FN, 2FN, 3FN) |
| 5 | 3.7–3.8 | Diseño físico · Creación de tablas y relaciones en motor relacional |
| 6 | 4.1–4.2 | SQL como lenguaje relacional · Estándares y sintaxis básica |
| 7 | 4.3–4.4 | DDL (CREATE, ALTER, DROP) · Restricciones (PK, FK, UNIQUE, NOT NULL, CHECK) |
| 8 | 4.5–4.6 | DML (INSERT, SELECT, UPDATE, DELETE) · Filtros, operadores, orden, funciones de agregación |
| 9 | 4.7–4.9 | Consultas multitabla (JOIN) · Subconsultas y vistas · Buenas prácticas |
| 10 | 5.1–5.2 | Desarrollo del proyecto final relacional · Validación del modelo completo |
| 11 | 5.3–5.4 | Ajustes según retroalimentación docente · Introducción aplicada a bases documentales |
| 12 | 5.5–5.6 | MongoDB: base de datos, colección, documento, campos · Comparación tabla vs. documento JSON/BSON |
| 13 | 5.7–5.9 | CRUD básico en MongoDB · Modelado documental (embebidos/referencias) · Cuándo usar relacional vs. documental |
| 14 | Cierre | Sustentación y entrega final del proyecto integrador |

---

## 5. Qué contiene cada guía semanal

Cada semana se entrega un documento en **Markdown**, ambientado siempre en DataLab (nunca en ejemplos genéricos sueltos):

- **Guía del estudiante (`estudiante-sXX.md`)**: Actividades, con espacios para completar y, cuando aplica, los puntos donde el estudiante debe construir su propia explicación Feynman.

---

## 6. Evaluación y evidencias — Hitos del semestre

| Hito | Semana | Qué se entrega |
|---|---|---|
| **H0** | 1 | Repositorio creado, estructura base, primer commit |
| **H1** | 1 | Modelo E-R de DataLab (diagrama + diccionario de datos) |
| **H2** | 5 | Modelo relacional completo, normalizado, con script DDL ejecutado en el motor |
| **H3** | 9 | Batería de consultas SQL que responde las preguntas de negocio de DataLab |
| **H4** | 13–14 | Proyecto integrador completo: base relacional + extensión documental en MongoDB, sustentado |

---

## 7. Control de versiones: Git y GitHub

**Todas las entregas del semestre se hacen a través de Git.** No se reciben archivos comprimidos por correo, ni carpetas compartidas, ni capturas de pantalla del modelo.

### 7.1 Por qué Git en un curso de Bases de Datos

**Razón 1 — Es como se trabaja en la industria.** Ningún equipo de datos comparte scripts SQL por correo o WhatsApp. Git es el estándar para cualquier cambio de código o de esquema desde hace más de quince años.

**Razón 2 — El esquema es acumulativo y se va a romper.** En la semana 4 van a alterar una tabla para normalizarla, y es probable que una consulta que funcionaba en la semana 3 deje de hacerlo. Sin control de versiones, la única salida es reescribir a ciegas. Con Git, se vuelve al estado anterior en segundos y se compara exactamente qué cambió.

**Razón 3 — Es el mismo concepto que enseña el curso, aplicado a su propio trabajo.** En la industria real, cada cambio de esquema se versiona como una **migración** (Flyway, Liquibase, Django migrations): un script fechado, ordenado, que se puede aplicar o revertir. Git en este curso es su primer acercamiento a esa disciplina. *Si entienden por qué el DDL de la semana 5 tiene que quedar registrado y ser reproducible, ya entendieron para qué sirve una migración de base de datos.*

### 7.2 Convención de commits

Se usa un prefijo declarativo en español que indica qué tipo de cambio se hizo:

| Prefijo | Se usa para |
|---|---|
| `modelo:` | Cambios al diagrama E-R o al modelo relacional |
| `ddl:` | Scripts de creación o alteración de tablas |
| `dml:` | Scripts de datos (inserts, updates, datos semilla) |
| `consulta:` | Nuevas consultas SQL o cambios a consultas existentes |
| `doc:` | Diccionario de datos, decisiones de diseño, bitácoras |
| `fix:` | Corrección de errores en scripts o modelos previos |

Ejemplo: `git commit -m "ddl: crea tabla EXPERIMENTO con FK a DATASET y PROYECTO"`

### 7.3 Hitos etiquetados

Cada hito de la sección 6 se marca con un tag de Git al momento de la entrega (`git tag h1-modelo-er`, `git tag h2-modelo-relacional`, etc.), de forma que el historial del repositorio sea, por sí solo, evidencia del avance real del equipo.

---

## 8. Estructura del repositorio

A diferencia de un curso centrado en código (como Estructuras de Datos), aquí el repositorio gira alrededor de **modelos, scripts SQL y documentos**. Un repositorio por equipo, creado en el Hito 0:

```
datalab-<equipo>/
├── README.md                     <- qué es el proyecto, quiénes lo hacen, cómo se ejecuta
├── .gitignore                    <- qué NO se sube (credenciales, archivos temporales del SGBD)
│
├── diagramas/
│   ├── e-r/                      <- modelo conceptual (semana 1)
│   │   └── s01-modelo-conceptual.png
│   └── relacional/                <- modelo relacional (semanas 2-5)
│       └── s05-modelo-relacional.png
│
├── scripts/
│   ├── ddl/                      <- CREATE TABLE, ALTER, restricciones
│   │   └── s05-creacion-tablas.sql
│   ├── dml/                      <- INSERT semilla, UPDATE, DELETE
│   │   └── s08-datos-semilla.sql
│   └── consultas/                <- SELECT organizadas por semana/tema
│       ├── s08-consultas-basicas.sql
│       └── s09-consultas-multitabla.sql
│
├── casos_uso/                    <- enunciado del caso o pregunta de negocio que resuelve cada script
│   └── s09-preguntas-negocio.md
│
├── documentacion/
│   ├── diccionario_datos.md      <- vivo: se actualiza cada semana que cambia el modelo
│   └── decisiones.md             <- registro de decisiones de diseño (por qué esa cardinalidad, por qué esa normalización...)
│
├── mongodb/                      <- unidad 5, parte documental
│   └── documentos_ejemplo.json
│
└── bitacoras/                    <- bitácora individual de cada integrante, por semana
    ├── s01-<nombre>.md
    └── s02-<nombre>.md
```

**`documentacion/decisiones.md` es obligatorio y es de ustedes, no del docente.** Cada vez que el equipo elija entre dos caminos válidos (¿la relación PROYECTO–DATASET es de participación total o parcial? ¿por qué?), queda una entrada ahí, con fecha y justificación.

---

## 9. Compromisos del estudiante

- Asistir y participar activamente en ambos encuentros semanales.
- Mantener el repositorio del equipo actualizado; el historial de commits es evidencia de aporte individual.
- No subir credenciales ni cadenas de conexión reales a ninguna base de datos al repositorio.
- Documentar en `decisiones.md` cualquier decisión de diseño relevante, incluyendo cambios sobre entregas anteriores.
- Usar la IA de forma responsable y transparente: nombrar la herramienta usada, describir el tipo de ayuda recibida y revisar críticamente cualquier salida antes de incorporarla — la IA complementa el aprendizaje, no lo sustituye.
- Avisar con anticipación si el trabajo en equipo no está funcionando; la evaluación contempla el aporte individual verificable dentro de cada hito grupal.

---

## 10. Preguntas frecuentes

**¿Y si mi equipo no funciona?**
Avísenlo temprano, no en la semana 13. El historial del repositorio es la evidencia principal del aporte individual dentro del hito grupal.

**Nunca he usado Git. ¿Me voy a quedar atrás?**
No. La puesta en marcha se hace guiada en el laboratorio de la semana 1. Los comandos que necesitan para todo el semestre son menos de diez.

**¿Puedo usar GitHub, GitLab u otro?**
Sí, la plataforma es indiferente mientras el docente tenga acceso de lectura desde el Hito 0.

**¿Por qué el modelo conceptual (semana 1) no tiene su propia carpeta de scripts?**
Porque en la semana 1 todavía no hay SQL: solo hay diagrama y diccionario de datos. La carpeta `scripts/` empieza a llenarse a partir del bloque relacional (semana 2 en adelante).
