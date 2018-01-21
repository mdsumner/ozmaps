 context("test-maps.R")
 test_that("data is in sf form", {
           ozmap_data("country") %>%
             expect_s3_class("sf") %>%
             expect_s3_class("tbl_df")
           ozmap_data("states") %>%
             expect_s3_class("sf") %>%
             expect_s3_class("tbl_df")
}
           )
#
# library(dplyr)
# fs <- tibble::tibble(fullname = list.files(".", recursive = TRUE, pattern = "shp$"))
#
# ## keep file and fullname, a habit of mine
# fs <- fs %>% dplyr::mutate(file = basename(fullname)) %>% dplyr::select(file, fullname)
#
# simpl <- function(file) {
#   x <- sf::read_sf(file)
#   chr <- unlist(lapply(x, class) == "Date")
#   if (sum(chr) > 0) {
#    x <- x[!chr]
#   }
#   rmapshaper::ms_simplify(x)
# }
# x <- purrr::map(fs$fullname, simpl)
# test_that("data is available", {
#
# })
#
# test_that("maps works", {
#   expect_equal(2 * 2, 4)
# })
