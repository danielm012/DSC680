library(readr)
library(readxl)
library(dplyr)
library(tidyr)
library(ggplot2)
library(Hmisc)
library(PerformanceAnalytics)
library(treemap)
library(areaplot)

unemployment <- read_csv("C:/Users/danie/OneDrive/DSC-640/week3_4/unemployement-rate-1948-2010.csv")
us_postage <- read_excel("C:/Users/danie/OneDrive/DSC-640/week3_4/us-postage.xlsm")
world_population <- read_excel("C:/Users/danie/OneDrive/DSC-640/week3_4/world-population.xlsm")

# Label for tree map
us_postage["label"] <- paste(us_postage$Year, ":", us_postage$Price)
us_postage["label"]
us_postage

# Creating Tree Map
treemap(us_postage,index = c("label") ,vSize ="Price",title = "Price vs Year")

# create area map
ggplot(world_population, aes(x=Year, y=Population))+geom_area(fill='#F9c19918',alpha=2)

# Stacked area chart
ggplot(unemployment, aes(x=Year, y=Value, fill=Period )) + 
  geom_area()

# Step Chart
ggplot(unemployment, aes(Year,Value)) + geom_step() + #Ploting
  scale_y_continuous(name= "Year") +
  scale_x_continuous(name= "Value")
