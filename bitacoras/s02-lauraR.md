**a)** ¿Cómo resolvieron ustedes la participación parcial entre EXPERIMENTO y MODELO?

La participacion se resolvio estableciendo una cardinalidad 1:1, sin embargo, se define la participacion de *experimento* como parcial. Esto especifica que un *modelo* siempre va a estar asociado con un *experimento*, pero un *experimento* puede existir sin estar asociado con un *modelo*, de esta manera se declara que no siempre se va a conseguir exitosamente un modelo de un experimento.


Completen la tabla de equivalencias mientras el docente explica:

| Término técnico | Equivalente en la analogía |
|---|---|
| Relación |Tabla|
| Tupla |Fila|
| Atributo |Columna|
| Dominio |Tipo de datos|
| Grado |# de columnas |
| Cardinalidad (de la tabla) |# de filas |

**b)** En el modelo E-R (Semana 1), "relación" significa:

Es un vinculo o asociacion logica entre dos o mas entidades

**c)** En el modelo relacional (esta semana), "relación" significa:

Una tabla de datos que se encuentra compuesta por columnas y filas que almacena la informacion de una manera organizada

**d)** ¿La cardinalidad de una tabla (número de filas) es lo mismo que la cardinalidad E-R (1:1, 1:N, N:M)? Expliquen la diferencia con sus palabras.

No son lo mismo, la cardinalidad de la tabla es que tan larga es la tabla mientras que la cardinalidad E-R es utilizada para especificar cual es la relacion que existe entre dos identidades

Anoten cada regla en sus propias palabras a medida que el docente las explica:

**Regla 1 — Entidad → tabla:**

Toda entidad se convierte en una tabla, y sus atributos simples se convierten en columnas de la tabla y su atributo principal se convierte en la llave primaria de la tabla

**Regla 2 — Relación 1:N:**

No se crea una nueva tabla, la informacion de la entidad "1" viajan a la entidad "N"

 **Regla 3 — Relación N:M:**

 Es necesario crear una nueva tabla llamada tabla puente para poder almacenar las llaves foraneas de las otras dos tablas

 **Regla 4 — Atributo multivaluado:**

 Si se encuentra un atributo de este tipo se crea una tabla nueva 

 **Regla 5 — Entidad débil:**

 Una entidad debil es aquella que no puede existir por si sola, sino depende de otra tabla. Esta se convierte en una tabla independiente ne la que cuenta con una llave foranea que en la tabla "fuerte" es su llave primaria

 **e)** ¿Por qué DataLab no tiene entidades débiles en su núcleo? ¿Alguna de las seis entidades depende de otra para existir?

 No tiene entidades debiles porque cada entidad es independiente  y cuenta con su propia llave primaria propia. Ninguna de las entiedades depende de otra para existir, pues todas existen por situaciones que se espera que sucedan en DataLab.

 