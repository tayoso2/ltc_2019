
library(dplyr)
library(sf)


setwd("C:\\Users\\TOsosanya\\Desktop\\LTC")
road <- st_read("roads and tunnels.shp")
ltc <- read.csv("Asset Base/LTC Pavement and Non Pavement v2.csv")
asset_location <- cbind(as.data.frame(road[1:153,26]),AssetID = ltc[1:153,2])

asset_location_sf <- st_as_sf(asset_location, crs = 27700)
asset_location_sf <- st_transform(asset_location_sf, crs = 4326)
asset_location_sf <- st_as_sf(asset_location_sf, wkt = "geometry")

st_write(asset_location_sf, "Asset Base/asset_location.csv", layer_options = "GEOMETRY=AS_WKT")

