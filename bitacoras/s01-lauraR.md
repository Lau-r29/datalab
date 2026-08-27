a) ¿De qué "cosas" del negocio de DataLab se necesita guardar información? Listen todas las que encuentren, en sus propias palabras.
id de los cientificos, nombre de los cientificos, nombre del proyecto, miembros del proyecto, problema del proyecto, nombre del dataset, fuente del dataset, proyectos que usan el dataset, fecha de carga del dataset, tamaño del dataset em flas, experimentos del proyecto, dataset usado en el experimento, modelo entrenado, nombre del modelo, version del modelo, algoritmo del modelo, metricas del modelo, valor de la metrica y fecha de la metrica

b) ¿Qué preguntas le harían al equipo de ciencia de datos antes de empezar a modelar?
¿ cual es el numero máximo de métricas que se pueden encontrar por modelado?
¿ se considera necesario almacenar la información de los experimentos fallidos? En dado caso de ser así que información se debe de tener en cuenta?

BLOQUE 2 
1.	Clasifiquen cada frase como conceptual, lógico o físico:
Frase	Nivel
"Un experimento puede producir, como máximo, un modelo"	conceptual
"La tabla EXPERIMENTO tiene una llave foránea id_dataset"	Lógico 
"La columna fecha_ejecucion es de tipo DATE"	Fisico
	 
Relación	Cardinalidad	Participación (¿por qué?)
CIENTIFICO_DATOS – participa en – PROYECTO	N:M	Participacion total, porque un científico puede participar en varios proyectos y un proyecto puede tener varios cientificos
DATASET – se usa en – EXPERIMENTO	1:N	Participación parcial dataset y participación total experimento, porque un experimento usa un solo dataset, pero un dataset puede ser usado en varios experimentos
EXPERIMENTO – produce – MODELO	1:1	Participación parcial experimento y participación total modelo, porque un experimento exitoso produce un solo modelo.
MODELO – se evalúa con – METRICA	1:N	Participación total. Cada modelo se evalúa con una o varias métricas de desempeño 

### Llaves primarias y candidatas

La entidad EXPERIMENTO tiene los atributos: `id_experimento_interno`, `nombre_experimento`, `fecha_ejecucion`, `configuracion`.

**a)** ¿Cuál es la llave candidata más evidente?
la llave candidata es id_experimento_interno

**b)** ¿Por qué `nombre_experimento` no sirve como llave por sí sola?
porque siempre va a existir la posibilidad de que existan mas experimentos con el mismo nombre

**c)** Ahora identifiquen las llaves candidatas y primarias de las otras 5 entidades de DataLab:

| Entidad | Llave(s) candidata(s) | Llave primaria elegida | Justificación |
|---|---|---|---|
| CIENTIFICO_DATOS |id_cientifico, nombre_cientifico|id_cientifico |porque los id no se van a repetir los nombres posiblemente si  |
| PROYECTO |id_proyecto, nombre_proyecto | id_proyecto| porque los id no se van a repetir los nombres de proyecto si, por lo que el id seria la unica forma en que se podrian diferenciar  |
| DATASET |id_dataset, nombre_dataset |id_dataset |porque es la manera mas facil de mantener ordenado, teniendo en cuenta que pueden existir miles de dataset y podria coincidir el nombre en algunos |
| MODELO | nombre_modelo, id_modelo|id_modelo | |
| METRICA |id_metrica |id metrica | |


