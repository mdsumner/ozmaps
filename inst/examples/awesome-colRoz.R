library(ozmaps)
library(colRoz)

par(mar = rep(0, 4))
plot(NA, xlim = c(110, 155), ylim = c(-43.5, -10), asp = 1/cos(30 * pi/180), axes = FALSE, xlab= "", ylab = "")

idx <- order(sf::st_coordinates(sf::st_centroid(abs_lga))[,1])
plot(abs_lga[idx, ], col = colRoz_pal("uluru", length(idx)), border =grey(0, alpha = 0.5), add = TRUE)
dem<- ceramic::cc_elevation(raster::extent(110, 155, -44, -10))

library(dplyr)
ht <- tabularaster::cellnumbers(dem, sf::st_transform(abs_lga, raster::projection(dem))) %>%
  group_by(object_) %>% summarize(z = mean(raster::extract(dem, cell_),na.rm = TRUE))

lga <- abs_lga %>% mutate(object_ = row_number()) %>% inner_join(ht)


cols <- colRoz_pal("m.horridus", nrow(abs_lga))[scales::rescale(lga$z) * (nrow(lga) - 1) + 1
]

par(mar = rep(0, 4))
plot(NA, xlim = c(110, 155), ylim = c(-44, -10), asp = 1/cos(30 * pi/180), axes = FALSE, xlab= "", ylab = "")
plot(lga, col = cols, border =grey(0, alpha = 0.5), add = TRUE)
