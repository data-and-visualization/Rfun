#########################################################################################################
#########################################BASIC EXAMPLE####################################################
#Install leaflet library
install.packages("leaflet")

#Import leaflet library
library(leaflet)

#You have 1 xy coordinate
#36.002676, -78.938422

#Name a new object Durham and add leaflet
Durham <- leaflet() %>%
  #Add OSM Tiles
  addTiles() %>%
  #Add points using the latitude and longtiude
  addMarkers(lng=-78.938422, lat=36.002676, popup="Bostock Library")

#Show the map     
Durham  
#########################################BASIC EXAMPLE####################################################
######################################################################################################