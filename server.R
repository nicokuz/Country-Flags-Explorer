#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above in RStudio.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ISOcodes)
library(maps)
library(dplyr)


#Use pre downloaded data instead
# flags <- read.csv("http://archive.ics.uci.edu/ml/machine-learning-databases/flags/flag.data",
#                   col.names = c("name", "landmass", "zone", "area", "population", "language", "religion", 
#                                 "bars", "stripes", "colours", "red", "green", "blue", "gold", "white", "black", 
#                                 "orange", "mainhue", "circles", "crosses", "saltires", "quarters", "sunstars", 
#                                 "crescent", "triangle", "icon", "animate", "text", "topleft", "botright"))

flags <- readRDS("flagsData.rds")

flags$name <- gsub("-", " ", flags$name)


countryCodes <- rbind(
  data.frame(name = ISO_3166_1$Name, A3 = ISO_3166_1$Alpha_3, A2 = ISO_3166_1$Alpha_2),
  data.frame(name = ISO_3166_1$Official_name, A3 = ISO_3166_1$Alpha_3, A2 = ISO_3166_1$Alpha_2),
  data.frame(name = ISO_3166_1$Common_name, A3 = ISO_3166_1$Alpha_3, A2 = ISO_3166_1$Alpha_2),
  data.frame(name = iso3166$ISOname, A3 = iso3166$a3, A2 = iso3166$a2),
  data.frame(name = iso3166$mapname, A3 = iso3166$a3, A2 = iso3166$a2),
  data.frame(name = iso3166$sovereignty, A3 = iso3166$a3, A2 = iso3166$a2)) 

countryCodes <- filter(countryCodes, !is.na(name)) %>% distinct(name, .keep_all = T)


flags <- left_join(flags, countryCodes, by="name") 

#Use pre downloaded data instead 
#countryMaps <- geojsonio::geojson_read("http://github.com/simonepri/geo-maps/releases/download/v0.6.0/countries-land-10km.geo.json", what = "sp")

countryMaps <- readRDS("countryMaps.rds")

mapData <- left_join(data.frame(A3=countryMaps$A3), flags, by="A3")


# Define server logic
shinyServer(function(input, output) {
  
  showFlags <- reactive({
    !is.na(mapData$name) &  
      apply( mapData[,input$filters, drop=F], 1, min) > 0 &
      mapData$population >= input$population[1] &
      mapData$population <= input$population[2] & 
      mapData$area >= input$area[1] &
      mapData$area <= input$area[2]  
  })
  
  output$title <- reactive({ 
    paste(title,"-",sum(showFlags()), "countries selected")
  })
  
  output$mapPlot <- renderLeaflet({
    
    leaflet(countryMaps[showFlags(),]) %>% addTiles() %>%
      addPolygons(fillColor = mapData[showFlags(), input$whichcolor],  
                  fillOpacity = 0.7,
                  weight = 1,
                  #opacity = 1,
                  color = "transparent",
                  dashArray = "3",
                  label = lapply(
                    paste0("<h3>", mapData$name[showFlags()],"</h3>",
                           '<img src="http://flags.fmcdn.net/data/flags/w580/',
                           tolower(mapData$A2[showFlags()]), '.png" height=100>',
                           '<h4>Population: ', mapData$population[showFlags()], ' millions</h4>',
                           '<h4>Area: ', mapData$area[showFlags()], ' thousands square km</h4>')
                    , HTML)
      )
    
  })
})
