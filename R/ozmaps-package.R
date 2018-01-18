#' @keywords internal
"_PACKAGE"

#' Australian map data
#'
#' Australian coastline and boundaries data, including states and territories
#'
#' In-built data set of Australian coastline and provinces (states and territories) from Natural Earth.
#' These are selective versions of the `rnaturalearth` data sets.
#' `ozmap_states` from `rnaturalearth::ne_states(country = "australia")` (`adm1_code`)
#' `ozmap_country` from `rnaturalearth::ne_countries(country = "australia")` (`adm0_a3`)
#' @name ozmap_states
#' @aliases ozmap_country
#' @docType data
NULL


globalVariables(c("ozmap_country", "ozmap_states"))
