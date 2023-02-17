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

### Credibilidad de los datoss.... ROCC ?
klhjkh

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

sum(duplicated(activityday)) ; sum(duplicated(sleepday)) ; sum(duplicated(calorieshour)) ; sum(duplicated(stepshour)) ; sum(duplicated(intensitieshour))
sum(duplicated(weight)) ; sum(duplicated(heartrate))
```

Encontramos que con los dataframes que elegimos trabajar, tenemos 33 usuarios de activityday, 24 del sueño, 33 de las actividades por hora, 8 del peso y 14 del ritmocardiaco. Si bien algunos registran datos de menos usuarios, pueden llegar a darnos información útil.
Ademas, encontramos que sleepday tiene 3 filas duplicadas y weight 44 valores nulos, en una sucesiva revision encontramos que estos valores nulos son en una columna de poca importancia, en cambio si eliminamos los 3 duplicados de sleepday:

```{r}
glimpse(weight)
weight %>% filter(is.na(Fat))

sleepday <- distinct(sleepday)
sum(duplicated(sleepday))
```



En la exploración preliminar de los archivos, ya sabemos qué registros contienen cada uno y que estos registros son unicos identificandose por el Id del usuario y una estampilla de tiempo.

La estrategia de analisis consistira en utilizar 4 grupos de dataframes:
* La actividad diaria, en un dataframe llamado activityday (de 33 usuarios), unido por facilidad con los datos del sueño (de 24 usuarios). Nos sera util para estudiar el comportamiento a lo largo de las semanas.
* La actividad por hora, en un dataframe llamado activityhour (de 33 usuarios) uniendo los 3 archivos de actividad por hora. Nos sera util para estudiar el comportamiento a lo largo del dia.
* Ademas, usaremos el ritmo cardiaco, pues es una medicion muy importante para la salud y diciente de la actividad fisica, la dificultad con este es que se muchos registros pues son casi en "tiempo real".
* Y tambien usaremos el peso pues es tambien un dato importante para la salud.



## :four:. FASE DE PROCESAMIENTO: de los datos
