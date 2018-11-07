## ozmaps.data version 0.0.1
##these are simplified versions of a core set, see ozmaps.data for details
file.copy(list.files("../ozmaps.data/data", pattern = "^abs.*\\.rda$", full.names = TRUE),
          "data")

library(ozmaps)
library(tibble)
abs_ced <- sf::st_as_sf(as_tibble(abs_ced))
abs_ced <- sf::st_as_sf(as_tibble(abs_ced))
abs_gccsa <- sf::st_as_sf(as_tibble(abs_gccsa))
abs_ireg <- sf::st_as_sf(as_tibble(abs_ireg))
abs_lga <- sf::st_as_sf(as_tibble(abs_lga))
abs_ra <- sf::st_as_sf(as_tibble(abs_ra))
abs_sa2 <- sf::st_as_sf(as_tibble(abs_sa2))
abs_sa3 <- sf::st_as_sf(as_tibble(abs_sa3))
abs_sa4 <- sf::st_as_sf(as_tibble(abs_sa4))
abs_sed <- sf::st_as_sf(as_tibble(abs_sed))
abs_ste <- sf::st_as_sf(as_tibble(abs_ste))
ozmap_country <- sf::st_as_sf(as_tibble(ozmap_country))
ozmap_states <- sf::st_as_sf(as_tibble(ozmap_states))

usethis::use_data(abs_ced, abs_gccsa, abs_ireg, abs_lga, abs_ra, abs_sa2, abs_sa3, abs_sa4, abs_sed, abs_ste, ozmap_country, ozmap_states, overwrite = TRUE)
