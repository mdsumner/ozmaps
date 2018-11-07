#' @keywords internal
"_PACKAGE"

globalVariables(c("ozmap_country", "ozmap_states"))


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




# this documentation was copied directly from ozmaps.data 0.0.1

#' Australian Bureau of Statistics (ABS) map data
#'
#' These data sets are simplifications of the formal statistical areas
#' and regions published by the ABS in 2016.
#'
#' Each layer was read from the source file with 'sf' package and attributes were removed, leaving a single 'NAME'
#' column from the year-specific column names. The geometry has been
#' simplified using `rmapshaper::ms_simplify` with default arguments (0.05 detail).
#'
#' Several layers are not included from the total available.
#'
#' The entire nation layer 'AUST' is not included
#' as it is the union of the State and Territory layer.
#'
#' Statistical Areas Level 1 is not included as it is very large (56Mb after simplification).
#'
#' The mesh blocks are not included.
#'
#'
#' @section Data layers :
#' \describe{
##' \item{abs_ced}{Commonwealth Electoral Divisions}
#' \item{abs_gccsa}{Greater Capital City Statistical Areas}
#' \item{abs_ireg}{Indigenous Regions}
#' \item{abs_lga}{Local Goverment Areas}
#' \item{abs_ra}{Remoteness Structure}
#' \item{abs_sa2}{Statistical Areas Level 2}
#' \item{abs_sa3}{Statistical Areas Level 3}
#' \item{abs_sa4}{Statistical Areas Level 4}
#' \item{abs_sed}{State Electoral Divisions}
#' \item{abs_ste}{State and Territory}

#' }
#' @seealso The script to create the data set set: data-raw/abs-inbuilt.R
#'
#' @format Simple features data frame with
#' \describe{
#' \item{NAME}{Area name}
#' \item{geometry}{Geometry column in 'sfc' format}
#' }
#'
#' @examples
#' \dontrun{
#' library(sf)
#' plot(abs_ste)
#' }
#' @aliases abs_ced abs_gccsa abs_ireg abs_lga abs_ra abs_sa2 abs_sa3 abs_sa4 abs_sed
"abs_ste"
