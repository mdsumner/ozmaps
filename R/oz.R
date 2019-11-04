#' The oz function
#'
#' The classic `oz` package [oz::oz()] function.
#'
#' This function calls [oz::oz()] to draw a basic outline. Use
#' [oz_data()] to obtain the data in native form.
#'
#' See [oz::ozRegion()] for more details.  Here `data` is treated as
#' an identifier, but only "states" or any other value is accepted. If not
#' "states", then country level is returned. Further arguments to [oz::ozRegion()]
#' can be passed in via dots.
#' @name oz
#' @param data character string, "states" provides state level else country level
#' @param ... passed to [oz::ozRegion()]
#' @return oz class list of coordinates
#' @importFrom oz oz
#' @export oz
#' @export
oz_data <- function(data = "states", ...) {
  oz::ozRegion(states = data == "states", ...)
}
