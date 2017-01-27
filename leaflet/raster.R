############################################################################
################################RASTER LEAFLET###########################
#import raster library
library(raster)

#Name variable climate and specify the location of the raster using raster
#expression
climate <- raster("data/precipann_r_nc1.tif")

#Name variable "pal" and write colorNumeric expression.  c = choices,
#specify "values" as teh raster variable
pal <- colorNumeric(c("#0C2C84", "#41B6C4", "#FFFFCC"), values(climate),
                    na.color = "transparent")

#add leaflet and tiles
leaflet() %>% addTiles() %>%
  #add the raster image.  After the first parantheses, write the raster
  #variable, then colors = [the color palette(i.e. pal)] and opacity
  addRasterImage(climate, colors = pal, opacity = 0.8) %>%
  #add the legend and title
  addLegend(pal = pal, values = values(climate), title = " Rain")
#################################RASTER LEAFLET###########################
############################################################################