# Basic R:

x = 1:5
y = c(0, 1, 3, 9, 18)
plot(x, y)

class(x)

# from c. 7: https://itsleeds.github.io/rrsrr/space.html

library(sf)        # load the sf package for working with spatial data
library(tidyverse) # load the tidyverse as before

crashes = tibble(
  casualty_type = c("pedestrian", "cyclist", "cat"),
  casualty_age = seq(from = 20, to = 60, by = 20),
  vehicle_type = c("car", "bus", "tank"),
  dark = c(TRUE, FALSE, TRUE)
)

crashes_sf = crashes # create copy of crashes dataset
crashes_sf$longitude = c(-1.3, -1.2, -1.1)
crashes_sf$latitude = c(50.7, 50.7, 50.68)
crashes_sf = st_as_sf(crashes_sf, coords = c("longitude", "latitude"), crs = 4326) # st_as_sf converts longitude and latitude coordinates into spatial objects using a specified Coordinate Reference System (see 7.6)

zones = pct::get_pct_zones("isle-of-wight")[1:9]
plot(zones$geometry) # plot just the geometry of one layer

plot(zones_containing_crashes$geometry, col = "grey", add = TRUE)


# From Geocomputation with R:

pkgs = c(
  "sf",
  "tidyverse",
  "stplanr",
  "tmap"
)

install.packages("sf")
remotes::install_cran(pkgs)

u = "https://npttile.vs.mythic-beasts.com/npct-data/pct-outputs-regional-notR/commute/msoa/west-yorkshire/z.geojson"
zones = sf::read_sf(u)

plot(zones)

library(tmap)
tmap_mode("view")
tm_shape(zones) + tm_polygons()

# see https://geocompr.robinlovelace.net/adv-map.html
# for more on map making
