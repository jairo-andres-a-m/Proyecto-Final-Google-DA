**Este es un caso de estudio para el proyecto final del Google Data Analytics Professional Certificate.**  
Basado en el analisis de **Fitbit Fitness Tracker Data**  
Para un caso con la empresa **Bellabeat**  
Por **Jairo Andrés Amaya Muñoz**  

## :one:. FASE DE PREGUNTAS: Caso de estudio Bellabeat

### Contexto empresa, productos y estrategia:

Bellabeat es una empresa pequeña y exitosa, es manufacturera de productos de tecnologia para la mujer enfocados en el cuidado de su salud. Esta empresa tiene el potencial para ser una gran jugadora en el mercado de dispositivos teconologicos e inteligentes. Desde su fundacion en el año 2013 han desarrollado productos y abierto oficinas en distintas partes del mundo.

Los productos de Bellabeat recolectan datos de bio-monitoreo de la actividad fisica, pasos dados, distancia recorrida, calorias quemadas, ritmo cardiaco, peso, sueño y salud reproductiva, entre otras, para empoderar a las usuarias con conocimiento de si mismas y poder incidir en sus habitos.
Sus productos son:

| Producto | Descripcion |
| :--------------- | :--------------- |
| Leaf | Un brazalete, collar o clip inteligente |
| Time | Un reloj inteligente |
| Spring | Una botella inteligente |
| Bellabeat app | Todos los anteriores se conectan a esta app que permite hacer seguimiento |

La empresa comercializa sus productos en su tienda virtual en su sitio web. Desde el inicio han optado por el canal virtual y se han apoyado considerablemente en el marketing. Siendo esto algo que quieren seguir haciendo basando sus decisiones en datos, para ello encomiendan realizar este estudio para que les proporcione perspectivas e ideas.

### ¿Cual es la tarea empresarial?

La empresa Bellabeat quiere que analice datos de usuarios de dispositivos fitness inteligentes con el fin de entender cómo estos los utilizan. Asi, de esta forma obtener informacion valiosa que muestre tendencias o particularidades que ayuden a desarrollar los productos y orientar las campañas de marketing para potenciar el crecimiento de la empresa.

### ¿Quienes son los principales interesados en la tarea?

* Urška Sršen: Cofundadora y Directora Creativa, ademas es la artista que ha diseñado los productos.
* Sando Mur: Cofundador y parte del Equipo Ejecutivo, además es matemático.
* Demas miembros del Equipo Ejecutivo.

## :two:. FASE DE PREPARACION: Datos de estudio

### ¿Que dataset se utilizará, donde esta almacenados y bajo que licencia?

Sršen nos recomienda usar un dataset de dominio publico (CC0: Public Domain) llamado FitBit Fitness Tracker Data, este fue subido por el usuario Möbius a la plataforma Kaggle en el siguiente link:  https://www.kaggle.com/datasets/arashnic/fitbit

Descargamos este dataset, este contiene datos generados por ~33 usuarios de dispositivos FitBit encuestados via Amazon Mechanical Turk que accedieron a dar su inofrmacion personal registrada en sus dispositivos durante dos meses, del 12 de mayo al 12 de abril del 2016.

### ¿Como se organiza y que contiene el dataset?

Los datos de 33 usuarios registrados entre el 12 de mayo y el 12 de abril del 2016, estan organizados en 18 archivos CSV, excluiremos de una vez 3 de ellos que son repetidos pero en formato wide, entonces los 15 archivos son:

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

Creemos util emplear datos por dia, hora y adicionalmente el sueño, el peso y el ritmo cardiaco ya que son indicadores importantes acerca de la salud. bio-metricos.dñajsdflgkajsdlgkj

### ROCCC????

dfasdfa

### Ayuda a responder la pregunta???

## :three:. FASE DE PROCESAMIENTO: de los datos

que pasos de limpieza hicimos ????¿¿¿¿¿ fsdiojfopiasjgiopjoi copiar y pegar partes del codigo y resultados de ejecutarlo...
### ¿Que herramienta elegimos para este estudio y analisis?

Usare el el lenguaje R dado que es una herramienta poderosa que nos permite realizar todos los pasos del analisis de datos, desde limpiar, visualizar, analizar hasta graficar y sacar conclusiones, ademas con esta herramienta podemos tener en un solo lugar el codigo y los pasos tomados. (mirar cuadro del roadmap del curso de google pasoidjasiodgjoasijdgioqjweoijsdaskd ......... sdiasjdogj)

### Revisamos los registros, Ids, valores nulos y filas duplicadas:

```{r}
n_distinct(activityday$Id) ; n_distinct(sleepday$Id)
n_distinct(calorieshour$Id) ; n_distinct(stepshour$Id) ; n_distinct(intensitieshour$Id)
n_distinct(weight$Id) ; n_distinct(heartrate$Id)

sum(is.na(activityday)) ; sum(is.na(sleepday))
sum(is.na(calorieshour)) ; sum(is.na(stepshour)) ; sum(is.na(intensitieshour))
sum(is.na(weight)) ; sum(is.na(heartrate))

sum(duplicated(activityday)) ; sum(duplicated(sleepday))
sum(duplicated(calorieshour)) ; sum(duplicated(stepshour)) ; sum(duplicated(intensitieshour))
sum(duplicated(weight)) ; sum(duplicated(heartrate))
```

Encontramos que con los dataframes que elegimos trabajar, tenemos 33 usuarios de activityday, 24 del sueño, 33 de las actividades por hora, 8 del peso y 14 del ritmocardiaco. Si bien algunos registran datos de menos usuarios, pueden llegar a darnos información útil.

Ademas de esto, encontramos que sleepday tiene 3 filas duplicadas y weight 44 valores nulos. En una sucesiva revision encontramos que estos valores nulos son en una columna de poca importancia, en cambio sí eliminamos los 3 duplicados de sleepday:

```{r}
glimpse(weight)
weight %>% filter(is.na(Fat))

sleepday <- distinct(sleepday)
sum(duplicated(sleepday))
```

Despues de esto, cambiamos las estampillas de tiempo que tienen cada uno de los archivos que vamos a utilizar ya que se encuentran en formato de texto y no en date o datetime.

```{r}
activityday <- activityday %>%  mutate(ActivityDate = date(mdy(ActivityDate))) %>%  rename(date = ActivityDate)
sleepday <- sleepday %>%  mutate(SleepDay = date(mdy_hms(SleepDay))) %>%  rename(date = SleepDay)
weight <- weight %>%  mutate(Date = date(mdy_hms(Date))) %>%  rename(date = Date)

calorieshour <- calorieshour %>%  mutate(ActivityHour = mdy_hms(ActivityHour)) %>%  rename(datetime = ActivityHour)
stepshour <- stepshour %>%  mutate(ActivityHour = mdy_hms(ActivityHour)) %>%  rename(datetime = ActivityHour)
intensitieshour <- intensitieshour %>%  mutate(ActivityHour = mdy_hms(ActivityHour)) %>%  rename(datetime = ActivityHour)
heartrate <- heartrate %>%  mutate(Time = mdy_hms(Time)) %>%  rename(datetime = Time)
```
De esta manera ya tenemos a todos los archivos a utilizar en date si tienen informacion diaria, o datetime si tienen a nivel de horas y/o minutos.

El siguiente paso consiste en unificar algunos archivos
```{r}
activityday <- activityday %>%
  left_join(sleepday, by=c("Id", "date"))

activityhour <- calorieshour %>%
  inner_join(stepshour, by=c("Id", "datetime")) %>%
  inner_join(intensitieshour, by=c("Id", "datetime"))
```
Y los visualizamos para asegurar que se hayan unido bien, el numero de filas sea el que debe haberse preservado, que los valores no se encuentren fuera de un rango razonable, etc.

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

Finalizando esta limpieza y exploracion preliminar, ya sabemos qué registros contienen cada uno y que estos registros son razonable y unicos identificandose por el Id del usuario y una estampilla de tiempo en su debido formato.

La estrategia de analisis continuara utilizando 4 grupos de dataframes:
* La actividad diaria, en un dataframe llamado activityday (de 33 usuarios), unido por facilidad con los datos del sueño (de 24 usuarios). Nos sera util para estudiar el comportamiento a lo largo de las semanas.
* La actividad por hora, en un dataframe llamado activityhour (de 33 usuarios) uniendo los 3 archivos de actividad por hora. Nos sera util para estudiar el comportamiento a lo largo del dia.
* Ademas, usaremos el ritmo cardiaco, pues es una medicion muy importante para la salud y diciente de la actividad fisica, la dificultad con este es que se muchos registros pues son casi en "tiempo real".
* Y tambien usaremos el peso pues es tambien un dato importante para la salud.

...

## :four:. FASE DE ANALISIS: de los datos

En esta fase empezaremos a "jugar" con los datos que ya estan limpios y preparados. Ahora trataremos de visualizar los datos, descubriendo tendencias y particularidades de los usuarios de los que contamos con sus datos.

### Calorias quemadas, pasos dados y distancia recorrida

En primer lugar dentro de los datos disponibles, exploraremos la relacion entre Las Calorias quemadas, Los Pasos dados y La Distancia recorrida por los participantes del estudio. Es de esperarse que las 3 esten directamente relacionadas, como lo vemos a continuacion:

![pasos_vs_calorias_vs_distancia](https://user-images.githubusercontent.com/124465699/221270638-59709d94-97b7-4e2c-9383-2bf4d3be1976.png)

### Actividad diaria

Tambien contamos con informacion del nivel de actividad de los usuarios, para saber que porcentaje del dia realizan distintos niveles de actividad, sabemos que es importante mantenernos activos fisicamente para conservar un buen estado de salud.

En este caso, teniamos el tiempo en minutos diarios dedicados a cada nivel de actividad. Los niveles de actividad son Sedentary(sedentario), Lightly active (ligeramente activo), Fairly active (buen nivel de actividad) y Very active (muy activo). Comprobamos que en el nivel sedentario estuviera incluido el tiempo de sueño.
```{r}
activityday %>%
  mutate(semana = isoweek(date), dia = wday(date, abbr = FALSE,
  week_start = getOption("lubridate.week.start", 1),
  )) %>%
  group_by(semana, dia, Id) %>%
  summarize(horas_dia = sum(SedentaryMinutes, LightlyActiveMinutes, FairlyActiveMinutes, VeryActiveMinutes)/60)
```
Extrayendo este resumen, encontramos que muchos, sino la mayoria de los registros sumando los niveles de actividad, suman 24 horas, por lo que estos incluyen todo el tiempo, incluso el de sueño que entraria en la categoria de sedentario. Pero esto no afecta porque es de esperarse que asi se gasta el tiempo de sueño que ademas es de descanso, por esto restamos el tiempo de sueño y tenemos el porcentaje de nivel de actividad en el tiempo despierto de un dia promedio.
![Prcentaje_dia_nivel_de_actividad](https://user-images.githubusercontent.com/124465699/221298050-1af0c699-c3f8-44ad-8e6b-5f63aa4512fa.png)
Podemos apreciar, (averiguar que se recomienda respecto al nivel de actividad).

### Distribucion de la actividad en el dia

![intensidad_de_actividad_por_hora_del_dia](https://user-images.githubusercontent.com/124465699/221299127-c4ac61ec-1ee2-42b5-908f-ba56fb54ffc1.png)
Podemos observar que las horas en que mas actividad intensa se realiza son entre las 5 pm y 8 pm.
