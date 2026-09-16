**¿Qué debería pasar si se intenta insertar un experimento con un
`id_proyecto` que no existe?**

En la teoria no debe de ser posible que se pueda registrar, debido a que id_proyecto esta inscrito como una llave foranea (en esa tabla especificamente) y tambien declarado como que no puede ser nula por lo que al intentarse crear lanzaria automaticamente un error

**¿Por qué podría ser importante impedir que se elimine un proyecto que
todavía tiene experimentos?**
Porque los experimentos tambien tienen un tipo de dependencia con cada proyexto, de tal manera que si se eliminara 
**SET NULL**

¿Qué información se perdería y qué información se conservaría en este
escenario?

# 7. Ejercicio: política para cada FK de DataLab

Para cada llave foránea de su esquema, elijan una política `ON DELETE` y
justifíquenla.



  Llave foránea    | Política elegida  | Justificación|
-----------------|-------------------|-----------|
  `experimento.id_proyecto → proyecto`| RESTRICTED|--|                        
  `experimento.id_cientifico → cientifico_datos`| RESTRICTED | --|                        
  `modelo.id_experimento → experimento`| -- | -- |        
  `metrica.id_modelo → modelo` | -- | -- |                     
  `participacion.id_cientifico → cientifico_datos`| -- |  -- |              
  `participacion.id_proyecto → proyecto`|--|--|           
  `uso_dataset.id_dataset → dataset`|--|--|                         
  `uso_dataset.id_experimento → experimento`|--|--|             

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

**e)** `nombre_dataset`, ¿depende de las dos columnas de la llave o de
solo una?
nombre_dataset depende unicamente de id_dataset

¿Y `fecha_ejecucion`?
Pasa exactamente lo mismo depende unicamente de id_experimento ya que existe directamente en esa tabla 

-----

**f)** ¿Cómo se corrige esta dependencia parcial?

--------

## 11.4 Preguntas para el estudiante

**g)** `nombre_proyecto`, ¿depende directamente de `id_experimento`, o
depende de `id_proyecto`?

depende directamente de id_proyecto 

¿Cómo se llama esa cadena de dependencia?

-------------

**h)** ¿Cómo se corrige?

-------------


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


# 15. Auditoría de normalización del propio esquema --- 50 minutos

Revisen **tabla por tabla** su esquema real de DataLab de la Semana 3.

Utilicen la siguiente matriz:

Tabla | ¿Valores atómicos? (1FN) | ¿Sin dependencia parcial? (2FN, solo si aplica) | ¿Sin dependencia transitiva? (3FN)|
-----------|-----------|----------------|----------------|
`cientifico_datos`| -- | --| -- |
`proyecto`| -- | --| -- |                        
`dataset`| -- | --| -- |                                
`experimento`| -- | --| -- |                                 
`modelo`| -- | --| -- |                             
`metrica`| -- | --| -- |                                  
`participacion`| -- | --| -- |                                 
`uso_dataset`| -- | --| -- |                           


# 20. Verificación de comprensión --- antes de salir

### 1. ¿Cuál es la diferencia entre `RESTRICT` y `CASCADE`?



### 2. ¿Por qué 2FN solo importa cuando la llave primaria es compuesta?



### 3. Si su esquema fue construido correctamente a partir del modelo E-R, ¿por qué es esperable que ya esté en 3FN?



