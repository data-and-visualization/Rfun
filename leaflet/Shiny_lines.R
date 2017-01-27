library(shiny)
library(leaflet)
library(rgdal)
library(RColorBrewer)

#Map lines from a shapefile
Tornado11 = readOGR(dsn = "data/April2011.shp", layer = "April2011")

#############################UI##########################################
ui <- bootstrapPage(
  tags$style(type = "text/css", "html, body {width:100%;height:100%}"),
  leafletOutput("map", width = "100%", height = "100%"),
  absolutePanel(top = 10, right = 10,
                sliderInput("range", "Magnitudes", min(Tornado11$MagNum), max(Tornado11$MagNum),
                            value = range(Tornado11$MagNum), step = 1),
                checkboxInput("legend", "Show legend", TRUE),
                #Title
                h3("The April 2011 Tornado Outbreak"),
                #simple text
                p("Use the slider to change which magnitude"),
                p("tornadoes show up on the map.  Click on a"),
                p("tornado to view its magnitude.")
  )
)
#############################UI########################################## 


#################################SERVER######################################
server <- function(input, output){
  filteredData <- reactive({
    #here I'm referencing the shapefile, followed by the shapefile and the column
    #you want and then "input$range" expression that is used in the sliderInput
    #in the UI.
    Tornado11[Tornado11$MagNum >= input$range[1] & Tornado11$MagNum <= input$range[2],]
  })
  output$map <- renderLeaflet({
    leaflet(Tornado11) %>% setView(lng = -87.0589, lat = 34.9601, zoom = 6) %>% 
      addProviderTiles("MtbMap")
  })
  
  observe ({
    pal<-colorNumeric(
      palette = "YlOrRd",
      domain = Tornado11$MagNum
    )
    leafletProxy("map", data = filteredData()) %>%
      clearShapes() %>%
      addPolylines(stroke = TRUE, color = ~pal(Tornado11$MagNum), 
                   popup = ~paste("<strong>Magnitude:</strong> EF", MagNum))
    
    
    
    observe({
      proxy <- leafletProxy("map", data = Tornado11)
      proxy %>% clearControls()
      if (input$legend) {
        proxy %>% addLegend(position = "bottomright",
                            pal = pal, values = ~MagNum)
      }
    })
  })
}
#################################SERVER######################################


#run the shiny app
shinyApp(ui, server)