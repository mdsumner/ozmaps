#' Australia map
#'
#' Draw a map of Australia, with or without states.
#'
#' outline data is purely in longitude-latitude form, see
#' `ozmap_data()` to obtain the data itself.`
#'
#' ozmap_country, ozmap_states
#' abs_* see `abs_ced`
#' @param x name of data set to use, default is `ozmap_country`
#' @param add add to existing plot, `FALSE` by default
#' @param ... arguments passed to ...
#' @seealso ozmap_data
#' @return nothing
#' @export
#'
#' @examples
ozmap <- function(x = "ozmap_states", ..., add = FALSE) {
  if ("states" %in% names(list(...))) {
    warning("states argument is deprecated, see 'oz::oz()' function")
  }

}

#' Australia map data
#'
#' @param data name of dat to return, see details
#' @param quiet set to `TRUE` to suppress messages
#' @param ... ignored
#'
#' @return `sf` data frame
#' @export
#'
#' @examples
#' ozmap_data("country")
ozmap_data <- function(data = "states", quiet = FALSE, ...) {
  switch(data,
         states = ozmap_states_data(quiet = quiet),
         country = ozma_countr
  if (data == "country") {
    out <- ozmap_country_data(quiet = quiet)
  }
  if (data == "electoral") {
    out <- abs_ced
  }
  if (data == "lga") {
    out <- abs_lga
  }

  out
}
ozmap_states_data <- function(..., quiet = FALSE) {
  if (!quiet) message("returning `sf` data format")
  #if (!requireNamespace("sf", quietly = TRUE) ) {
    message(" to use/plot ensure `sf` package is installed, then `library(sf)`")
  #}
  ozmap_states
}


ozmap_country_data <- function(..., quiet = FALSE) {
  if (!quiet) message("returning `sf` data format")
  message(" to use/plot ensure `sf` package is installed, then `library(sf)`")
  ozmap_country
}
