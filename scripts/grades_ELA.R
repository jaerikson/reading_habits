# ------- DESCRIPTION -------------
# Reading habits 
#	Manuscript

# University of Arizona
# Jessie Erikson Pyarelal

# Created 2024-07-10

# ---- Packages used ----
library(Hmisc)
library(dplyr)
library(tidyverse)
library(rstatix)
# library(corrtable)

# ---- Import CSV file ----

data <- read.csv("data_in/TMD123_Master_Scored.csv")

# TGRDE1r = ELA grade at T1
# TGRDE2r = ELA grade at T2
# TGRDE3r = ELA grade at T3

str(data$TGRDE1r)
str(data$TGRDE2r)
str(data$TGRDE3r)

data[] <- lapply(data, as.numeric)

# data$TGRDE1r <- as.numeric(data$TGRDE1r)
# data$TGRDE2r <- as.numeric(data$TGRDE2r)

unique(data$TGRDE1r)
unique(data$TGRDE2r)
unique(data$TGRDE3r)

data$TGRDE1r <- na_if(data$TGRDE1r, 99)
data$TGRDE3r <- na_if(data$TGRDE3r, -99)

mean(data$TGRDE1r, na.rm=TRUE)
mean(data$TGRDE2r, na.rm=TRUE)
mean(data$TGRDE3r, na.rm=TRUE)

rh <- data %>%
  select(FAMID, 
         TGRDE1r, TGRDE2r, TGRDE3r, # ELA grades
         TGRDE1__2, TGRDE2, TGRDE3, # type of ELA class
         T1MMOD, T2MMOD, T3MMOD, # youth report of mom modeling
         T1DMOD, T2DMOD, T3DMOD, # youth report of mom modeling
         T1RATTap, T2RATTap, T3RATTap, # attitudes - academic print
         T1RATTad, T2RATTad, T3RATTad, # attitudes - academic digital
         T1RATTrp, T2RATTrp, T3RATTrp, # attitudes - recreational print
         T1RATTrd, T2RATTrd, T3RATTrd, # attitudes - recreational digital
         TREAD011, TREAD012, TREAD013, # reading habits - work or school
         TREAD021, TREAD022, TREAD023, # reading habits - pleasure
         TREAD031, TREAD032, TREAD033, # reading habits - current events
         TREAD041, TREAD042, TREAD043, # reading habits - research topic
         T1READ, T2READ, T3READ) #reading habits - overall)

# rh$TGRDE1 = rh$TGRDE1r
# rh$TGRDE2 = rh$TGRDE2r
# rh$TGRDE3 = rh$TGRDE3r

# giant correlation matrix!
cor(rh, method = "pearson", use = "complete.obs")

rh1 <- rh %>% select(T1MMOD, T1DMOD, T2RATTap, T2RATTad, T2RATTrp, T2RATTrd, T3READ)

rh1

str(rh1)

rh_corr_matrix <- Hmisc::rcorr(as.matrix(rh1), type = "pearson")

rh_corr_matrix

# trying to look at grades longitudinally...
grades <- rh %>%
  select(FAMID, TGRDE1r, TGRDE2r, TGRDE3r)

grades_long <- grades %>% 
  select(FAMID, TGRDE1r, TGRDE2r, TGRDE3r) %>%
  pivot_longer(cols = c(TGRDE1r, TGRDE2r, TGRDE3r), 
               names_to = "timepoint", 
               names_prefix = "TGRDE", 
               values_to = "grade", 
               values_drop_na = TRUE)

unique(grades_long$grade)

grades_long %>% 
  group_by(timepoint) %>% 
  get_summary_stats(grade)

grades_long %>% 
ggplot(aes(timepoint, grade, fill = timepoint)) +
  geom_boxplot() +
  geom_jitter(width = 0.3) +
  guides(fill = "none") +
  labs(x = "Timepoint", y = "ELA Grades")
