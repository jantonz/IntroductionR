load_or_install <- function(x){
  for( i in x ){
    #  require returns TRUE invisibly if it was able to load package
    if( ! require( i , character.only = TRUE ) ){
      #  If package was not able to be loaded then re-install
      install.packages( i , dependencies = TRUE )
      #  Load package after installing
      require( i , character.only = TRUE )
    }
  }
}


load_or_install(c("dplyr", "ggplot2", "maps", "leaflet"))

list.files("data")

aero <- read.table("data/airports.csv", header = TRUE, sep = ",")
vols <- read.csv("data/flights.csv")

head(vols, 5)

str(vols)

summary(vols)

head(vols[c("origin", "dest", "arr_delay", "hour", "minute")], 3)

vols$time <- vols$hour + vols$minute / 60

head(vols, 1)

retard.per.hora <- summarise(group_by(vols, time), 
                             retard = mean(arr_delay, na.rm=TRUE), n=n())

head(retard.per.hora)

ggplot(data = retard.per.hora, aes(time, retard, size = n, color = n)) +
  geom_point() + scale_size_area()

ggplot(data = retard.per.hora, aes(time, retard, size = n, color = n)) +
  geom_smooth(method = "lm") +
  geom_point(alpha = 0.5) +
  scale_size_area()

retard.per.dest <- summarise(group_by(vols, dest), # alerta! agrupem per la variable "dest", aquest cop!
                             retard = mean(arr_delay, na.rm = TRUE), n = n()) # la resta és igual :)

head(retard.per.dest)

head(aero, 3)

retard.per.dest.geo <- left_join(x = retard.per.dest,    # la taula de l'esquerra, la principal
                             y = aero,               # la taula que volem unir
                             by = c("dest" = "faa")) # les columnes per les quals volem unir

retard.per.dest.geo <- merge(x = retard.per.dest,
                         y = aero,
                         by.x = "dest", by.y = "faa",
                         all.x = TRUE, all.y = FALSE)

head(retard.per.dest.geo, 5)

retard.per.dest.geo <- left_join(x = retard.per.dest,    # la taula de l'esquerra, la principal
                             y = aero[c("lat", "lon", "faa")],
                             # la taula que volem unir, però només les columnes d'interès i la columna d'unió
                             by = c("dest" = "faa")) # les columnes per les quals volem unir

head(retard.per.dest.geo, 5)

retard.per.dest.geo <- retard.per.dest.geo[complete.cases(retard.per.dest.geo), ] # Keep only the complete rows

ggplot(data = retard.per.dest.geo,
       aes(lon, lat, size = n, color = retard)) +
  geom_point(alpha = 0.5)

ggplot(data = retard.per.dest.geo,
       aes(lon, lat, size = n, color = retard)) +
  geom_point(alpha = 0.5) +
  borders(database = "state", size = 0.5)

ggplot(data = retard.per.dest.geo,
       aes(lon, lat, size = n, color = retard)) +
  geom_point(alpha = 0.5) +
  borders()

map <- leaflet()
map <- leaflet() %>%
  addProviderTiles("Stamen.Toner") %>%
  addTiles()
  #addProviderTiles(providers$Esri.NatGeoWorldMap) %>%
  #set#View(3.111695, 45.791249, zoom =6 ) %>%
#   setView(-3.778503, 40.226761, zoom =6 ) %>%
#   addMarkers(df$longitude, df$latitude,
#              popup = paste("<strong>Name:</strong>",df$Name,
#                            "</br><Strong># </Strong>",df$gid,
#                            "</br><Strong>Ventas </Strong>",sprintf("%3.1f MEUR", df$Ventas/1000)),
#              label=sprintf("%3.1f MEUR", df$Ventas/1000),
#              clusterOptions= markerClusterOptions(),  ##Agrupamiento de los marcadores interactivos.
#              group= "Clientes") 

print(map)


m <- leaflet() %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  addMarkers(lng=174.768, lat=-36.852, popup="The birthplace of R")
m  # Print the map



m <- leaflet() %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  addMarkers(lng=retard.per.dest.geo$lon[1], lat=retard.per.dest.geo$lat[1]
#              popup = paste("<strong>Destination:</strong>", retard.per.dest.geo$dest,
#                            "</br><Strong>Retard:</Strong>", sprintf("%3.1f", retard.per.dest.geo$retard))
             )
m  # Print the map


retard.per.dest.geo$lon
