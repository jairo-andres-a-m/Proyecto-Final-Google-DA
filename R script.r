# Aqui ira el codigo de R del proceso de analisis de datos para el proyecto de Bellabeat
# (Hola desde el RStudio)
# (Hola desde el RStudio en la oficina)

library(tidyverse)
library(lubridate)

#######################################
# Importacion de datos
#######################################

path_pc_casa <- "C:/Users/JairoA/Documents/R_Studio_JAAM_Files/Capstone Project JAAM/Fitabase_Data_04122016-05122016"
path_pc_office <- "D:/RStudio/Fitabase Data 4.12.16-5.12.16"

activityday <- read_csv(file.path(path_pc_office, "dailyActivity_merged.csv"))
sleepday <- read_csv(file.path(path_pc_office, "sleepDay_merged.csv"))

calorieshour <- read_csv(file.path(path_pc_office, "hourlyCalories_merged.csv"))
stepshour <- read_csv(file.path(path_pc_office, "hourlySteps_merged.csv"))
intensitieshour <- read_csv(file.path(path_pc_office, "hourlyIntensities_merged.csv"))


weight <- read_csv(file.path(path_pc_office, "weightLogInfo_merged.csv"))
heartratesecond <- read_csv(file.path(path_pc_office, "heartrate_seconds_merged.csv"))

#######################################
# Adecuacion de DataFrames para trabajar
#######################################
glimpse(activityday)
glimpse(sleepday)

#Convirtiendo las fechas de registro en formato de fechas
activityday <- activityday %>%
  mutate(ActivityDate = date(mdy(ActivityDate))) %>%
  rename(date = ActivityDate) %>%
  distinct()
  
sleepday <- sleepday %>%
  mutate(SleepDay = date(mdy_hms(SleepDay))) %>%
  rename(date = SleepDay) %>%
  distinct() #sleepday tenia 3 filas duplicadas


#Uniendo las dos tablas por el Id y date

activityday <- activityday %>%
  left_join(sleepday, by=c("Id", "date"))

glimpse(activityday)

#Ahora lo mismo con las tablas por hora

glimpse(calorieshour)
glimpse(stepshour)
glimpse(intensitieshour)

n_distinct(calorieshour) #de estos 3 ninguno tiene duplicados

#convirtiendo sus datetimes al formato adecuado

calorieshour <- calorieshour %>%
  mutate(ActivityHour = mdy_hms(ActivityHour)) %>%
  rename(datetime = ActivityHour)

stepshour <- stepshour %>%
  mutate(ActivityHour = mdy_hms(ActivityHour)) %>%
  rename(datetime = ActivityHour)

intensitieshour <- intensitieshour %>%
  mutate(ActivityHour = mdy_hms(ActivityHour)) %>%
  rename(datetime = ActivityHour)

#uniendo las 3 tablas

activityhour <- calorieshour %>%
  inner_join(stepshour, by=c("Id", "datetime")) %>%
  inner_join(intensitieshour, by=c("Id", "datetime"))

glimpse(activityhour)

#falta arreglar los formatos de date y datetime para el peso y los latidos
  
  

