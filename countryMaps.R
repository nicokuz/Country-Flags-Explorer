countryMaps <- geojsonio::geojson_read("http://github.com/simonepri/geo-maps/releases/download/v0.6.0/countries-land-10km.geo.json", what = "sp")

saveRDS(countryMaps, "countryMaps.rds")
