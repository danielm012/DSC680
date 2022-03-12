library("ggplot2")
library("readr")
library("readxl")
library('reshape2')
library('maps')
library(dplyr)
library('tidyr')


birth = read.csv("C:/Users/danie/OneDrive/DSC-640/week9_10/ex6-2/birth-rate.csv")
crime <- read.csv("C:/Users/danie/OneDrive/DSC-640/week9_10/ex6-2/crimeratesbystate-formatted.csv")
education <- read.csv("C:/Users/danie/OneDrive/DSC-640/week9_10/ex6-2/education.csv")

education$dropout_rate <-  as.integer(education$dropout_rate)

ggplot(education, aes(x=factor(education$dropout_rate), y=math)) +
  geom_boxplot()


hist(crime$murder, xlim=c(1, 12), breaks= 25)

ggplot(crime, aes(x=murder, y=robbery, fill = murder)) +
  geom_bin_2d()

test = list(crime$murder, crime$robbery)


# Bullet Chart -----------------------------------
 
# Create width necessesary to create BUllet Chart
crime <- crime %>%
  mutate(width = seq(.8, .1, length.out = nrow(crime)))

bullet_base <- data.frame(rank = c("Great", "Okay", "Bad"),
                          value = c(3, 5, 30))
bullet_base_rep <- 
  do.call("rbind", replicate(nrow(crime), bullet_base, simplify = FALSE)) %>%
  mutate(name = sort(rep(crime$state, 3) ))

head(bullet_base_rep, 10)

bullet_colors <- c( "#A3D694", "#f6ea56", "#990000")
names(bullet_colors) <- c("Okay", "Great", "Bad")

ggplot() +
  geom_bar(data = bullet_base_rep, 
           aes(x = name, y = value, fill = rank), stat = "identity",
           position = "stack") +
  geom_bar(data = crime, 
           aes(x = state, y = murder), fill = "black", width = .2,
           stat = "identity") +
  scale_fill_manual(values = bullet_colors) +
  coord_flip(expand = FALSE)

