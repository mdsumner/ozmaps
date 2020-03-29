
ozmap_states <- sf::st_as_sf(tibble::as_tibble(rmapshaper::ms_simplify(abs_ste, .1)))
ozmap_country <- sf::st_as_sf(tibble::tibble(NAME = "Australia", geometry = sf::st_union(ozmap_states)))

class(ozmap_states$geometry) <-  c("sfc_MULTIPOLYGON", "sfc", "list")
class(ozmap_country$geometry) <- c("sfc_MULTIPOLYGON", "sfc", "list")

usethis::use_data(ozmap_states, overwrite = TRUE)
usethis::use_data(ozmap_country, overwrite = TRUE)

