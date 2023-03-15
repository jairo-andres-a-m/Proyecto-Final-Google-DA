**Este es un caso de estudio para el proyecto final del Google Data Analytics Professional Certificate.**  
Basado en el analisis de **Fitbit Fitness Tracker Data**  
Para un caso con la empresa **Bellabeat**  
Por **Jairo Andrés Amaya Muñoz**  

## :one:. FASE DE PREGUNTAS: Caso de estudio Bellabeat

### Contexto empresa, productos y estrategia:

Bellabeat es una empresa pequeña y exitosa, es manufacturera de productos de tecnologia para la mujer enfocados en el cuidado de su salud. Esta empresa tiene el potencial para ser una gran jugadora en el mercado de dispositivos teconologicos e inteligentes. Desde su fundacion en el año 2013 han desarrollado productos y abierto oficinas en distintas partes del mundo.

Los productos de Bellabeat recolectan datos de bio-monitoreo de la actividad fisica, pasos dados, distancia recorrida, calorias quemadas, ritmo cardiaco, peso, sueño y salud reproductiva, entre otras, para empoderar a sus usuarias con conocimiento de si mismas y poder incidir en sus habitos.
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

### ¿Que dataset se utilizará, donde esta almacenados y bajo que licencia?

Sršen nos recomienda usar un dataset de dominio publico (CC0: Public Domain) llamado FitBit Fitness Tracker Data, este fue subido por el usuario Möbius a la plataforma Kaggle en el siguiente link:  https://www.kaggle.com/datasets/arashnic/fitbit

Descargamos este dataset, segun la descripcion este contiene datos generados por ~30 usuarios de dispositivos FitBit encuestados via Amazon Mechanical Turk que accedieron a dar su inofrmacion personal registrada en sus dispositivos durante dos meses, del 12 de mayo al 12 de abril del 2016.

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

✔️ Como pudimos ver al revisar el contenido y la organizacion del dataset, contamos con la informacion integra de estas personas en este periodo de tiempo. La informacion es del 2016 pero sigue siendo relevante pues si bien los dispositivos comerciales de bio-monitoreo han mejorado, esencialmente continuan haciendo lo mismo.

✖️ Por otra parte, contar con 33 participantes, usuarios de dispositivos de bio-monitoreo, es una muestra pequeña de personas para establecer comportamientos universales de la actividad fisica de las personas. En el caso del sueño, el ritmo cardiaco y el peso, apenas contamos con registros de 24, 14 y 8 participantes respectivamente. No excluimos estos ultimos datos ya que son indicadores importantes, y en general aunque sea una muestra pequeña podemos intentar ver tendencias en ellos.

Los datos nos ayudan a responder preguntas y son relativos a la tarea empresarial.

## :three:. FASE DE PROCESAMIENTO: de los datos
  
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
  
## :four:. FASE DE ANALISIS: de los datos

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
> |  Hacer actividad fisica vigorosa asi sea en periodos de tiempo cortos, estudios recientes han demostrado que **un minimo de 150 minutos de actividad fisica moderada o 75 minutos de actividad fisica vigorosa a la semana**, puede contraarrestar los efectos de las largas horas que pasamos de forma sedentaria por las obligaciones modernas, como el trabajo de oficina, el transporte, etc. |
  
  
sfdñfjaskldfjl
En esta fase ya tenemos los datos de los dispositivos FitBit de bio-monitoreo, listos y preparados, empezaremos a hacer visualizaciones para leer la informacion en ellos y despues concluir dispositivos como estos pueden ayudar a los objetivos fspadifjapoisjdofijas

### Pasos dados, Distancia recorrida y Calorias quemadas

En primer lugar visualizamos la relacion entre los pasos dados, la distancia recorrida y las calorias quemadas. Como es de esperarse estas tres variables estan estrechamente relacionadas pues las tres son indicadores directos de la actividad fisica.

![image](https://user-images.githubusercontent.com/124465699/225439264-3c81b74c-6a39-4d78-bf3c-261131bc2ea1.png)

- *Los pasos dados y la distancia recorrida tienen una correlacion positiva muy directa y estrecha. Por esto podemos tener la certeza de que los registros de distancia son unicamente de desplazamientos hechos a pie por los usuarios y son fiables indicadores de la actividad.*

- *Vemos que hay quienes realizan menos de los pasos recomendados diarios, 5000, asi como hay quienes realizan muchos mas pues deben realizar actividades deportivas esos dias.*

- *Por otra parte, vemos una correlacion positiva entre las los pasos dados y la quema de calorias, pero esta es mas variable, esto debe ser porque depende de la actividad exacta que realice la persona y es algo de lo que no tenemos registro.*


### Actividad diaria

Miramos una visualizacion que nos muestra cómo distribuimos el tiempo del dia en cada nivel de actividad fisica:
Sedentary(sedentario), Lightly active (ligeramente activo), Fairly active (moderadamente activo) y Very active (muy activo o vigoroso).

Comprobamos que la suma de estas actividades nos de efectivamente la suma de las 24 horas del dia.

![horas_dia](https://user-images.githubusercontent.com/124465699/225074949-267086b8-ab43-4cef-bfae-54f1cbefed18.png)

- *Efectivamente la mayoria de los registros por dia de cada usuario son de 24 horas, los que no, debe ser porque el dispositivo no estuvo encendido todo el dia. Los datos son suficientes para indicarnos dedican el tiempo los usuarios en cuanto a nivel de actividad fisica.*
  
- *Adicionalmente, deducimos que las horas de sueño estan contabilizadas en el tiempo sedentario, este tiempo no debe verse mal ya que es un tiempo valioso que hemos de respetar.*
  
 ![image](https://user-images.githubusercontent.com/124465699/225439082-bc2c390d-8372-4d81-be89-f7b26e01a3b1.png)
  
- *La mayor parte del tiempo despierto la dedicamos a estar sedentarios(12,5 horas), lo que es normal ademas por las obligaciones modernas. Pero asi como se ha vuelto algo normal, debe contrarrestarse este tiempo de inactividad con actividad como parte de la rutina.*
- *El porcentaje de sueño da unas 6,9 horas al dia, un tiempo que esta en los **limites inferiores de sueño recomiendado para adultos**, este es un tiempo importante que hay que respetar para poder estar en buen estado de salud y fisico.
-  *El porcentaje de moderadamente activo da unos 15,9 minutos (a la semana 111,3 minutos) y el porcentaje de muy activo da unos 25 minutos al dia (a la semana 175 minutos). La actividad minima recomendada en moderadamente activo por si sola no es suficiente (minimo de 150 minutos a la semana) y la actividad muy activa a la semana es mas que suficiente (minimo a la semana de 75 minutos), pero como la recomendacion es o lo uno o lo otro, en conjunto se cumplen las recomendaciones de actividad semanasl.*
  
  
HAY QUE VER COMO SE DISTRIBUYEN ESTAS PERSONAS EN CUANTO A ACTIVIDAD FISICA, CENTRADO EN MODERAO Y MUY ACTIVO, ...
  
  
### Distribucion de la actividad en el dia

Ahora detallaremos la distribucion de la actividad fisica a lo largo del dia, determinando en que momentos la gente es mas activa.
  
![intensidad_de_actividad_por_hora_del_dia-](https://user-images.githubusercontent.com/124465699/221300013-a6394d78-54c2-431f-b585-bc42218a15b7.png)

* Podemos observar que las horas en las que la gente realiza mas actividad son entre las 5 y 8 pm.
 
### Distribucion de la actividad en la semana y el mes

Detallamos la distribucion de la actividad fisica en dias de la semana.

![intensidad_de_actividad_dia_a_dia](https://user-images.githubusercontent.com/124465699/221989047-786e3017-a67f-4441-abab-07c2e330d15a.png)

* Podemos ver que la actividad es variable entre las semanas, al parecer los sabados son los dias de mas actividad y los domngos los de menos. Parece haber una irregularidad en la medicion del ultimo dia.

![boxplot por dia](https://user-images.githubusercontent.com/124465699/221989277-8fb9ec11-def7-4e3b-8a28-b95a4911250d.png)


![intensidad_de_actividad_dia_de_la_semana](https://user-images.githubusercontent.com/124465699/221989169-511e3176-f07b-4532-9379-a1ab3142fa51.png)

### Relacion actividad - calorias

![calorias_vs_minutos_de_actividad](https://user-images.githubusercontent.com/124465699/221989248-23f23d0f-8603-4181-abdf-7a4b6f90e862.png)

En este grafico podemos ver que quienes gastan mas calorias en u
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
