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

La empresa Bellabeat quiere que analice datos de usuarios de dispositivos fitness inteligentes con el fin de entender cómo estos los utilizan. Asi, de esta forma obtener informacion valiosa que muestre tendencias o particularidades que ayuden a desarrollar los productos y orientar las campañas de marketing para potenciar el crecimiento de la empresa.

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

que pasos de limpieza hicimos ????¿¿¿¿¿ fsdiojfopiasjgiopjoi copiar y pegar partes del codigo y resultados de ejecutarlo...

### ¿Que herramienta elegimos para este tarea de analisis?

La herramienta definitiva elegida para este caso, es el lenguaje R, dado que este es una herramienta poderosa que nos permite realizar todos los pasos del analisis de datos. Complementariamente, usamos RStudio y un repositorio de GitHub para poder avanzar nuestro trabajo, organizarlo, comentarlo y mantenerlo al dia. En el lenguaje R hacemos tareas claves como ver dimensiones, buscar duplicados, buscar valores nulos, adecuar formatos, unir tablas, filtrar, ordenar, calcular, resumir, graficar y documentar como se muestra.

### Revision registros: Ids, valores nulos y filas duplicadas

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

Encontramos que con los tablas (o dataframes) en que elegimos trabajar, efectivamente contamos con 33 usuarios de activityday, 24 del sueño, 33 de las actividades por hora, 8 del peso y 14 del ritmo cardiaco. Ya hemos decidido preservar todos estos.

Mas alla de lo anterior, encontramos que sleepday tiene 3 filas duplicadas y weight 44 valores nulos. En una sucesiva revision encontramos que estos valores nulos son de la columna Fat en la tabla weight, una columna de poca importancia. En cambio sí eliminamos los 3 duplicados de sleepday.

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

### Union de tablas

Con la columna date o datetime en buen estado y en conjunto con el Id de los usuarios, podemos usar tranquilamente ambos valores como identificacion unica de cada registro para unir tablas buscando el orden y facilitar la manipulacion.

```{r}
activityday <- activityday %>%
  left_join(sleepday, by=c("Id", "date"))

activityhour <- calorieshour %>%
  inner_join(stepshour, by=c("Id", "datetime")) %>%
  inner_join(intensitieshour, by=c("Id", "datetime"))
```
Estando unidas, ahora visualizamos de nuevo para asegurarnos que se hayan unido bien, que el numero de filas sea el que debe haberse preservado tras la union y que los valores no se encuentren fuera de un rango razonable.

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
Todas las variables (o columnas) tienen rangos de valores razonables, posibles y no irreales, por lo que las tablas estan limpias, organizadas y limpias. 

### Tablas definitivas: organizadas y limpias

* activityday: Por dia: niveles de actividad medidos en minutos y en distancia, pasos, calorias y sueño.
* activityhour: Por hora: medida de nivel de actividad, pasos y calorias.
* heartrate: Por minuto (o par de minutos): ritmo cardiaco.
* weight: Por autoregistro: peso.
  
## :four:. FASE DE ANALISIS: de los datos

En esta fase empezaremos a "jugar" con los datos que ya estan limpios y preparados. Ahora trataremos de visualizar los datos, descubriendo tendencias y particularidades de los usuarios de los que contamos con sus datos.

### Calorias quemadas, pasos dados y distancia recorrida

En primer lugar dentro de los datos disponibles, exploraremos la relacion entre Las Calorias quemadas, Los Pasos dados y La Distancia recorrida por los participantes del estudio. Es de esperarse que las 3 esten directamente relacionadas, como lo vemos a continuacion:

![pasos_vs_calorias_vs_distancia](https://user-images.githubusercontent.com/124465699/221270638-59709d94-97b7-4e2c-9383-2bf4d3be1976.png)

A mas pasos dados, mas distancia recorrida y mas calorias quemadas, las tres variables se correlacionan porque finalmente todas son indicadoras de la actividad fisica.

### Actividad diaria

Tambien contamos con informacion del nivel de actividad de los usuarios, para saber que porcentaje del dia realizan distintos niveles de actividad, sabemos que es importante mantenernos activos fisicamente para conservar un buen estado de salud.

En este caso, teniamos el tiempo en minutos diarios dedicados a cada nivel de actividad. Los niveles de actividad son Sedentary(sedentario), Lightly active (ligeramente activo), Fairly active (buen nivel de actividad) y Very active (muy activo). 

Para tener una informacion mas util, excluimos el tiempo de suerño, comprobamos que en el nivel sedentario estuviera incluido el tiempo de sueño.
```{r}
activityday %>%
  mutate(semana = isoweek(date), dia = wday(date, abbr = FALSE,
  week_start = getOption("lubridate.week.start", 1),
  )) %>%
  group_by(semana, dia, Id) %>%
  summarize(horas_dia = sum(SedentaryMinutes, LightlyActiveMinutes, FairlyActiveMinutes, VeryActiveMinutes)/60)
```
Extrayendo este resumen, encontramos que muchos, sino la mayoria de los registros sumando los niveles de actividad, suman 24 horas, por lo que estos incluyen todo el tiempo, incluso el de sueño que entraria en la categoria de sedentario. Pero esto no afecta porque es de esperarse que asi se gasta el tiempo de sueño que ademas es de descanso, por esto restamos el tiempo de sueño y tenemos el porcentaje de nivel de actividad en el tiempo despierto de un dia promedio.

![Prcentaje_dia_nivel_de_actividad](https://user-images.githubusercontent.com/124465699/221300359-e564eb64-db6f-4fd5-afc9-3b3d7840333f.png)

Podemos apreciar, (averiguar que se recomienda respecto al nivel de actividad).

### Distribucion de la actividad en el dia

![intensidad_de_actividad_por_hora_del_dia-](https://user-images.githubusercontent.com/124465699/221300013-a6394d78-54c2-431f-b585-bc42218a15b7.png)

Podemos observar que las horas en que mas actividad intensa se realiza son entre las 5 pm y 8 pm.

### Actividad diaria por hora del dia


### Actividad por dia de la semana

###
