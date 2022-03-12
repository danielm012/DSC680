library("ggplot2")
library("readr")
library("readxl")

lifeExpectancy = read.csv("C:/Users/danie/OneDrive/DSC-640/week5_6/ex4-2/life-expectancy.csv")
crimeRateByState <- read.csv("C:/Users/danie/OneDrive/DSC-640/week5_6/ex4-2/crimerates-by-state-2005.csv")
tvSize <- read.csv("C:/Users/danie/OneDrive/DSC-640/week5_6/ex4-2/tv_sizes.txt", sep = "\t")

ggplot(lifeExpectancy, aes(y = country, x = expectancy))  + geom_point() + ggtitle("country & life expectancy")
ggplot(crimeRateByState, aes(x = state, y = murder))  + geom_point(aes(size = robbery)) + scale_size(range = c(1, 13))  + coord_flip() + ggtitle("Crime By State")
plot(density(tvSize$size))
