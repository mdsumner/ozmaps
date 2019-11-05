#' @keywords internal
"_PACKAGE"

globalVariables(c("ozmap_country", "ozmap_states",
                  "abs_ced", "abs_lga",   "abs_ste"))


#' Australian map data
#'
#' Australian coastline and boundaries data, including states and territories
#'
#' In-built data set of Australian coastline and provinces (states and
#' territories) simplified from the Australian Bureau of Statistics layer
#' [abs_ste].
#' @name ozmap_states
#' @aliases ozmap_country
#' @docType data
#' @importFrom tibble tibble as_tibble
NULL




# this documentation was copied directly from ozmaps.data 0.0.1

#' Australian Bureau of Statistics (ABS) map data
#'
#' These data sets are simplifications of the formal statistical areas
#' and regions published by the ABS in 2016.
#'
#' Each layer was read from the source file with 'sf' package and attributes were removed, leaving a single 'NAME'
#' column from the year-specific column names. The geometry has been
#' simplified using 'rmapshaper::ms_simplify' with default arguments (0.05 detail).
#'
#' Several layers are not included from the total available.
#'
#' The entire nation layer 'AUST' is not included
#' as it is the union of the State and Territory layer.
#'
#' Statistical Areas Level 1 is not included as it is very large (56Mb after simplification).
#'
#' The mesh blocks are not included, nor Greater Capital City Statistical Areas,
#' Indigenous Regions, Remoteness Structure, Statistical Areas (L2, L3, L4),
#' State Electoral Divisions. See 'ozmaps.data' for these.
#'
#'
#' @section Data layers:
#' \describe{
##' \item{abs_ced}{Commonwealth Electoral Divisions}
#' \item{abs_lga}{Local Government Areas}
#' \item{abs_ste}{State and Territory}

#' }
#' @seealso The script to create the data set: data-raw/abs-inbuilt.R
#'
#' @format Simple features data frame with
#' \describe{
#' \item{NAME}{Area name}
#' \item{geometry}{Geometry column in 'sfc' format}
#' }
#'
#' @examples
#' ozmap("abs_ste")
#'
#' ozmap("abs_lga", col = sample(rainbow(nrow(abs_lga), alpha = .4)))
#' opal <- colorRampPalette(paletteer::paletteer_d(package = "ochRe", palette = "namatjira_qual"))
#' ozmap("abs_ced", col = opal(30))
#' @aliases abs_ced abs_lga abs_ste
#' @name abs-data
NULL
