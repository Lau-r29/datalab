### 1. Tabla Puente: participacion
 *Relación original:* Científico (N) - Proyecto (M).

 *Decisión del nombre:* Se eligió participacion porque cada fila de esta tabla representa el evento o la acción concreta de un científico siendo asignado para trabajar en un proyecto específico. 
* *Atributos:* por el momento incluye las llaves id_cientifico e id_proyecto sin embargo es posible que mas adelante se puedan oncluir llaves como "fecha_ingreso".

### 2. Tabla Puente: uso_dataset
* *Relación original:* Experimento (N) - Dataset (M).
* *Decisión del nombre:* Se eligió experimento_dataset ya que  refleja que un experimento consume o utiliza uno o varios datasets específicos.
* *Atributos:* id_experimento e id_dataset



### SEMANA 4 (Integridad y normalizacion)

Se definen las politicas aplicadas a cada tabla de Datalab juntop con su justificacion

1. "cientifico"."id_cientifico" ?<? "cientifico_proyecto"."id_cientifico" 
Se aplico la politica RESTRICT porque si se elimina un cientifico que esta asociado aun en proyectos activos quedaria incompleto teniendo en cuenta que un campo de la tabla quedaria vacio

2. "proyecto"."id_proyecto" ?<? "cientifico_proyecto"."id_proyecto" 
Se aplico la politica RESTRICT porque eliminar un proyecto que todavia tiene cientificos asociados podria invalidar informacion sobre los cientificos que estan asociados al proyecto

3. "proyecto"."id_proyecto" ?<? "dataset"."id_proyecto"
Se aplico la politica RESTRICT porque no se puede eliminar un dataset que ya se encuentra asociado a un proyecto, teniendo en cuenta que no podrian validarse los dataset utilizados para llevar a cabo cada proyecto 

4. "proyecto"."id_proyecto" ?<? "experimento"."id_proyecto" 
Se aplico la politica RESTRICT porque si se elimina un proyecto que ya tiene experimentos asociados perderia sentido los experimentos ya realizados.

5. "cientifico"."id_cientifico" ?<? "experimento"."id_cientifico" 
Se aplico la politica RESTRICT, porque si se elimina toda la informacion de un cientifico, se perderia la informcion sobre quien ejecuto y estuvo a cargo de ese experimento

6. "experimento"."id_experimento" ?<? "experimento_dataset"."id_experimento" 
Se aplico CASCADE teniendo en cuenta que si se elimina los datos de un experimento los datos que asocian ese experimento con un dataset deben de ser eliminados automaticamente

7. "dataset"."id_dataset" ?<? "experimento_dataset"."id_dataset"
Se aplico RESTRICT porque no se puede eliminar un dataset que ya se encuentra relacionado con un experimento, debiedo a que en dado caso generaria que los datos de ese experimento quedaran incompletos y sin sentido

8. "experimento"."id_experimento" ?<? "modelo"."id_experimento" 
Se aplico la politica CASCADE porque si se elimina un experimento el modelo almacenado deberia de ser eliminado automaticamente

9. "modelo"."id_modelo" ?<? "metrica"."id_modelo" 
Se aplico la politica CASCADE porque si se elimina un modelo, la metrica que se creó exclusivamente para ese modelo debe de ser eliminada para no guardar informacion sin importancia 
