library(dplyr)
library(ggmap)
library(leaflet)

ph <- read.csv("manning_agencies.csv")
ph <- ph %>% select(-X)

ph %>% 
  head(5) %>% 
  DT::datatable(options = list(
    lengthMenu = c(5,3,1)
  ))

Ph.geo <- data.frame(120.98422, 14.599512)
names(Ph.geo) <- c("long", "lat")

leaflet(data = ph) %>% 
  addProviderTiles(providers$CartoDB.Positron) %>%
  setView(lng = Ph.geo$lon, lat = Ph.geo$lat, zoom = 5) %>% 
  addCircleMarkers(~lon, ~lat, popup = ~address,
                   clusterOptions = markerClusterOptions()) %>% 
  addLegend("topright", colors= "blue", labels="Address")

