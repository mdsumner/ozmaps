## @knitr download
#f <- "https://data.gov.au/dataset/bdcf5b09-89bc-47ec-9281-6b8e9ee147aa/resource/cb2d6c1c-fd4c-4fd7-b93b-3796425bc0de/download/aug17adminboundsmapinfotabformat20170828133827.zip"
f <- "https://data.gov.au/dataset/bdcf5b09-89bc-47ec-9281-6b8e9ee147aa/resource/53c24b8e-4f55-4eed-a189-2fc0dcca6381/download/aug17adminboundsesrishapefileordbffile20170821151234.zip"
if (FALSE) {
 if (!file.exists(basename(f))) download.file(f, basename(f), mode = "wb")
 unzip(basename(f))
}

## @knitr files
library(dplyr)
fs <- tibble::tibble(fullname = list.files( recursive = TRUE, pattern = "shp$"))

## keep file and fullname, a habit of mine
fs <- fs %>% dplyr::mutate(file = basename(fullname)) %>% dplyr::select(file, fullname)

fs
## read all files and bind together in one object
## (I find problems using map_df so I just avoid it
## and ensure sf is attached)
read_psma <- function(x, keep = 1) {
  library(sf)
  do.call(rbind, purrr::map(x, sf::read_sf))
}


## @knitr build-data



## state (33 Mb)
state <- read_psma(fs %>% dplyr::filter(grepl("STATE_POLYGON", file)) %>% dplyr::pull(fullname))
library(rmapshaper)
aus <- ms_simplify(state, keep_shapes = FALSE)
aus <- ms_simplify(st_as_sf(rgeos::gUnionCascaded(as(aus, "Spatial"))))

aus$name <- "Australia"
aus$rmapshaperid <- NULL

ozboundary <- silicate::PATH(aus)
compact_silicate_path <- function(x) {

  x$path$object_ <- match(x$path$object_,
                                      x$object$object_)
  x$object$object_ <- NULL

  x$path_link_vertex$vertex_ <- match(x$path_link_vertex$vertex_,
                                      x$vertex$vertex_)
  x$path_link_vertex$path_ <- match(x$path_link_vertex$path_,
                                    x$path$path_)

  x$vertex$vertex_ <- NULL
  x$path$path_ <- NULL
  x$path$ncol <- NULL
  x$object$object_ <- NULL
  x
}

x <- compact_silicate_path(ozboundary)
ozboundary <- split(tab %>% transmute(x = x_, y = y_), tab$branch_) %>%
  purrr::map_df(~ rbind(.x, NA)) %>%
  tail(-1) %>%
  as.list()
ozboundary$range <- c(range(tab$x_), range(tab$y_))
ozboundary$names <- as.character(length(unique(tab$branch_)))
class(ozboundary) <- "map"





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
