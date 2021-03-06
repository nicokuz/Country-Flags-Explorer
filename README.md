---
title: "Country Flags Explorer - Help"
author: "by [Nicolás E. Kuzminski](http://www.linkedin.com/in/nekuz/)"
#date: "17 de marzo de 2019"
output: 
  html_document:
    keep_md: yes
#knit: (function(inputFile, encoding) { 
#      rmarkdown::render(inputFile,
#                        encoding=encoding, 
#                        output_file=file.path(dirname(inputFile), 
#                        'www', 'about.html')) })
---



### About

This application shows a [choropleth map](http://en.wikipedia.org/wiki/Choropleth_map) of the world countries coloured according to the colors of their flags. It was made as an [R Language](http://www.r-project.org/about.html) little project for the ["Developing Data Products Course by Johns Hopkins" on Coursera](http://www.coursera.org/learn/data-products), using [Shiny](http://shiny.rstudio.com/) web framework and [Leaflet](http://leafletjs.com/) map visualization. The base world map is provided online by [OpenStreetMap](http://openstreetmap.org/), the political land borders (polygons) are from [Geo-Maps](http://github.com/simonepri/geo-maps).  I've published this project's [source code on Github](http://github.com/nicokuz/Country-Flags-Explorer), which I've made freely available for anyone to use and modify for their own project.     

### Map

The map shows the world countries political land territories coloured by their national flags. It can be navigated  the usual way, with the mouse cursor or the arrow keys. Also can be zoom in  or out with the minus and plus control shown over the left top of the map, or using the mouse wheel if it has one. When hovering with the mouse cursor over the colored countries, a popup will be shown with the country name, an image of its flag, the numeric value of its population in millions, and its area in thousands square kilometers. Bear in mind that the [Flags source dataset](http://archive.ics.uci.edu/ml/datasets/Flags) dates from 1986, so the data my differ with images, even some countries doesn't match with the current political map (ie, the Soviet Union) so they aren't shown at all.  

### Controls

#### Flag Features Filter

Check the boxes to display flag color and data only for the countries having the corresponding shape feature on its flag:

- Vertical **bars**   
- Horizontal **stripes** 
- **Circles** 
- Upright **crosses** 
- **Saltires** (Diagonal crosses)
- **Quarters** (Quartered Sections)
- **Sunstars** (Sun or star symbols)
- **Crescent** moon symbol
- **Triangle**s 
- **Icon** (Inanimate image)
- **Animate** icon (e.g., an eagle, a tree, a human hand)
- **Text** (e.g., a motto or slogan)

#### Country Statistics Filter

Use the sliders to display flag color and data only for the countries being in the selected ranges, selecting the minimum and maximum values to filter:

- **By Area** territory in thousand square kilometers   
- **By Population** inhabitants in millions 

#### Flag Color Shown 

Use these radio buttons to select that the flag colors shown on the map corresponds to the color:

- **Predominant in Flag** (Tie-breaks decided by taking the topmost hue, if that fails then the most central hue, and if that fails the leftmost hue) 
- **In Top Left Corner** (moving right to decide tie-breaks)
- **In Bottom Right Corner** (moving left to decide tie-breaks)

### Final Words

You can use and copy this application freely. Just don't forget to recognize the involved sources and authors, like me. Have fun as much as I did!

*Nicolás E. Kuzminski*

