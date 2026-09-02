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