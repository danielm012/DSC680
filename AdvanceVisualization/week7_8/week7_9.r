library("ggplot2")
library("readr")
library("readxl")
library('reshape2')
library('maps')

costcos_map_data = read.csv("C:/Users/danie/OneDrive/DSC-640/week7_8/ex5-2/costcos-geocoded.csv")
nba_player_data <- read.csv("C:/Users/danie/OneDrive/DSC-640/week7_8/ex5-2/ppg2008.csv")

nba_player_data.molten = melt(nba_player_data)
ggplot(nba_player_data.molten, aes(Name, y = variable, fill = value)) + geom_tile() + coord_flip()


usa <- map_data("usa")
ggplot(data = usa, aes(x = long, y = lat)) + geom_point(fill = "red", color = "black") + geom_point(data = costcos_map_data, mapping = aes(costcos_map_data$Longitude, costcos_map_data$Latitude), color = 'red')

ggplot(costcos_map_data, aes(x = Longitude, y = Latitude)) +geom_density_2d()
