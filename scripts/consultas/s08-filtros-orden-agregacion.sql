```sql
SELECT *
FROM dataset
WHERE notas IS NULL;
```

### a)
Obtener experimentos exitosos.

```sql
SELECT *
FROM experimento
WHERE estado = 'exitoso';
```

### b)
Obtener experimentos exitosos o fallidos.

```sql
SELECT *
FROM experimento
WHERE estado = 'exitoso' or 'fallido';
```


### c)
Obtener métricas cuyo valor esté entre 0.70 y 0.90.

```sql
 SELECT *
 FROM metrica
 WHERE valor BETWEEN 0.70 and 0.90
 ```

 ### d)
Obtener experimentos cuyo estado no sea `fallido`.

```sql
SELECT *
FROM experimento
WHERE estado not in  ('fallido');
```

### e)
Crear una consulta que combine `AND` y `OR` utilizando paréntesis.

```sql
CT *
FROM metrica
WHERE (valor = 0.93 or valor =0.95) and nombre_metrica = 'acurracy';

1. Buscar un proyecto por su nombre.

```sql
SELECT *
FROM proyecto 
Where nombre = 'Predicción de demanda';

```
2. Buscar métricas mayores a `0.80`.
```sql
SELECT *
FROM metrica
WHERE valor > 0.80;

```
3. Buscar métricas menores o iguales a `0.50`.

```sql
SELECT * 
FROM metrica
WHERE valor < 0.50;
```

4. Buscar métricas entre `0.70` y `0.90`.

```sql
SELECT *
FROM metrica
WHERE valor between 0.70 and 0.90;

```

5. Buscar experimentos cuyo estado esté dentro de una lista de estados.
```sql
SELECT * 
FROM  experimento ;
```

6. Buscar datasets cuyo nombre comience por una palabra determinada.

```sql

SELECT *
FROM dataset
WHERE nombre like 'consumo%';

```
7. Buscar datasets sin notas.

```sql
SELECT *
FROM dataset 
WHere notas  is null;

```
8. Buscar datasets que sí tengan notas.

```sql
SELECT *
FROM dataset 
WHere notas  is not null;
```
Consulta A → utilizando OR
```

```sql 
SELECT *
FROM dataset 
WHERE (fecha_carga = '2026-08-01' or fecha_carga = '2026-09-01');
```

```text
Consulta B → utilizando IN

```
```sql 
SELECT *
FROM dataset 
WHERE fuente IN ('ERP','Data Warehouse');
```

```text
Consulta C → utilizando NOT IN
```
```sql 
SELECT *
FROM dataset 
WHERE fuente NOT IN ('Core Bancario');
```
1. Nombres que comiencen por `EEG`.
```sql 
    SELECT *
FROM dataset
WHERE nombre like 'EEG%';
```

2. Nombres que terminen en una palabra que elijas.
```sql 
    SELECT *
FROM dataset
WHERE nombre like '%historicos';

```
3. Nombres que contengan una palabra determinada.
```sql 
    SELECT *
FROM dataset
WHERE nombre like '%clientes%';
```
4. Nombres con un patrón de longitud utilizando `_`.

```sql 
    SELECT *
FROM dataset
WHERE nombre like '%_%';

### a)
Datasets ordenados por nombre ascendente.
```sql 
    SELECT *
FROM dataset
ORDER BY nombre ASC;
### b)
Datasets ordenados por fecha de carga descendente.
```sql 
    SELECT *
FROM dataset
ORDER BY fecha_carga DESC;
```

### c)
Datasets ordenados por fuente y, en caso de empate, por fecha de carga descendente.

```sql
SELECT*
FROM dataset
ORDER BY fuente ASC, fecha_carga DESC;
```
1. ¿Cuántos datasets existen?
```sql
SELECT count(*)
FROM dataset;
```
2. ¿Cuántos experimentos existen?
```sql
SELECT count(*)
FROM experimento;
```
3. ¿Cuántos modelos existen?
```sql
SELECT count(*)
FROM modelo;
```
4. ¿Cuántas métricas existen?
```sql
SELECT count(*)
FROM metrica;
```

---

# Actividad 11 — AVG, MIN y MAX

Para la tabla `metrica`, calcula:

- Promedio.

```sql
SELECT AVG(valor) as promedio
FROM metrica;
```

- Valor mínimo.

```sql
SELECT MIN(valor) as valor_minimo
FROM metrica;
```

- Valor máximo.

```sql
SELECT MAX(valor) as valor_maximo
FROM metrica;
```

Después calcula esos tres valores agrupados por `nombre_metrica`.

SELECT nombre_metrica,
       AVG(valor) as promedio,
       MIN(valor) as valor_minimo,
       MAX(valor) as valor_maximo
FROM metrica
group by nombre_metrica;

### a)
¿Cuántos datasets existen por fuente?

```sql
SELECT fuente, COUNT(*) AS cantidad
FROM dataset
GROUP BY fuente;
```

### b)
¿Cuántos experimentos existen por estado?

```sql
SELECT estado, COUNT(*) AS cantidad
FROM experimento
GROUP BY estado;
```

### c)
¿Cuántas métricas existen por tipo de métrica?

```sql
SELECT nombre_metrica, COUNT(*) AS cantidad
FROM metrica
GROUP BY nombre_metrica;
```

---
Construye una consulta que muestre únicamente los tipos de métrica cuyo promedio sea superior a `0.8`.

La solución debe utilizar:

```text
SELECT nombre_metrica,
       AVG(valor) as promedio
FROM metrica
group by nombre_metrica
having avg(valor) > 0.80;

//DELETE SEGURO 
```sql
INSERT INTO proyecto (nombre, descripcion)
VALUES (
    'FILA_DE_PRUEBA_BORRAR',
    'Registro creado para practicar DELETE'
);
```

Comprueba su existencia:

```sql
SELECT *
FROM proyecto
WHERE nombre = 'FILA_DE_PRUEBA_BORRAR';
```

Elimínalo:

```sql
DELETE FROM proyecto
WHERE nombre = 'FILA_DE_PRUEBA_BORRAR';
```

Comprueba nuevamente:

```sql
SELECT *
FROM proyecto
WHERE nombre = 'FILA_DE_PRUEBA_BORRAR';
```

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
