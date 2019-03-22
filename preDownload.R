library(geojsonio)

countryMaps <- geojsonio::geojson_read("http://github.com/simonepri/geo-maps/releases/download/v0.6.0/countries-land-10km.geo.json", what = "sp")

saveRDS(countryMaps, "countryMaps.rds")


flags <- read.csv("http://archive.ics.uci.edu/ml/machine-learning-databases/flags/flag.data",
                  col.names = c("name", "landmass", "zone", "area", "population", "language", "religion",
                                "bars", "stripes", "colours", "red", "green", "blue", "gold", "white", "black",
                                "orange", "mainhue", "circles", "crosses", "saltires", "quarters", "sunstars",
                                "crescent", "triangle", "icon", "animate", "text", "topleft", "botright"))

flags <- saveRDS(flags, "flagsData.rds")