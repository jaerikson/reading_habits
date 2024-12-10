# ------- DESCRIPTION -------------
# Reading habits 
#	Manuscript

# University of Arizona
# Jessie Erikson Pyarelal

# Created 2024-11-25

# ---- Packages used ----
library(Hmisc)
library(dplyr)
library(tidyverse)
library(rstatix)
# library(corrtable)

# ---- Import CSV file ----

data <- read.csv("data_in/TMD123_Master_Scored.csv")

str(data)
names(data)
# print first 10 rows of mydata
head(data, n=10)

data %>% select(contains("t1read"))

hist(data$T1READ)
hist(data$T2READ)
hist(data$T3READ)

mean(data$T1READ, na.rm=TRUE)
mean(data$T2READ, na.rm=TRUE)
mean(data$T3READ, na.rm=TRUE)

str(data$T1READ)

data %>% select(contains("t2ratt"))

mean(data$T2RATTap, na.rm=TRUE)
mean(data$T2RATTad, na.rm=TRUE)
mean(data$T2RATTrp, na.rm=TRUE)

hist(data$T2RATTap)
hist(data$T2RATTad)
hist(data$T2RATTrp)

# nov 25 - tbh i'm so tired i don't even remember what i'm trying to check

