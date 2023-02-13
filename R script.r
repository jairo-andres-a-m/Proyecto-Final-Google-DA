# Aqui ira el codigo de R del proceso de analisis de datos para el proyecto de Bellabeat
# (Hola desde el RStudio)
# (Hola desde el RStudio en la oficina)

library(tidyverse)
library(lubridate)

#######################################
# Importacion de datos
#######################################

activityday <- read_csv("C:/Users/JairoA/Documents/R_Studio_JAAM_Files/Capstone Project JAAM/Fitabase_Data_04122016-05122016/dailyActivity_merged.csv")
sleepday <- read_csv("C:/Users/JairoA/Documents/R_Studio_JAAM_Files/Capstone Project JAAM/Fitabase_Data_04122016-05122016/sleepDay_merged.csv")

calorieshour <- read_csv("C:/Users/JairoA/Documents/R_Studio_JAAM_Files/Capstone Project JAAM/Fitabase_Data_04122016-05122016/hourlyCalories_merged.csv")
intensitieshour <- read_csv("C:/Users/JairoA/Documents/R_Studio_JAAM_Files/Capstone Project JAAM/Fitabase_Data_04122016-05122016/hourlyIntensities_merged.csv")
stepshour <- read_csv("C:/Users/JairoA/Documents/R_Studio_JAAM_Files/Capstone Project JAAM/Fitabase_Data_04122016-05122016/hourlySteps_merged.csv")

weight <- read_csv("C:/Users/JairoA/Documents/R_Studio_JAAM_Files/Capstone Project JAAM/Fitabase_Data_04122016-05122016/weightLogInfo_merged.csv")
heartratesecond <- read_csv("C:/Users/JairoA/Documents/R_Studio_JAAM_Files/Capstone Project JAAM/Fitabase_Data_04122016-05122016/heartrate_seconds_merged.csv")

#######################################
# 
#######################################
glimpse(activityday)
glimpse(sleepday)

sleepday <- sleepday %>%
  mutate()

activityday <- activityday %>%
  inner_join(sleepday, by=c())