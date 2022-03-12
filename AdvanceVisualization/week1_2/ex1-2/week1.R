library(readr)
library(readxl)
library(dplyr)
library(tidyr)
library(ggplot2)
library(Hmisc)
library(PerformanceAnalytics)

hotDogWinnerData <- read_excel("C:/Users/danie/OneDrive/DSC-640/week1_2/ex1-2/hotdog-contest-winners.xlsm")
hotDogPlaces <- read_excel("C:/Users/danie/OneDrive/DSC-640/week1_2/ex1-2/hotdog-places.xlsm")
obamaApprovaData <- read_excel("C:/Users/danie/OneDrive/DSC-640/week1_2/ex1-2/obama-approval-ratings.xls")

ggplot(data=hotDogWinnerData, aes(x=Year,y=`Dogs eaten`)) + geom_line()
ggplot(data=hotDogWinnerData, aes(x=Winner,fill=`Dogs eaten`)) + geom_bar() +coord_flip()
ggplot(data = obamaApprovaData, aes(x = Approve, y = Issue, fill=Disapprove)) + geom_bar(stat = "identity") + coord_polar("y")
ggplot(data = obamaApprovaData, aes(x = Approve, y = Issue, fill=Disapprove)) + geom_histogram(stat = "identity", bins=1) 


ymax = cumsum(hotDogWinnerData$`Dogs eaten`)
ymin = c(0, head(ymax, n=-1))
ggplot(data = hotDogWinnerData, aes(ymax=ymax, ymin=ymin, xmax=4, xmin=3, fill= Winner)) + geom_rect() + coord_polar("y") + xlim(c(2, 4))
