 DataLab
    Semana 7
    Evolución del esquema

    ALTER TABLE
    Restricciones
    UPDATE
    DROP de prueba
*/

==========================================
1. AGREGAR ESTADO
==========================================
Escribe primero el comando en papel.

```sql
ALTER TABLE experimento
ADD estado VARCHAR(20) NOT NULL;
CONSTRAINT df_estado_experimento
    DEFAULT 'planificado'
    WITH VALUES;
```

Después explica:

```text
¿Qué valor recibirán los registros existentes?

Los registros existentes recibiran el valor "planificado"
```


==========================================
2. AGREGAR CHECK
==========================================
ALTER TABLE experimento
ADD CONSTRAINT chk_experimento_estado
CHECK (
    estado IN (
        'planificado',
        'en_ejecucion',
        'exitoso',
        'fallido'
    )

==========================================
3. AGREGAR NOTAS
==========================================
ALTER TABLE dataset
ADD notas VARCHAR(MAX) NULL;

==========================================
4. ACTUALIZAR ESTADOS
==========================================
El documento de la Semana 7 propone actualizar algunos experimentos después de agregar `estado`. fileciteturn14file0L98-L107

Escribe:

```sql
UPDATE experimento
SET estado = 'exitoso'
WHERE id_experimento = 1;
```

Antes de ejecutarlo, explica:

```text
¿Por qué se utiliza WHERE?

para que solo aplique la condicion en el id_experimento que se especifica
```

==========================================
5. RESTRICCIÓN ADICIONAL
==========================================
ALTER TABLE proyecto
ADD CONSTRAINT uq_proyecto_nombre
UNIQUE (nombre);

==========================================
6. MODIFICACIÓN DE COLUMNA
==========================================
Identifica una columna `VARCHAR` cuyo tamaño pueda ampliarse de manera justificada.

En SQL Server:

```sql
ALTER TABLE tabla
ALTER COLUMN columna VARCHAR(200);
```

Antes de ejecutar:

```text
¿Qué tamaño tenía?

tenia un maximo de 50 caacteres

¿Qué tamaño tendrá?

un tamaño de 200 caracteres
¿Por qué se amplía?

Porque es posible que en futuraas ocasiones la fuente sea una url, por loq eu sirve que tenga una posibilidad de mas caracteres

==========================================
7. PRUEBA DROP
==========================================

Crea una tabla desechable:

```sql
CREATE TABLE tabla_prueba_drop (
    id INT PRIMARY KEY,
    dato VARCHAR(50)
);
```

Inserta un registro:

```sql
INSERT INTO tabla_prueba_drop
VALUES (1, 'prueba');
```

Consulta:

```sql
SELECT *
FROM tabla_prueba_drop;
```

==========================================
8. RETO CHECK 
==========================================

el primer paso es identificar cuales son los datos que no entran en la regla establecida

```sql
SELECT id_experimento, estado
FROM experimento
WHERE estado = 'terminado' ;
```

Luego de identificas los id_experimento en los que no se cumple la condicion y con ayuda de UPDATE cambio el estadoo 'terminado' por 'exitoso'

```sql
UPDATE experimento
SET estado = 'exitoso'
WHERE estado = 'terminado';
```

Por ultimo se implementa la condicion con un CHECK para evitar que en futuras ocasiones vuelva a suceder

```sql
ALTER TABLE esperimento
ADD CONSTRAINT chk_estado_experimento
CHECK (estado IN ('planificado', 'en_ejecucion', 'exitoso', 'fallido'))