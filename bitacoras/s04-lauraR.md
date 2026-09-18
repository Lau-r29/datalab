**¿Qué debería pasar si se intenta insertar un experimento con un
`id_proyecto` que no existe?**

En la teoria no debe de ser posible que se pueda registrar, debido a que id_proyecto esta inscrito como una llave foranea (en esa tabla especificamente) y tambien declarado como que no puede ser nula por lo que al intentarse crear lanzaria automaticamente un error

**¿Por qué podría ser importante impedir que se elimine un proyecto quetodavía tiene experimentos?**

Porque los experimentos tambien tienen un tipo de dependencia con cada proyexto, de tal manera que si se eliminara 
**SET NULL**

¿Qué información se perdería y qué información se conservaría en este
escenario?

Se perderia principalmente la llave primaria del proyecto y por tanto la llave foranea en la tabla expérimento, lo cual provocaria un problema al momento de lamacenar ese experimento en la tabla

# 7. Ejercicio: política para cada FK de DataLab

Para cada llave foránea de su esquema, elijan una política `ON DELETE` y
justifíquenla.



  Llave foránea    | Política elegida  | Justificación|
-----------------|-------------------|-----------|
  `experimento.id_proyecto → proyecto`| RESTRICTED| Un proyecto con experimentos ya ejecutados no puede ser eliminado ni de forma accidental pues al tener un experimento asociado ya tiene un historial|                        
  `experimento.id_cientifico → cientifico_datos`| RESTRICTED | Si un cientifico renuncia, su nombre y datos deben quedar almacenados para poder iudentificar cuales fueron los ejercicios que realizo|                        
  `modelo.id_experimento → experimento`| CASCADE |En dado caso que se decida eliminar un experimento automaticamente deberia de ser eliminados los datos del modelo, ya que no tendria setnido almacenar los datos del modelo si no se puede saber cual fue el experimento realizado para llegar a ese modelo |        
  `metrica.id_modelo → modelo` | CASCADE | Si se elimina un modelo los datos almacenados en metrica sobre ese modelo deben ser eliminados ya que no tendria sentido almacenar esa informacion si no se puede asociar con un modelo |                     
  `participacion.id_cientifico → cientifico_datos`| CASCADE | Si la infromacion de un cientifico es eliminada definitivamente sus participaciones deben de ser eliminadas igualmente|              
  `participacion.id_proyecto → proyecto`|CASCADE|Si se elimina un proyecto los datos de participacion de ese proyecto tambien deben de ser eliminados |           
  `uso_dataset.id_dataset → dataset`|RESTRICTED|Si un dataset ya se encuentra registrado como usado en un proyecto no debe de ser posible eliminarlo, de otra forma no podria asociarse con experimentos ya realizados|                         
  `uso_dataset.id_experimento → experimento`|CASCADE| Si se elimina un experimento se deben borrar los registros del uso del dataset asociados al experimento |             

### Pregunta de análisis

**Si borramos un `MODELO`, ¿qué debería pasar con sus filas en `METRICA`?**
Teniendo en cuenta lo que hace cada politica, la que mas coincide con el caso es la de casade, por lo que si se borra un modelo, todos los datos de la tabla metrica relacionados con modelo deben de ser eliminados ya que no tendria ningun sentido almacenarlos si no hay un modelo asociado 

## 9.4 Preguntas para el estudiante

**c)** ¿Qué problema tiene este diseño si quisieran buscar todos los
modelos con `accuracy` mayor a `0.90`?

Que no se podria filtrar el accuracy porque no se podria diferenciar de los demas datos que sene cuentran dentro de esa misma columna 

**d)** ¿Cómo lo corregirían?

Crearia nuevas columnas de tal manera que se pudieran separar las diferentes metricas que se encuentran registradas de cada modelo
> **Pista:** ya tienen la respuesta en su propio esquema de la Semana 2.

## 10.5 Preguntas para el estudiante

**e)** `nombre_dataset`, ¿depende de las dos columnas de la llave o de solo una?

nombre_dataset depende unicamente de id_dataset

¿Y `fecha_ejecucion`?

Pasa exactamente lo mismo depende unicamente de id_experimento ya que existe directamente en esa tabla 

-----

**f)** ¿Cómo se corrige esta dependencia parcial?

manteniendo atributos como `nombre_dataset` y `fecha_ejecucion`, unicamente en sus tablas de proicedencia y no en la tabla puente, de esta manera se eliminaria la dependencia

## 11.4 Preguntas para el estudiante

**g)** `nombre_proyecto`, ¿depende directamente de `id_experimento`, o
depende de `id_proyecto`?

depende directamente de id_proyecto 

¿Cómo se llama esa cadena de dependencia?

Dependencia transitiva

**h)** ¿Cómo se corrige?

Para poder corregirla seria necesario que el atributo `nombre_proyecto` se eliminara de la tabla experimento ya que solo es necesario `id_proyecto`


# 12. ¿Por qué un buen modelo E-R puede conducir a 3FN?

Esta pregunta conecta las semanas anteriores con la normalización.

**i)** Si construyeron correctamente su esquema desde la Semana 2,
siguiendo las reglas de conversión E-R → relacional:

> **¿Por qué sería esperable que ya esté en 3FN?**
Porque directamente no existirian dependencias o redundancias 

-------------------


# BLOQUE 2 --- LABORATORIO

### Pregunta

> ¿Alguno de los tres ejemplos "malos" de la formalización les recordó
> algo de un borrador anterior de su propio esquema?

Cuando estaba construyendo el primer diagrama relacion- entidad no tuve en cuenta que habian 2 tablas puentes, por lo que no tenia sentido una de las relaciones 


# 15. Auditoría de normalización del propio esquema --- 50 minutos

Revisen **tabla por tabla** su esquema real de DataLab de la Semana 3.

Utilicen la siguiente matriz:

Tabla | ¿Valores atómicos? (1FN) | ¿Sin dependencia parcial? (2FN, solo si aplica) | ¿Sin dependencia transitiva? (3FN)|
-----------|-----------|----------------|----------------|
`cientifico_datos`| Si | --| Si |
`proyecto`| Si | --| Si |                        
`dataset`| Si | --| Si |                                
`experimento`| Si | --| Si |                                 
`modelo`| Si | --| Si |                             
`metrica`| Si | --| Si |                                  
`participacion`| Si | Si| -- |                                 
`uso_dataset`| Si | Si | Si |                           


# 20. Verificación de comprensión --- antes de salir

### 1. ¿Cuál es la diferencia entre `RESTRICT` y `CASCADE`?
RESTRIC prohibe que se elimine un dato de una tabla para evidar incongruencias en otra tabla, mientras que CASCADE se utiliza para que cuando se elimine un dato d euna llave primaria, este mismo dato se elimine automaticamente de las demas tablas donde esta como llave foranea, incluyendo los demas datos asignados para esa misma llave


### 2. ¿Por qué 2FN solo importa cuando la llave primaria es compuesta?

Porque solo es utilizada cuando es necesario de dos columnas para identificar un dato, y la tabla asociada debe de tener estas dos columnas de llave primaria, de otra manera perderia sentido


### USO IA

Se utilizo para aclarar terminos y como metodo de apoyo para ordenar la actividad y cumplir con todo 




