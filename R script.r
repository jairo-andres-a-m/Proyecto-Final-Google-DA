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

#Arreglar los formatos de date y datetime para el peso y los latidos
  
glimpse(weight)
glimpse(heartratesecond)

weight <- weight %>%
  mutate(Date = date(mdy_hms(Date))) %>%
  rename(date = Date)

heartratesecond <- heartratesecond %>%
  mutate(Time = mdy_hms(Time)) %>%
  rename(datetime = Time)

#######################################
##  Entonces tenemos:
##   - activityday
##   - activityhour
##   - weight
##   - hearratesecond
##
#######################################

#Ahora, hacer visualizaciones

glimpse(activityday)

###############################################################################
#organizar el activityday por semana y dia de la semana

activityday <- mutate(activityday, week=isoweek(date), day=wday(date, label=TRUE, abbr=FALSE, week_start = getOption("lubridate.week.start", 1)))

summary_activityday <- activityday %>%
  group_by(week, day) %>%
  summarize(mean(TotalSteps), mean(TotalDistance), mean(Calories)) 
#porqueeee falta el dia 2 de la semana 15 !!!!!!!!!!!!!


ggplot(summary_activityday, aes(day, week)) +
  geom_tile(aes(fill=`mean(Calories)`))

activityday %>% 
  filter(Calories > 1500, Calories < 3250) %>%
  group_by(day) %>%
  summarize(mean(Calories)) %>%
  ggplot(aes(x=day, y="")) +
  geom_tile(aes(fill=`mean(Calories)`)) #por dia

activityday %>% 
  filter(Calories > 1500, Calories < 3250) %>%
  group_by(day) %>%
  summarize(mean(Calories)) %>%
  ggplot() +
    geom_col(aes(x=day, y=`mean(Calories)`))

activityday %>% 
  filter(Calories > 1500, Calories < 3250) %>%
  group_by(day) %>%
  ggplot() +
  geom_boxplot(aes(x=day, y=Calories), fill="blue", alpha=3/5) #esto es representativo


activityday %>% 
  filter(Calories > 1500, Calories < 3250) %>%
  group_by(week, day) %>% 
  unite(week_day, week, day, sep="_", remove=FALSE) %>%
  ggplot() +
  geom_col(aes(x=week_day, y=Calories), fill="blue", alpha=3/5) #regostrp de calorias por semana y dia


ggplot(summary_activityday, aes(day, week)) +
  geom_tile(aes(fill=`mean(TotalSteps)`))

###############################################################################

