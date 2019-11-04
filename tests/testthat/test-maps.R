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

test_that("we get plot", {
  expect_silent(ozmap())
  expect_silent(ozmap(x = "abs_ced"))
  expect_s3_class(ozmap("abs_ced"), "sf")
  expect_s3_class(ozmap("abs_ste"), "sf")
  expect_s3_class(ozmap("abs_lga"), "sf")
  expect_s3_class(ozmap("states"), "sf")
  expect_s3_class(ozmap("country"), "sf")

  expect_warning(ozmap(states = TRUE))

  expect_silent(ozmap(asp = 20))
})

test_that("oz data is in oz form", {
  expect_s3_class(oz_data(), "ozRegion")

  expect_s3_class(oz_data(data = "country"), "ozRegion")
})
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
