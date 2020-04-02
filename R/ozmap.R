#' Australia map
#'
#' Draw a map of Australia, with or without states.
#'
#' outline data is purely in longitude-latitude form, see
#' `ozmap_data()` to obtain the data itself.`
#'
#' See `abs_ste` for more detailed versions from the Australian Bureau of Statistics.
#' An example is 'abs_ste' which means 'State and Territory', and
#' so is a more detailed version of 'states'.
#'
#' `ozmap()` uses the sf package to plot, but does so by only plotting the
#' geometry rather than every colum, and leaves the plot region ready for overplotting with other
#' data.
#' @param x name of data set to use, default is `ozmap_country`
#' @param add add to existing plot, `FALSE` by default
#' @param ... arguments passed to ...
#' @seealso ozmap_data
#' @return the data set used, in 'sf' format
#' @export
#' @importFrom sf st_geometry
#' @importFrom graphics plot
#' @examples
#' ozmap()
#' ozmap("country", lwd = 6)
#' ozmap("abs_ced", add = TRUE, border = "firebrick")  ## commonwealth (national) electoral divisions
ozmap <- function(x = "states", ..., add = FALSE) {
  if ("states" %in% names(list(...))) {
    warning("states argument is deprecated, see 'oz::oz()' function")
  }
  x <- ozmap_data(x, quiet  = TRUE)


  plot(sf::st_geometry(x), add = add, ..., reset = FALSE)
  invisible(x)
}

#' Australia map data
#'
#' Return simple features data frames of various Australian map layers.
#'
#' Available layers are
#'
#' * **states** [ozmap_states] state and territories (low resolution)
#' * **country** [ozmap_country] entire country (low resolution)
#' * **abs_ced** [abs_ced] country level electoral divisions
#' * **abs_lga** [abs_lga] local government areas
#' * **abs_ste** [abs_ste] state and territories
#'
#' @param data name of layer to return, see details
#' @param quiet set to `TRUE` to suppress messages
#' @param ... unused
#'
#' @return `sf` data frame with 'NAME' and 'geometry' columns
#' @export
#' @examples
#'
#' country_sf <- ozmap_data("country")
#'
#' \donttest{
#'  ## can take time to print out
#'  lga_sf <- ozmap_data("abs_lga")
#'  lga_sf[1:6, ]
#' }
ozmap_data <- function(data = "states", quiet = FALSE, ...) {
  out <- switch(data,
                states = ozmap_states_data(...),
                country = ozmap_country_data(...),
                abs_ced = ozmap_abs_ced_data(...),
                #abs_gccsa= ozmap_abs_gccsa_data(...),
                #abs_ireg = ozmap_abs_ireg_data(...),
                abs_lga = ozmap_abs_lga_data(...),
                #abs_ra = ozmap_abs_ra_data(...),
                #abs_sa2 = ozmap_abs_sa2_data(...),
                #abs_sa3 = ozmap_abs_sa3_data(...),
                #abs_sa4 = ozmap_abs_sa4_data(...),
                #abs_sed = ozmap_abs_sed_data(...),
                abs_ste = ozmap_abs_ste_data(...),
                stop('data not found', data))

 out
}
ozmap_states_data <- function(...) {
  ozmap_states
}
ozmap_country_data <- function(...) {
  ozmap_country
}

ozmap_abs_ced_data <- function(...) {
  abs_ced
}
# ozmap_abs_gccsa_data <- function(...){
#   ## FIXME see commented out above, get from ozmaps.data if installed
#   ## plus message to install that
#   abs_gccsa
# }
# ozmap_abs_ireg_data <- function(...) {
#  abs_ireg
# }
ozmap_abs_lga_data <- function(...) {
 abs_lga
}
# ozmap_abs_ra_data <- function(...) {
#  abs_ra
# }
# ozmap_abs_sa2_data <- function(...) {
#   abs_sa2
# }
#
# ozmap_abs_sa3_data <- function(...) {
#  abs_sa3
# }
# ozmap_abs_sa4_data <- function(...) {
#  abs_sa4
# }
# ozmap_abs_sed_data <- function(...){
#   abs_sed
# }
ozmap_abs_ste_data <- function(...){
 abs_ste
}
