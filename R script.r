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
intensitieshour <- read_csv(file.path(path_pc_office, "hourlyIntensities_merged.csv"))
stepshour <- read_csv(file.path(path_pc_office, "hourlySteps_merged.csv"))

weight <- read_csv(file.path(path_pc_office, "weightLogInfo_merged.csv"))
heartratesecond <- read_csv(file.path(path_pc_office, "heartrate_seconds_merged.csv"))

#######################################
# 
#######################################
glimpse(activityday)
glimpse(sleepday)

sleepday <- sleepday %>%
  mutate()

activityday <- activityday %>%
  inner_join(sleepday, by=c())

?file.path()
