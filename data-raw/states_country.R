# ## ozmap_states
# library(dplyr)
# ozmap_states <- rnaturalearth::ne_states(country = "australia", returnclass = "sf") %>%
#   dplyr::select(name, type, adm1_code, geometry)
# ozmap_states <- sf::st_as_sf(tibble::as_tibble(ozmap_states))
#
# library(dplyr)
# ozmap_country <- rnaturalearth::ne_countries(country = "australia", returnclass = "sf") %>%
#   dplyr::select(name, type, adm0_a3, geometry)
# ozmap_country <- sf::st_as_sf(tibble::as_tibble(ozmap_country))


ozmap_states <- sf::st_as_sf(tibble::as_tibble(rmapshaper::ms_simplify(abs_ste, .1)))
ozmap_country <- sf::st_as_sf(tibble::tibble(NAME = "Australia", geometry = sf::st_union(ozmap_states)))

usethis::use_data(ozmap_states, overwrite = TRUE)
usethis::use_data(ozmap_country, overwrite = TRUE)

