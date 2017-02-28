# ggvis

## Outline

- The ggvis visualization package combines 
    - the grammar of graphics in ggplot
    - reactive programming from shiny
    - data transformations pipelines (e.g. dplyr/tidyverse)
    
- Video:  https://www.youtube.com/watch?v=qtgQMxhAJLQ


## Impressions

- Very similar to ggplot2
    - layers
        - data
        - geom
        - coordinate system
    - a transferrable trainnig for ggplot2

- easier to learn if you are into the tidyverse
    - same syntax, pipes `%>%`
    - generates basic plots
    - see cookbook
    
- works with shiny 

- everything you can do in ggvis you can transfer to ggplot2 (or shiny)
    
- not a replacement for advanced graphics of ggplot2

- Still "under development"
    - version 0.4.3
    
But, very capable, quick, good for development, great for casual vis and can be fine for formal vis

- http://ggvis.rstudio.com/cookbook.html#scatterplots

- http://rpubs.com/amz25/rfun-ggplot2

- add boxplots
    - mtcars %>% ggvis(~factor(cyl), ~mpg) %>% layer_boxplots()