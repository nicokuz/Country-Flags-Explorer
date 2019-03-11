#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(leaflet)

# Define UI for application 
shinyUI(fluidPage(
  
  # Application title
  titlePanel(textOutput("title")),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      
      checkboxGroupInput("filters", "Select Flags Having:", 
                         c("bars", "stripes", "circles", "crosses", "saltires", "quarters", "sunstars", 
                           "crescent", "triangle", "icon", "animate", "text"), inline = T),
      
      sliderInput("population", "By Population (millions):",
                  min = 0, max = 1100, value = c(0, 1100)),
      
      sliderInput("area", "By Area (thousands square km):",
                  min = 0, max = 10000, value = c(0, 10000)),
      
      radioButtons("whichcolor", "Show Color:",
                   c("Predominant in Flag" = "mainhue",
                     "In Top Left Corner" = "topleft",
                     "In Bottom Right Corner" = "botright"))
      
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      leafletOutput("distPlot", height = "500")
    )
  ),
  
  'Flags Data Set collected primarily from the "Collins Gem Guide to Flags": Collins Publishers (1986) (',
  a('https://archive.ics.uci.edu/ml/datasets/Flags', href='https://archive.ics.uci.edu/ml/datasets/Flags'), ').', br(),
  'The map and flag images are current, so some countries could not be displayed, in particular those that where part of the Soviet Union on 1986.'
))
