1. Completen la tabla mientras el docente explica, con un ejemplo propio de DataLab para cada tipo:

| Tipo | Uso típico | Ejemplo en DataLab |
|---|---|---|
| `INT` |Numeros enteros sirve para identificadores numeros o contadores |id_experimento |
| `VARCHAR(n)` |Son coadenas de texto usualmente usadas en nombres, correos, etc |correo_cientifico |
| `TEXT` | cadenas de texto largas |configuracion  |
| `DATE` | Fechas exactas|fecha_inicio |
| `DECIMAL(p,e)` |numeros exactos con decimales, perfeco para dinero o medidas precisas |presupuesto |
| `BOOLEAN` |variables logicas como verdadero o falso  |resultado_exitoso |


**a)** ¿Cuál es la diferencia entre el tipo de dato de una columna y una restricción sobre esa columna?
El tipo de dato define cual va a ser la informacion permitida, mientras que la restriccion es una regla adicional que se puede agregar a cada columna ya definida, para que pueda ser llenada con datos logicos dependiendo de la situacion

Completen con un ejemplo propio de DataLab para cada restricción:

| Restricción | Qué garantiza | Ejemplo en DataLab |
|---|---|---|
| `NOT NULL` |que no quedes espacion vacios en la tabla |todos los id es importante que no esten nulos |
| `UNIQUE` |determina que los datos de la columna no se pueden repetir |correo_cientifico |
| `DEFAULT` | asigna un valor automatico si el usuario no ingresa alguno|resultado_exitoso, si el usuario no lo ingresa por default seria FALSE o resultado no exitoso |
| `CHECK` | verifica que eld ato ingresado cumpla con una codnicion logica|tamano_filas, el resultado obtenido debe de ser mayor o igual a 0|

**b)** ¿Todas las métricas de desempeño de un modelo caben bien en un `CHECK (valor BETWEEN 0 AND 1)`? Piensen en al menos una métrica que no encajaría y expliquen por qué.
No, no es apta para todas, check es perfecto para la columna de precision ya ve va de 0 a 1, sin embargo en el caso que hubiera una columna de tiempo_ejecusion, no tendria sentido porque su resultado no va a ser 0 o 1 segundo.

**c)** ¿Qué significa que una llave primaria sea "compuesta"? Den un ejemplo del esquema de DataLab.

Es aquella que requiere la combiancion de 2 o mas columnas para poder identificar una fila especifica, como sucede en las tablas puente.

**d)** La relación EXPERIMENTO–produce–MODELO es 1:1 con participación parcial en EXPERIMENTO. Si `modelo.id_experimento` es FK pero no tiene `UNIQUE`, ¿qué error de diseño se podría colar? (piensen: ¿cuántas filas de `modelo` podrían terminar apuntando al mismo experimento?)

si solo actuara como llave foranea existiria la posibilidad que se registraran multiples modelos asociados al mismo id_experimento, lo cual romperia la relacion 1:1 porque habrian varios modelos asociados a un mismo experimento.


¿En qué tabla o columna tuvo dudas su equipo al asignar tipo o restricción?
el mayor reto estuvi en las de fecha y en las columnas version, presupuesto, ya que no tenia total claridad de que tipo de dato debia hacer, mientras que las fechas no tenia total claridad de que tipo de restriccion poner 

4. Revisión cruzada final
**a)** ¿Cada FK tiene claramente indicada su tabla y columna de referencia?

Si, todas las llaves foraneas tienen indicada la tabla a la que pertenecen y demas

**b)** ¿Encontraron algún NOT NULL que debería ser opcional, o viceversa?

Si, la columna fecha_fin tiene la posibilidad de ir nula, pues puede que al momento de registrarlo no haya culminado aun.

Verificación de comprensión — antes de salir
1. ¿Cuál es la diferencia entre un tipo de dato y una restricción?
el tipo de dato establece que infromacion almacena, mientras que la restriccion delimita que datos si entran y que datos no 

2. ¿Por qué modelo.id_experimento necesita ser UNIQUE además de FK?

Porque si se almacena solo como FK, implicaria que existe la posibilidad de que se genere mas de un modelo por cada experimento exitoso lo que dañaria  la relacion 1:1 previamente establecida

3. Si dataset.tamanio_filas tuviera un valor negativo, ¿qué restricción lo habría evitado?

La restriccion de que el dato ingresado debe ser mayor o igual a 0

