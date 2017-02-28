# flexdashboards

A presentation for R we having fun yet‽ by John Little


## [Rstudio Webinars (VOD)](https://www.rstudio.com/resources/webinars/)

  - [Introducing Flexdashboards](https://www.rstudio.com/resources/webinars/introducing-flexdashboards/); (video and materials)
- [Dashboards made Easy](https://www.rstudio.com/resources/videos/dashboards-made-easy/) - (lightning talk at rstudio::conf 2017)
    
## Rmarkdown - Flexdashboards - the docs

- [Get Started](http://rmarkdown.rstudio.com/flexdashboard/)
        - Also see Gallery and Sample Layouts
- [using](http://rmarkdown.rstudio.com/flexdashboard/using.html) *aka RTFM*
    
## How to

- File > New File > Rmarkdown > From Template > Flex Dashboard
    
## Works With...

- basic text, rmarkdown for HTML and CSS
- comes with: gauges, info-boxes, fa-awesome
- storyboards
- etc...
- Customize menu-bar with **Share/social** & **source-code**
- [HTML Widgets](http://rmarkdown.rstudio.com/developer_html_widgets.html)
    - e.g. leaflet, DT, ggplot2, 
    - interactive with [crosstalk](https://rstudio.github.io/crosstalk/)
- Shiny

## Files

The supporting files are found in [the subdir of the repo](https://github.com/libjohn/Rfun/tree/master/flexdashboards).  They are listed (below) in roughly the correct order as presented.

- Dashboard - first attempt (columns):  sbux-after-cols.Rmd

- Dashboard - columns converted to rows: sbux-after-rows.Rmd

- Simple to convert html_document to dashboard in the YAML header:  starbucks-before.Rmd

- Live Demo done during the presentation:  awesome-test.Rmd

- Crosstalk example where leaflet and DT packages work symbiotically.  Note this does not compile on Windows as of this writing.:  starbucks-flexdashboard-crosstalk.Rmd