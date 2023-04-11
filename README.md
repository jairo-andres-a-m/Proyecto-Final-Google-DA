**Este es un caso de estudio para el proyecto final del Google Data Analytics Professional Certificate.**  
Basado en el analisis de **Fitbit Fitness Tracker Data**  
Para un caso con la empresa **Bellabeat**  
Por **Jairo Andrés Amaya Muñoz**  

## :one:. FASE DE PREGUNTAS: Caso de estudio Bellabeat

### Contexto empresa, productos y estrategia:

Bellabeat es una empresa pequeña y exitosa, es manufacturera de productos de tecnologia para la mujer enfocados en el cuidado de su salud. Esta empresa tiene el potencial para ser una gran jugadora en el mercado de dispositivos teconologicos e inteligentes. Desde su fundacion en el año 2013 han desarrollado productos y abierto oficinas en distintas partes del mundo.

Los productos de Bellabeat recolectan datos de bio-monitoreo de la actividad fisica, pasos dados, distancia recorrida, calorias quemadas, ritmo cardiaco, peso, sueño y salud reproductiva, entre otras. Con el fin de empoderar a sus usuarias con conocimiento de si mismas y poder incidir en sus habitos.
  
Sus productos son:

| Producto | Descripcion |
| :--------------- | :--------------- |
| Leaf | Un brazalete, collar o clip inteligente |
| Time | Un reloj inteligente |
| Spring | Una botella inteligente |
| Bellabeat app | Todos los anteriores se conectan a esta app que permite hacer seguimiento |

La empresa comercializa sus productos en su tienda virtual en su sitio web. Desde el inicio han optado por el canal virtual y se han apoyado considerablemente en el marketing. Siendo esto algo que quieren seguir haciendo basando sus decisiones en datos, para ello encomiendan realizar este estudio para que les proporcione nuevas perspectivas e ideas.

### ¿Cual es la tarea empresarial?

La empresa Bellabeat quiere que analice datos de usuarios de dispositivos fitness inteligentes de bio-monitoreo, con el fin de entender cómo estos los utilizan. Asi, de esta forma obtener informacion valiosa que muestre tendencias o particularidades que ayuden a desarrollar los productos y orientar las campañas de marketing para potenciar el crecimiento de la empresa.

### ¿Quienes son los principales interesados en la tarea?

* Urška Sršen: Cofundadora y Directora Creativa, ademas es la artista que ha diseñado los productos.
* Sando Mur: Cofundador y parte del Equipo Ejecutivo, además es matemático.
* Demas miembros del Equipo Ejecutivo.

## :two:. FASE DE PREPARACION: Datos de estudio

### ¿Que dataset se utilizará, donde esta almacenado y bajo que licencia?

Sršen nos recomienda usar un dataset de dominio publico (CC0: Public Domain) llamado FitBit Fitness Tracker Data, este fue subido por el usuario Möbius a la plataforma Kaggle en el siguiente link:  https://www.kaggle.com/datasets/arashnic/fitbit

Descargamos este dataset. Segun la descripcion este contiene datos generados por ~30 usuarios de dispositivos FitBit encuestados via Amazon Mechanical Turk que accedieron a dar su inofrmacion personal registrada en sus dispositivos durante dos meses, del 12 de mayo al 12 de abril del 2016.

### ¿Como se organiza y que contiene el dataset?

Con el dataset en "nuestras manos", vemos que este contiene datos de 33 usuarios registrados entre el 12 de mayo y el 12 de abril del 2016, este está organizado en 18 archivos CSV, de los cuales excluiremos de una vez 3 de ellos ya que son repetidos pero en formato wide. Entonces los 15 archivos que tenemos son:

| Dataframe | Descripcion de registros|
| :--------------- | :--------------- |
| dailyActivity_merged.csv | Por usuario(Id) cada dia: nivel de actividad fisica en 4 categorias por distancia y minutos dedicados, los pasos totales, la distancia recorrida total y las calorias quemadas.   |
| dailyCalories_merged.csv | Por usuario(Id) cada dia: las calorias utlizadas. |
| dailyIntensities_merged.csv | Por usuario(Id) cada dia: el nivel de actividad fisica diario en 4 categorias por distancia y minutos dedicados. |
| dailySteps_merged.csv | Por usuario(Id) cada dia:: los pasos totales. |
| hourlyCalories_merged.csv | Por usuario(Id) cada hora: las calorias quemadas.  |
| hourlyIntensities_merged.csv| Por usuario(Id) cada hora: el nivel de actividad fisica en 4 categorias por distancia y minutos totales. |
| hourlySteps_merged.csv| Por usuario(Id) cada hora: los pasos totales. |
| minuteCaloriesNarrow_merged.csv | Por usuario(Id) cada minuto: las calorias quemadas. |
| minuteIntensitiesNarrow_merged.csv | Por usuario(Id) cada minuto: el nivel de actividad fisica en 4 categorias por distancia y minutos dedicados.  |
| minuteStepsNarrow_merged.csv | Por usuario(Id) cada minuto: los pasos totales. |
| minuteSleep_merged.csv | Por usuario(Id) cada minuto: el estado de sueño. |
| minuteMETsNarrow_merged.csv | Por usuario(Id) cada minuto: el "metabolic equivalent of task". |
| heartrate_seconds_merged.csv | Por usuario(Id) por cada tantos segundos: el ritmo cardiaco |
| sleepDay_merged.csv | Por usuario(Id) por dia: la cantidad de sueño y el numero de sesiones.  |
| weightLogInfo_merged.csv | Por usuario(Id): el peso autoreportado.  |

Creemos util emplear datos por dia, hora, del sueño, el peso y el ritmo cardiaco ya que son indicadores importantes acerca de la salud. Prescindiremos de los datos a nivel de detalle de minutos.

### Fiabilidad de los datos

✔️ Los datos son de una fuente secundaria pues han sido recolectados por unos investigadores en otro estudio. Los participantes de dicho estudio accedieron a compartir sus datos de un mes completo de sus actividades. Podemos decir que han sido adquiridos y compartidos consentidamente y de una forma etica. 

✔️ Como pudimos ver al revisar el contenido y la organizacion del dataset, contamos con la informacion integra de estas personas en este periodo de tiempo. La informacion es del 2016 pero sigue siendo relevante pues si bien los dispositivos comerciales de bio-monitoreo han mejorado, esencialmente a la fecha de hoy continuan haciendo lo mismo.

✖️ Por otra parte, contar con 33 participantes usuarios de dispositivos de bio-monitoreo, es una muestra pequeña de personas para establecer comportamientos universales de la actividad fisica de las personas. En el caso del sueño, el ritmo cardiaco y el peso, apenas contamos con registros de 24, 14 y 8 participantes respectivamente. No excluimos estos ultimos datos ya que son indicadores importantes, y en general aunque sea una muestra pequeña podemos intentar ver tendencias en ellos.

Los datos nos ayudan a responder preguntas y son relativos a la tarea empresarial.

## :three:. FASE DE PROCESAMIENTO: los datos
  
### ¿Que herramienta elegimos para este tarea de analisis?

La herramienta definitiva elegida para este caso, es el lenguaje R, dado que este es una herramienta poderosa que nos permite realizar todos los pasos del analisis de datos. Complementariamente, usamos RStudio y un repositorio de GitHub para poder avanzar nuestro trabajo, organizarlo, comentarlo y mantenerlo al dia. En el lenguaje R hacemos tareas claves como ver dimensiones, buscar duplicados, buscar valores nulos, adecuar formatos, unir tablas, filtrar, ordenar, calcular, resumir, graficar y documentar como se muestra.

### Revision de registros: Ids, valores nulos y filas duplicadas

Hacemos un nuevo vistazo en mas detalle de las tablas y su limpieza aunque parezcan ordenadas a simple vista.

```{r}
#valores distintos
n_distinct(activityday$Id) ; n_distinct(sleepday$Id)
n_distinct(calorieshour$Id) ; n_distinct(stepshour$Id) ; n_distinct(intensitieshour$Id)
n_distinct(weight$Id) ; n_distinct(heartrate$Id)

#valores nulos
sum(is.na(activityday)) ; sum(is.na(sleepday))
sum(is.na(calorieshour)) ; sum(is.na(stepshour)) ; sum(is.na(intensitieshour))
sum(is.na(weight)) ; sum(is.na(heartrate))

#filas duplicadas
sum(duplicated(activityday)) ; sum(duplicated(sleepday))
sum(duplicated(calorieshour)) ; sum(duplicated(stepshour)) ; sum(duplicated(intensitieshour))
sum(duplicated(weight)) ; sum(duplicated(heartrate))
```

En las tablas (o dataframes) en que elegimos trabajar, encontramos que contamos con 33 usuarios de activityday, 24 del sueño, 33 de las actividades por hora, 8 del peso y 14 del ritmo cardiaco. Ya hemos decidido preservar todos estos.

Mas alla de lo anterior, encontramos que sleepday tiene 3 filas duplicadas y weight 44 valores nulos. En una sucesiva revision encontramos que estos valores nulos son de la columna Fat en la tabla weight, una columna de poca importancia que dejaremos como está. En cambio sí eliminamos los 3 duplicados de sleepday.

```{r}
glimpse(weight)
weight %>% filter(is.na(Fat))

sleepday <- distinct(sleepday)
sum(duplicated(sleepday))
```

### Adecuacion de estampillas de tiempo

Adecuaremos el formato de las estampillas de tiempo que tienen los registros en cada una de las tablas ya que se encuentran en formato de texto y no en date o datetime.

```{r}
#dates
activityday <- activityday %>%  mutate(ActivityDate = date(mdy(ActivityDate))) %>%  rename(date = ActivityDate)
sleepday <- sleepday %>%  mutate(SleepDay = date(mdy_hms(SleepDay))) %>%  rename(date = SleepDay)
weight <- weight %>%  mutate(Date = date(mdy_hms(Date))) %>%  rename(date = Date)

#datetimes
calorieshour <- calorieshour %>%  mutate(ActivityHour = mdy_hms(ActivityHour)) %>%  rename(datetime = ActivityHour)
stepshour <- stepshour %>%  mutate(ActivityHour = mdy_hms(ActivityHour)) %>%  rename(datetime = ActivityHour)
intensitieshour <- intensitieshour %>%  mutate(ActivityHour = mdy_hms(ActivityHour)) %>%  rename(datetime = ActivityHour)
heartrate <- heartrate %>%  mutate(Time = mdy_hms(Time)) %>%  rename(datetime = Time)
```
De esta manera ya tenemos a todos los archivos a utilizar en date si tienen informacion diaria, o datetime si tienen a nivel de horas y/o minutos. 

### Union de tablas y variables adicionales de tiempo

Con la columna date o datetime en buen estado y en conjunto con la columna de Id de los usuarios, podemos utilizarlos tranquilamente como identificacion unica de cada registro para unir tablas buscando el orden y facilitar la manipulacion.

```{r}
activityday <- activityday %>%
  left_join(sleepday, by=c("Id", "date"))

activityhour <- calorieshour %>%
  inner_join(stepshour, by=c("Id", "datetime")) %>%
  inner_join(intensitieshour, by=c("Id", "datetime"))
```

Para facilitar mas la manipulacion, y ya contando con las dos tablas principales producto de las anteriores uniones, añadiremos columnas adicionales, semana y dia del registro para activityday y semana, dia y hora para activityhour.

```{r}
activityday <- activityday %>%
  mutate(semana=isoweek(date), dia=wday(date, label=TRUE, abbr = FALSE, week_start = getOption("lubridate.week.start", 1))) %>%
  relocate(Id, date, semana, dia)

activityhour <- activityhour %>%
  mutate(semana=isoweek(datetime), dia=wday(datetime, label=TRUE, abbr = FALSE, week_start = getOption("lubridate.week.start", 1)), hora=hour(datetime)) %>%
  relocate(Id, datetime, semana, dia, hora)
```

### Un vistazo/revisión general

Estando adecuadas las tablas, ahora visualizamos de nuevo para asegurarnos que se hayan unido bien, que el numero de filas sea el que debe haberse preservado tras la union, que esten las columnas que son y como debe ser, y que los valores se encuentren en un rango razonable.

```{r}
glimpse(activityday)
summary(activityday)

glimpse(activityhour)
summary(activityhour)

glimpse(weight)
summary(weight)

glimpse(heartrate)
summary(heartrate)
```
Todas las columnas (o variables) estan en orden, tienen rangos de valores razonables, posibles y no irreales, por lo que las tablas estan limpias, organizadas y limpias. 

### Tablas definitivas: organizadas y limpias

* activityday: Por dia: niveles de actividad medidos en minutos y en distancia, pasos, calorias y sueño.
* activityhour: Por hora: medida de nivel de actividad, pasos y calorias.
* heartrate: Por minuto (o par de minutos): ritmo cardiaco.
* weight: Por fecha de autoregistro: peso.
  
## :four:. FASE DE ANALISIS: datos preparados

Como sabemos mantenernos activos físicamente es muy importante para mantenernos en forma. Mantenernos en forma implica que conservemos:

>:muscle: la fuerza muscular  
>:lungs: la aptitud cardiorespiratoria  
>:drop_of_blood: niveles controlados de azucar  
>:bone: densidad osea  
>:brain: rendimiento y salud mental   

Todo esto nos hace sentir mejor y extiende nuestra calidad y expectativa de vida. Entonces nos surge la duda de cómo lograrlo y cómo podemos ayudarnos.

> | ¿Como alcanzar o mantener un estado fisico en forma? |
> | :--------------- |
> | Un hombre y una mujer promedio deben **consumir al dia unas 2500 y unas 2000 Calorias** respectivamente. Es importante tambien que estas calorias provengan de una dieta balanceada y evitar el exceso de azucares y grasas malas. |
> | Evitar un estilo de vida completamente sedentario, hacer actividad fisica ligera regularmente **dando un minimo de 5.000 a 6.000 pasos por día.** Pues el sedentarismo afecta el balance energetico y debilita el buen estado fisico del cuerpo debido a la falta de esfuerzo.  |
> |  Hacer actividad fisica vigorosa asi sea en periodos de tiempo cortos. Estudios recientes han demostrado que **un minimo de 150 minutos de actividad fisica moderada o 75 minutos de actividad fisica vigorosa a la semana**, puede contraarrestar los efectos de las largas horas que pasamos de forma sedentaria por las obligaciones modernas, como el trabajo de oficina, el transporte, etc. |
> 
> Articulos BBC: [Beneficios de la actividad fisica](https://www.bbc.com/mundo/noticias-58823922) y [Minimos de actividad para mejorar la salud](https://www.bbc.com/mundo/noticias-64858320).  
> Pautas NHS: [Balance energético](https://www.nhs.uk/live-well/healthy-weight/managing-your-weight/understanding-calories/#:~:text=As%20a%20guide%2C%20an%20average,physical%20activity%2C%20among%20other%20factors.), [Cantidad de actividad](https://www.nhs.uk/live-well/exercise/exercise-guidelines/physical-activity-guidelines-for-adults-aged-19-to-64/#:~:text=do%20at%20least%20150%20minutes,not%20moving%20with%20some%20activity) y [Cantidad de sueño](https://www.nhs.uk/conditions/insomnia/).
>
  
Habiendo hecho estas aclaraciones y teniendo en mente los puntos claves para que una persona se mantenga en forma, procedemos a realizar el analisis. Realizaremos visualizaciones de los datos de bio-monitoreo para leer informacion en ellos desde el anterior punto de vista y puntos claves.


### Pasos dados, Distancia recorrida y Calorias quemadas

En primer lugar visualizamos la relacion entre los pasos dados, la distancia recorrida y las calorias quemadas. Como es de esperarse estas tres variables estan estrechamente relacionadas pues las tres son indicadores directos de la actividad fisica.

![image](https://user-images.githubusercontent.com/124465699/225755850-8aa335c7-3f41-4c1c-bf5d-5e9b5cd40eee.png)

- *Los pasos dados y la distancia recorrida tienen una correlacion positiva muy directa y estrecha. Por esto podemos tener la certeza de que los registros de distancia son unicamente de desplazamientos hechos a pie por los usuarios y son fiables indicadores de la actividad.*

- *Vemos que hay quienes realizan menos de los pasos recomendados diarios, 5000, asi como hay quienes realizan muchos mas pues deben realizar actividades deportivas que elevan su promedio.*

- *Por otra parte, vemos una correlacion positiva entre las los pasos dados y la quema de calorias, pero esta es mas variable, esto debe ser porque depende de la actividad exacta que realice la persona y es algo de lo que no tenemos registro.*


### Actividad diaria

Miramos una visualizacion que nos muestra cómo distribuimos el tiempo del dia en cada nivel de actividad fisica:
Sedentary(sedentario), Lightly active (ligeramente activo), Fairly active (moderadamente activo) y Very active (muy activo o vigoroso).

Comprobamos que la suma de estas actividades nos de efectivamente la suma de las 24 horas del dia.

![image](https://user-images.githubusercontent.com/124465699/225758562-5c676913-4e65-48a7-a47c-83f0a76289e8.png)

- *Efectivamente la mayoria de los registros por dia de cada usuario son de 24 horas, los que no, debe ser porque el dispositivo no estuvo encendido todo el dia. Los datos son suficientes para indicarnos dedican el tiempo los usuarios en cuanto a nivel de actividad fisica.*
  
- *Adicionalmente, deducimos que las horas de sueño estan contabilizadas en el tiempo sedentario, este tiempo no debe verse mal ya que es un tiempo valioso que hemos de respetar.*
  
![image](https://user-images.githubusercontent.com/124465699/225758867-a0171e12-90d4-4eef-babe-8737db3f4d6c.png)
  
- *La mayor parte del tiempo despierto la dedicamos a estar sedentarios(12,5 horas), lo que es normal ademas por las obligaciones modernas. Pero asi como se ha vuelto algo normal, debe contrarrestarse este tiempo de inactividad con actividad como parte de la rutina.*
- *El porcentaje de sueño da unas 6,9 horas al dia, un tiempo que esta en los **limites inferiores de sueño recomiendado para adultos**, este es un tiempo importante que hay que respetar para poder estar en buen estado de salud y fisico.
-  *El porcentaje de moderadamente activo da unos 15,9 minutos (a la semana 111,3 minutos) y el porcentaje de muy activo da unos 25 minutos al dia (a la semana 175 minutos). La actividad minima recomendada en moderadamente activo por si sola no es suficiente (minimo de 150 minutos a la semana) y la actividad muy activa a la semana es mas que suficiente (minimo a la semana de 75 minutos), pero como la recomendacion es o lo uno o lo otro, en conjunto se cumplen las recomendaciones de actividad semanasles.*
  
  
HAY QUE VER COMO SE DISTRIBUYEN ESTAS PERSONAS EN CUANTO A ACTIVIDAD FISICA, CENTRADO EN MODERAO Y MUY ACTIVO, ...
  
  
### Distribucion de la actividad en el dia

Ahora detallaremos la distribucion de la actividad fisica a lo largo del dia, determinando en que momentos la gente es mas activa.
  
![image](https://user-images.githubusercontent.com/124465699/225757317-65e012a1-dea3-458a-8adb-b604e23844a4.png)

- *Podemos observar que las horas en las que la gente realiza mas actividad entre semana, son entre las 5 y 8 pm, probablemente debido a que a estas horas estan terminando sus jornadas laborales*.
- *El dia comienza y termina paulatinamente, se aprecia una baja de actividad alrededor de las 3 pm, seguramente despues de que los usuarios almuerzan.*
- *Por ultimo, la actividad varia los fines de semana, el sabado la gente tiende a realizar actividad por la mañana y el distribuidamente entre la mañana y la tarde.*
 
### Distribucion de la actividad en la semana y el mes

Detallamos la distribucion de la actividad fisica en dias de la semana.

![image](https://user-images.githubusercontent.com/124465699/225757805-25fa5b9f-b375-4dde-a195-0f7d54db996e.png)

- *Indiscutiblemente el domingo es el dia de menos actividad, se queman menos calorias. Tanto en promedio (grafico izquierdo) como al ver la distribucion (grafico derecho).*
- *El dia de mas actividad, de acuerdo al promedio (grafico izquierdo), es el sabado. Pero viendo la distribucion (grafico derecho), sabemos que el martes tambien es un dia en que una buena proporcion de las personas realizan mas actividad, puede deberse estas diferencia a que quizas el sabado, mas personas hacen bastante o bastante mas actividad, subiendo el promedio de este dia.*


### Relacion calorias-actividad, pasos-actividad

Finalmente visualizamos como se concentran los usuarios de acuerdo a sus niveles de actividad en tiempo en un dia promedio, esto contra los pasos dados y contra las calorias dadas. Tengamos en cuenta que en cada corte vertical, estara el registro de tiempo de cada nivel de actividad que un usuario realizó.

![image](https://user-images.githubusercontent.com/124465699/225757946-0d6f51f0-cff3-4f7f-b4f9-301a72fb929f.png)

- *La mayoria de usuarios estan en niveles de actividad de entre 1250 y 3750 calorias consumidas diarias y entre 0 y 30000 pasos diarios. Por esto sabemos que aunque una persona no realice actividad (0 pasos), tiene un consumo de calorias basal.*
- *Fijandonos en la linea naranja de ligeramente activo, vemos que esta se estabiliza a las 2000 calorias y un poco antes de los 10000 pasos diarios, esto concuerda con las recomendaciones minimas de actividad, al parecer despues de estos niveles de actividad en calorias y pasos diarios, los pasos diarios o calorias adicionales son debido a actividad mas vigorosa como tal, deliberadamente ejercicio fisico.*
- *La actividad ligera es indispensable, por esto se estabiliza en los valores normales de actividad, en 2000 calorias y 10000 pasos. Adicionalmente la actividad vigorosa es la que marca la diferencia en adelante pues su crecimiento es constante, esto ya se considera deporte como tal.*
- *La linea azul claro o aguamarina de muy activo o actividad vigorosa, mantiene un crecimiento constante a medida que aumentan las calorias consumidas y los pasos dados.*
- *Finalmente la linea verde del sedentarismo, si nos centramos en las medidas intermedias de calorias consumidas y  pasos dados demuestra una disminucion del tiempo sedentario, pues se utiliza en actividad, a excepcion de los valores extremos.*

FALTA MIRAR EL SUEÑO DOFIJASGPOIJpoidjgdofjgojsdfg
dfñgjdsflgkjsdf
sdreo --------- buscar recomendaciones de sueño


## :five:. FASE DE COMPARTIR Y ACTUAR: conclusiones

Despues de haber tratado los datos y haber creado graficos para interpretar mejor la informacion, se pueden sacar conclusiones de los usuarios FitBit que pueden extrapolarse a otros usuarios de similares dispositivos, como los de la compañia Bellabeat. Queda demostrado que los dispositivos en cuestion, brindan informacion exacta del nivel de actividad fisica y el sueño principalmente. Esta informacion, puede permitir ser de gran apoyo y puede empoderar al usuario para tener control sobre su propia salud fisica y salud reproductiva, si especialmente nos enfocamos en las mujeres como lo hace Bellabeat.

Partiendo de la funcion que tiene este caso de estudio para la compañia Bellabeat y sus productos, y desde la perspectiva de los beneficios que implica estar en buen estado fisico y de como alcanzar o mantener un buen estado fisico. Primero hago un resumen de los principales habitos hallados en los datos analizados. En segundo lugar se trata de dar unas recomendaciones para brindar a los usuarios a traves de la app y por ultimo, en tercer lugar se dan algunas recomendacines para el marketing de la empresa y los productos, dirigido al publico objetivo.



### Habitos encontrados

Los principales habitos que se pueden distinguir en los usuariso de los dispositivos FitBit, fueron:

| Habitos de los usuarios analizados |
| :--------------- |
| :chair: Los usuarios se mantienen en estado sedentario la la mayor parte del dia, 12,5 horas.  |
| :bed: Las usuarios duermen en promedio 6,9 horas al dia, ligeramente debajo de lo recomendado.  |
| :athletic_shoe: En general, Las horas de mayor actividad fisica son entre las 5 y 8 pm. Una variacion son los sabados, cuando aprovechan mas las horas de la mañana para hacer actividad. |
| :baby_chick: La actividad fisica ligera parece tener un minimo que se mantiene estable a partir de los minimos recomendados de 2000 calorias y/o 10000 pasos. |
| :rooster: La actividad vigorosa o ejercico como tal, tiene un crecimiento constante a medida que los usuarios queman mas calorias o dan mas pasos mas alla de los minimos recomendados. |

Recomendacion para posterior analisis
[ SE PODRIAN SEPARAR EN DOS GRUPOS, QUIENES ESTAN POR DEBADO DE LOS MINIMOS (2000 Y 10000) Y QUIENES ESTAN POR ENCIMA PARA DISTINGUIR SUS HABITOS. ]

### Recomendaciones para la App de los productos Bellabeat

Como se dijo, estos dispositios inteligentes de bio-monitoreo, pueden **empoderar a sus usuarios, informandolos y educandolos de forma precisa sobre el como mantener o alcanzar un estado fisico en forma**. Algunas recomendaciones para no olvidar, que la app debe brindar al usuario:


- La app debe educar o brindar informacion de los minimos de actividad y los beneficios de estar fisicamente en forma. 
- Mostrar los minimos requeridos tanto de actividad ligera como vigorosa y como una puede sustituir a la otra o se pueden complementar.
- Ayudar a programar y acomodar la actividad fisica de acuerdo a la rutina y otras obligaciones, para alcanzar los objetivos. Tambien plantear alternativas.
- Recordar y notificar del avance y alcance de los objetivos.
- Estimular arrojando logros alcanzados y conjugar con logors especiales, pueden ser de peso, de sueño, de avance deportivo, etc.
- Permitir visualizar los habitos y el comportamiento, para analizar habitos, entre otros.
- Permitir compartir a traves de redes los logros y actividades deportivas hechas.
- No olvidemos que Bellabeat tambien ayuda a seguir la salud reproductiva y sexual de las mujeres por lo que esto es otra funcionalidad importante.



### Recomendaciones para Bellabeat como marca

Habiendo nombrado todo lo anterior, facilmente podemos imaginar todo lo que brindan y prestan los dispositivos Bellabeat. Asi como lo que representan. Hacemos enfasis en que estos empoderan a las mujeres, y a los hombres tambien. Bellabeat debe ser un aliado que ayuda a tomar control de una parte importante de la vida, para apoderarnos del tiempo que muchas cosas de la vida moderna tratan de robarnos. El aspecto de salud, bienestar y belleza va unido con dedicar tiempo a la actividad fisica y a mantener el cuerpo en condiciones optimas pudiendo rendir mejor y vivir mejor.

La imagen que debe promover Bellabeat es la de una vida sana, sus productos seran siempre un aliado que recuerda y acompaña en sacar tiempo para si mismo, para tener habitos saludables y por medio de la informacion adentrarse en el grupo de cualidades y mediciones que nos aseguran y dan tranquilidad de que estmos haciendo lo necesario.


-------------------------------------------------------------------------------------------------------------------
Como sabemos mantenernos activos físicamente es muy importante, al hacerlo estamos garantizando el conservar nuestra fuerza muscular, aptitud cardiorrespiratoria, controlados niveles de azúcar, densidad ósea y rendimiento mental, entre otros, haciéndonos sentir mejor, mejorando nuestra calidad y expectativa de vida.
Por un lado, es importante controlar las calorías ingeridas y usadas para mantener la forma física y por otro el mantenerse activo y/o el ejercicio vigoroso activa mecanismos que hacen mantenimiento a nuestro cuerpo.


Como todos sabemos, la actividad fisica es muy importante para mantener un buen estado de salud. Llevar un estilo de vida fisicamente activo esta vinculado tener buena fuerza muscular, buena aptitud cardiorespiratoria, niveles de azucar controlados, buena densidad osea, mejor rendimiento mental y en general una mejor expectativa de vida.

Investigaciones han demostrado la importancia de mantenerse activo, desplazarnos usando nuestras piernas es una buena forma de mantenernos activos pero mas alla de esto, se ha probado que la actividad fisica intensa, aun en periodos de tiempo cortos, puede contrarestar el efecto de un estilo de vida sedentario.

[https://www.bbc.com/mundo/noticias-58823922]
[https://www.bbc.com/mundo/noticias-62067159]
[https://www.bbc.com/mundo/noticias-64858320]
[https://www.gq.com.mx/cuidado-personal/articulo/ejercicio-intenso-como-combate-los-danos-del-sendentarismo]

mirara fitbase dictionary: [https://www.fitabase.com/media/1930/fitabasedatadictionary102320.pdf]

[https://www.nhs.uk/live-well/exercise/exercise-guidelines/physical-activity-guidelines-for-adults-aged-19-to-64/#:~:text=do%20at%20least%20150%20minutes,not%20moving%20with%20some%20activity]

[https://www.nhs.uk/live-well/healthy-weight/managing-your-weight/understanding-calories/#:~:text=As%20a%20guide%2C%20an%20average,physical%20activity%2C%20among%20other%20factors.]

[https://www.nhs.uk/conditions/insomnia/]
