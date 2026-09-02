### 1. Tabla Puente: participacion
 *Relación original:* Científico (N) - Proyecto (M).

 *Decisión del nombre:* Se eligió participacion porque cada fila de esta tabla representa el evento o la acción concreta de un científico siendo asignado para trabajar en un proyecto específico. 
* *Atributos:* por el momento incluye las llaves id_cientifico e id_proyecto sin embargo es posible que mas adelante se puedan oncluir llaves como "fecha_ingreso".

### 2. Tabla Puente: uso_dataset
* *Relación original:* Experimento (N) - Dataset (M).
* *Decisión del nombre:* Se eligió uso_dataset ya que  refleja que un experimento consume o utiliza uno o varios datasets específicos.
* *Atributos:* id_experimento e id_dataset