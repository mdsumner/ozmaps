#' Australia map
#'
#' Draw a map of Australia, with or without states.
#'
#' This function calls `oz::oz()` to draw a basic outline. The
#' outline data is purely in longitude-latitude form, see
#' `ozmap_data()` to obtain the data itself.`
#' @param states include state boundaries, `TRUE` by default
#' @param add add to existing plot, `FALSE` by default
#' @param ... arguments passed to `oz::oz`
#' @seealso ozmap_data
#' @return nothing
#' @export
#'
#' @examples
#' ozmap(states = FALSE, col = "firebrick", lwd = 4)
#' ozmap(states = TRUE, add = TRUE)
#'
#' ## further arguments may be passed to oz::oz, like coast
#' ozmap(states = FALSE, col = "dodgerblue", lwd = 4)
#' ozmap(states = TRUE, add = TRUE, coast = FALSE)
ozmap <- function(states = TRUE, add = FALSE, ...) {
  oz::oz(states = states, add = add, ...)
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
#' ozmap_data("ozmap_country")
ozmap_data <- function(data = c("ozmap_states", "ozmap_country", "electoral", "lga"), quiet = FALSE, ...) {
  data <- match.arg(data)
  if (data == "ozmap_states") {
    out <- ozmap_states_data(quiet = quiet)
  }
  if (data == "ozmap_country") {
    out <- ozmap_country_data(quiet = quiet)
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
