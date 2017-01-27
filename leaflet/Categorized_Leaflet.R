############################################################################
######################Categorized Torando line Leaflet################################
#Map lines from a shapefile
Tornado11 = readOGR(dsn = "data/April2011.shp", layer = "April2011")

#Create Spatial Data Frame for Tornadoes with a magnitude 5.  First create a
#variable, then use subset expression.  Reference the shapefile variable you
#created in R and then use @data to access the table fields.
Mag5 <- subset(Tornado11, Tornado11@data$MagNum >4)


#Add lines from shapefile with all one color
leaflet() %>% addTiles() %>%
  addPolylines(data = Tornado11, col = "blue")


#Cateogrize lines by tornado magnitude - to color field/column data, you 
#first need to create a color function (typically called pal).  There are 3
#color functions for numeric data (colorNumeric, colorBin, and colorQuantile)
#and one for categorical (colorFactor). from https://rstudio.github.io/leaflet/colors.html
#create pal variable and use colorNumeric expression since the field being
#used is an integer
pal<-colorNumeric(
  #specify the color scheme you want to use
  palette = "YlOrRd",
  #use domain = and specify the shapefile and field
  domain = Tornado11$MagNum
)


#create leaflet and include line shapefile
leaflet(Tornado11) %>% addTiles() %>%
  #add polylines
  addPolylines(
    #denote the "pal" variable created above and reference the shapefile and
    #field again.  Use "~paste()"function to add custom field/column info
    stroke = TRUE, color = ~pal(Tornado11$MagNum), popup = ~paste("Magnitude: ", MagNum)
  )
######################Categorized Torando line Leaflet################################
############################################################################