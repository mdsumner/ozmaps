library(ozmaps.rdata)

library(sf)
x1 <- electoral
x2 <- rmapshaper::ms_simplify(x1, keep_shapes = TRUE)

p <- silicate:::compact_indexes(silicate::PATH(x2))
pryr::object_size(x2)
pryr::object_size(p)

electoral <- geojsonio::geo2topo(geojsonio::geojson_json(electoral0))
#x <- sf::st_as_sf(geojsonio::geojson_sp(geojsonio::topo2geo(electoral)))
#usethis::use_data(electoral)

## @knitr build-data



## state (33 Mb)
#state <- read_psma(fs %>% dplyr::filter(grepl("STATE_POLYGON", file)) %>% dplyr::pull(fullname))
#library(rmapshaper)
#aus <- ms_simplify(state, keep_shapes = FALSE)
#aus <- ms_simplify(st_as_sf(rgeos::gUnionCascaded(as(aus, "Spatial"))))
#
# aus$name <- "Australia"
# aus$rmapshaperid <- NULL
#
# ozboundary <- silicate::PATH(aus)
# compact_silicate_path <- function(x) {
#
#   x$path$object_ <- match(x$path$object_,
#                                       x$object$object_)
#   x$object$object_ <- NULL
#
#   x$path_link_vertex$vertex_ <- match(x$path_link_vertex$vertex_,
#                                       x$vertex$vertex_)
#   x$path_link_vertex$path_ <- match(x$path_link_vertex$path_,
#                                     x$path$path_)
#
#   x$vertex$vertex_ <- NULL
#   x$path$path_ <- NULL
#   x$path$ncol <- NULL
#   x$object$object_ <- NULL
#   x
# }
#
# x <- compact_silicate_path(ozboundary)
# ozboundary <- split(tab %>% transmute(x = x_, y = y_), tab$branch_) %>%
#   purrr::map_df(~ rbind(.x, NA)) %>%
#   tail(-1) %>%
#   as.list()
# ozboundary$range <- c(range(tab$x_), range(tab$y_))
# ozboundary$names <- as.character(length(unique(tab$branch_)))
# class(ozboundary) <- "map"
#
#
#


# ## all LGA (64Mb)
# lga <- read_psma(fs %>% dplyr::filter(grepl("LGA_POLYGON", file)) %>% dplyr::pull(fullname))
# ## electoral (140Mb)
# elec <- read_psma(fs %>% dplyr::filter(grepl("STATE_ELECTORAL_POLYGON", file)) %>% dplyr::pull(fullname))
#
# #s_lga <- rmapshaper::ms_simplify(lga, keep_shapes = TRUE, keep = 0.002)
# #s_elec <- rmapshaper::ms_simplify(elec, keep_shapes = TRUE, keep = 0.0002)
# s_state <- rmapshaper::ms_simplify(state, keep_shapes = TRUE, keep = 0.002)
#
# usethis::use_data(lga)
# usethis::use_data(elec)
# usethis::use_data(state)
#
#
#
#
#
