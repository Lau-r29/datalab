### Tabla: `cientifico`
| Columna | Tipo de Dato | Llaves ||
| :--- | :--- | :--- | :--- |
| id_cientifico | INT | PK | 
| nombre | VARCHAR | | 

### Tabla: `proyecto`
| Columna | Tipo de Dato | Llaves ||
| :--- | :--- | :--- | :--- |
| id_proyecto | INT | PK |
| nombre | VARCHAR | 

### Tabla: `dataset`
| Columna | Tipo de Dato | Llaves ||
| :--- | :--- | :--- | :--- |
| id_dataset | INT | PK | 
| id_proyecto | INT | FK |
| nombre | VARCHAR | | 

### Tabla: `experimento`
| Columna | Tipo de Dato | Llaves ||
| :--- | :--- | :--- | :--- |
| id_experimento | INT | PK |
| id_proyecto | INT | FK |
| id_cientifico | INT | FK |
| fecha_ejecucion| DATE | 
| configuracion | TEXT | 

### Tabla: `modelo`
| Columna | Tipo de Dato | Llaves ||
| :--- | :--- | :--- | :--- |
| id_modelo | INT | PK | 
| id_experimento | INT | FK | 

### Tabla: `metrica`
| Columna | Tipo de Dato | Llaves ||
| :--- | :--- | :--- | :--- |
| id_metrica | INT | PK | 
| id_modelo | INT | FK | 
| valor | FLOAT | |

### Tabla Puente: `participacion`
| Columna | Tipo de Dato | Llaves ||
| :--- | :--- | :--- | :--- |
| id_cientifico | INT | FK | 
| id_proyecto | INT | FK | 

### Tabla Puente: `uso_dataset`
| Columna | Tipo de Dato | Llaves |   |
| :--- | :--- | :--- | :--- |
| id_experimento | INT | FK 
| id_dataset | INT | FK 


//DICIONARIO SEMANA 3 //

| Entidad | Atributo | Tipo | PK/FK | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| CIENTIFICO | id_cientifico | INT | PK | Identificador único. (Restricción: Solo números) |
| CIENTIFICO | nombre_cientifico | VARCHAR(50) | | Nombre completo. (Restricción: Solo letras) |
| CIENTIFICO | fecha_nacimiento | DATE | | Fecha de nacimiento del científico |
| CIENTIFICO | area_trabajo | VARCHAR(50) | | Área de especialidad. (Restricción: Solo letras) |
| CIENTIFICO | correo_cientifico | VARCHAR(50) | UNIQUE | Correo electrónico. (Restricción: Solo letras) |
| PROYECTO | id_proyecto | INT | PK | Identificador único. (Restricción: Solo números) |
| PROYECTO | nombre_proyecto | VARCHAR(50) | | Nombre del proyecto.  |
| PROYECTO | presupuesto | DECIMAL | | Presupuesto asignado al proyecto |
| PROYECTO | area_proyecto | VARCHAR(50) | | Área del proyecto. (Restricción: Solo letras) |
| PROYECTO | problema_negocio | VARCHAR(100) | | Problema a resolver. (Restricción: Solo letras) |
| PROYECTO | num_cientificos | INT | | Cantidad de científicos. (Restricción: Solo números) |
| CIENTIFICO_PROYECTO | id_cientifico | INT | FK | Referencia al científico. (Restricción: Solo números) |
| CIENTIFICO_PROYECTO | id_proyecto | INT | FK | Referencia al proyecto. (Restricción: Solo números) |
| CIENTIFICO_PROYECTO | fecha_inicio | DATE | | Fecha de inicio en el proyecto |
| CIENTIFICO_PROYECTO | fecha_fin | DATE | | Fecha de finalización |
| DATASET | id_dataset | INT | PK | Identificador único. (Restricción: Solo números) |
| DATASET | id_proyecto | INT | FK | Referencia al proyecto. (Restricción: Solo números) |
| DATASET | nombre_dataset | VARCHAR(50) | | Nombre del dataset. (Restricción: Solo letras) |
| DATASET | fuente | VARCHAR(50) | | Origen de los datos. (Restricción: Solo letras) |
| DATASET | fecha_carga | DATE | | Fecha de subida |
| DATASET | tamano_filas | INT | | Cantidad de filas. (Restricción: Solo números) |
| EXPERIMENTO | id_experimento | INT | PK | Identificador único. (Restricción: Solo números) |
| EXPERIMENTO | id_proyecto | INT | FK | Referencia al proyecto. (Restricción: Solo números) |
| EXPERIMENTO | id_cientifico | INT | FK | Referencia al científico. (Restricción: Solo números) |
| EXPERIMENTO | fecha_ejecucion | DATE | | Fecha de ejecución |
| EXPERIMENTO | configuracion | TEXT | | Parámetros del algoritmo |
| EXPERIMENTO | resultado_exitoso | BOOL | | Indica si se logró el objetivo (Verdadero/Falso) |
| EXPERIMENTO_DATASET | id_experimento | INT | FK | Referencia al experimento. (Restricción: Solo números) |
| EXPERIMENTO_DATASET | id_dataset | INT | FK | Referencia al dataset. (Restricción: Solo números) |
| MODELO | id_modelo | INT | PK | Identificador único. (Restricción: Solo números) |
| MODELO | id_experimento | INT | FK | Referencia 1:1 al experimento. (Restricción: Solo números) |
| MODELO | nombre_modelo | VARCHAR(50) | | Nombre del modelo. (Restricción: Solo letras) |
| MODELO | version_modelo | VARCHAR(50) | | Versión del modelo. |
| MODELO | algoritmo | VARCHAR(50) | | Algoritmo utilizado. (Restricción: Solo letras) |
| METRICA | id_metrica | INT | PK | Identificador único. (Restricción: Solo números) |
| METRICA | id_modelo | INT | FK | Referencia al modelo. (Restricción: Solo números) |
| METRICA | valor | FLOAT | | Resultado numérico general |
| METRICA | precision_modelo | FLOAT | | Valor de la precisión |
| METRICA | fecha_metrica | DATE | | Fecha del cálculo |
