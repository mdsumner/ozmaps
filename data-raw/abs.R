## ozmaps.data version 0.0.1
##these are simplified versions of a core set, see ozmaps.data for details
f <- list.files("../ozmaps.data/data", pattern = "^abs.*\\.rda$", full.names = TRUE)
fs <- c(grep("ced",f, value = TRUE),
        grep("lga",f, value = TRUE),
        grep("ste",f,value = TRUE))
file.copy(fs,
          "data/")


library(ozmaps)

fixup <- function(x) {
  sf::st_set_geometry(x, structure(unname(sf::st_geometry(x)), class = c("sfc_MULTIPOLYGON", "sfc", "list" )))
}
abs_ced <- fixup(abs_ced)
abs_lga <- fixup(abs_lga)
abs_ste <- fixup(abs_ste)

fixup2 <- function(x) {
  sf::st_set_crs(x, sf::st_crs(x))
}
abs_ced <- fixup2(abs_ced)
abs_lga <- fixup2(abs_lga)
abs_ste <- fixup2(abs_ste)

usethis::use_data(abs_ced, abs_lga, abs_ste, overwrite = TRUE, compress = "xz", version = 2)

# library(ozmaps)
# library(tibble)
# abs_ced <- sf::st_as_sf(as_tibble(abs_ced))
# abs_ced <- sf::st_as_sf(as_tibble(abs_ced))
# abs_gccsa <- sf::st_as_sf(as_tibble(abs_gccsa))
# abs_ireg <- sf::st_as_sf(as_tibble(abs_ireg))
# abs_lga <- sf::st_as_sf(as_tibble(abs_lga))
# abs_ra <- sf::st_as_sf(as_tibble(abs_ra))
# abs_sa2 <- sf::st_as_sf(as_tibble(abs_sa2))
# abs_sa3 <- sf::st_as_sf(as_tibble(abs_sa3))
# abs_sa4 <- sf::st_as_sf(as_tibble(abs_sa4))
# abs_sed <- sf::st_as_sf(as_tibble(abs_sed))
# abs_ste <- sf::st_as_sf(as_tibble(abs_ste))
# ozmap_country <- sf::st_as_sf(as_tibble(ozmap_country))
# ozmap_states <- sf::st_as_sf(as_tibble(ozmap_states))
#
# usethis::use_data(abs_ced, abs_gccsa, abs_ireg, abs_lga, abs_ra, abs_sa2, abs_sa3, abs_sa4, abs_sed, abs_ste, ozmap_country, ozmap_states, overwrite = TRUE)
