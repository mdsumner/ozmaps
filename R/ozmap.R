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
#' @param x name of data set to use, default is `ozmap_country`
#' @param add add to existing plot, `FALSE` by default
#' @param ... arguments passed to ...
#' @seealso ozmap_data
#' @return the data set used, in 'sf' format
#' @export
#'
#' @examples
#' ozmap()
#' ozmap("country")
#' ozmap("abs_ced")  ## commonwealth (national) electoral divisions
ozmap <- function(x = "states", ..., add = FALSE) {
  if ("states" %in% names(list(...))) {
    warning("states argument is deprecated, see 'oz::oz()' function")
  }
  x <- ozmap_data(x, quiet  = TRUE)
  plot_sfc(x, add = add, ...)
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

plot_bbox <- function(x, ...) {
  xr <- x[c("xmin", "xmax")]
  yr <- x[c("ymin", "ymax")]
  plot(xr, yr, type = "n", axes = FALSE, xlab = "", ylab = "", ...)
}



## from sf
# person(given = "Edzer",
#        family = "Pebesma",
#        role = c("ctb"),
#        comment = c(ORCID = "0000-0001-8049-7069"))
#' @importFrom graphics plot polypath
plot_sfc <- function(x, y, ..., lty = 1, lwd = 1, col = NA, border = 1, add = FALSE, rule = "evenodd") {
  # FIXME: take care of lend, ljoin, xpd, and lmitre
  stopifnot(missing(y))
  geom <- x[[attr(x, "sf_column")]]
  bb <- attr(geom, "bbox")
  prj <- attr(geom, "crs")$proj4string
  if (!"asp" %in% names(list(...))) {
    asp <- 1
    if (grepl("longlat", prj) || grepl("4326", prj)) {
      asp <- 1/cos(mean(bb[c("ymin", "ymax")]) * pi/180)
    }
  } else {
    asp <- list(...)$asp
  }
  if (! add)
    plot_bbox(bb, asp = asp)
  x <- geom
  lty = rep(lty, length.out = length(x))
  lwd = rep(lwd, length.out = length(x))
  col = rep(col, length.out = length(x))
  border = rep(border, length.out = length(x))
  #non_empty = ! st_is_empty(x)
  lapply(seq_along(x), function(i) {
      lapply(x[[i]], function(L) {
        polypath(sf_p_bind(L), border = border[i], lty = lty[i], lwd = lwd[i], col = col[i], rule = rule)
      })})
  invisible(NULL)
}


sf_p_bind <- function(lst) {
  if (length(lst) == 1)
    lst[[1]]
  else {
    ret = vector("list", length(lst) * 2 - 1)
    ret[seq(1, length(lst) * 2 - 1, by = 2)] = lst # odd elements
    ret[seq(2, length(lst) * 2 - 1, by = 2)] = NA  # even elements
    do.call(rbind, ret) # replicates the NA to form an NA row
  }
}
