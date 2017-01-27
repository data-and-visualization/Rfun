############################################################################
##############################Points###############################
library(shiny)
library(leaflet)
library(RColorBrewer)

####Need to have column names "lat" and "long" in shapefile
April11pt <- readOGR(dsn = "data/Apr11tornPT.shp", layer = "Apr11tornPT")
#Create a new variable and get only magnitude information using the April11
#variable...column name of magnitude is "Name."
Torn11pt <- April11pt@data$MAG


leaflet(data = April11pt) %>% addTiles() %>%
  addMarkers(~long, ~lat, popup = ~paste("Magnitude: ", MAG)) %>% addProviderTiles("MtbMap")


m2 <- leaflet() %>% 
  setView(lng = 4.5, lat = 51, zoom = 1) %>%
  addTiles() %>% 
  addProviderTiles("NASAGIBS.ModisTerraTrueColorCR",
                   options = providerTileOptions(time = "2015-05-31", opacity = 0.5))

m2
#can also do just static text for popup or one field using as.character()
#instead of paste()
############################################################################
################################Points#####################################