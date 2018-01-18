oz <- oz::ozRegion()
#names(oz)
#str(oz$lines[[1]])
headtail <- function(x) {
  x[c(1:dim(x)[1], 1), ]
}

x <- sf::st_sfc(purrr::map(oz$lines, ~sf::st_linestring(do.call(cbind, .x))))
