
<!-- README.md is generated from README.Rmd. Please edit that file -->

[![Build
Status](http://badges.herokuapp.com/travis/mdsumner/ozmaps?branch=master&env=BUILD_NAME=trusty_release&label=ubuntu)](https://travis-ci.org/mdsumner/ozmaps)
[![Build
Status](http://badges.herokuapp.com/travis/mdsumner/ozmaps?branch=master&env=BUILD_NAME=osx_release&label=osx)](https://travis-ci.org/mdsumner/ozmaps)
[![AppVeyor Build
Status](https://ci.appveyor.com/api/projects/status/github/mdsumner/ozmaps?branch=master&svg=true)](https://ci.appveyor.com/project/mdsumner/ozmaps)
[![CRAN
status](http://www.r-pkg.org/badges/version/ozmaps)](https://cran.r-project.org/package=ozmaps)
![cranlogs](http://cranlogs.r-pkg.org./badges/ozmaps) [![Coverage
Status](https://img.shields.io/codecov/c/github/mdsumner/ozmaps/master.svg)](https://codecov.io/github/mdsumner/ozmaps?branch=master)

# Overview

The goal of ozmaps is to get maps of Australia to plot\!

# Installation

ozmaps may be installed directly from github.

``` r
devtools::install_github("mdsumner/ozmaps")
```

The package includes some *simple features* data, which can be used
independently of ozmaps with the ‘sf’ package. If required, install `sf`
from CRAN.

``` r
install.packages("sf")
```

## Usage

Plot Australia with states.

``` r
library(ozmaps)
ozmap()
```

<img src="man/figures/README-unnamed-chunk-3-1.png" width="100%" />

Plot Australia without states.

``` r
ozmap(x = "country")
```

<img src="man/figures/README-unnamed-chunk-4-1.png" width="100%" />

Add to an existing plot.

``` r
plot(quakes[c("long", "lat")], xlim = c(120, 190))
ozmap(add = TRUE)
```

<img src="man/figures/README-unnamed-chunk-5-1.png" width="100%" />

Obtain the data used in `sf` form.

``` r
sf_oz <- ozmap_data("states")

tibble::as_tibble(sf_oz)
#> # A tibble: 9 x 2
#>   NAME                                                             geometry
#>   <chr>                                                  <MULTIPOLYGON [°]>
#> 1 New South Wales     (((150.7016 -35.12286, 150.6611 -35.11782, 150.6373 …
#> 2 Victoria            (((146.6196 -38.70196, 146.6721 -38.70259, 146.6744 …
#> 3 Queensland          (((148.8473 -20.3457, 148.8722 -20.37575, 148.8515 -…
#> 4 South Australia     (((137.3481 -34.48242, 137.3749 -34.46885, 137.3805 …
#> 5 Western Australia   (((126.3868 -14.01168, 126.3625 -13.98264, 126.3765 …
#> 6 Tasmania            (((147.8397 -40.29844, 147.8902 -40.30258, 147.8812 …
#> 7 Northern Territory  (((136.3669 -13.84237, 136.3339 -13.83922, 136.3532 …
#> 8 Australian Capital… (((149.2317 -35.222, 149.2346 -35.24047, 149.2716 -3…
#> 9 Other Territories   (((167.9333 -29.05421, 167.9188 -29.0344, 167.9313 -…
```

Plot with a custom palette.

``` r
library(sf)
nmjr <- colorRampPalette(paletteer::paletteer_d(package = "ochRe", palette = "namatjira_qual"))(nrow(sf_oz))
plot(st_geometry(sf_oz), col = nmjr)
```

<img src="man/figures/README-unnamed-chunk-7-1.png" width="100%" />

``` r

## soon...plot directly with ggplot2
library(ggplot2)
ggplot(sf_oz, aes(fill = NAME)) + geom_sf() + coord_sf(crs = "+proj=lcc +lon_0=135 +lat_0=-30 +lat_1=-10 +lat_2=-45 +datum=WGS84") + scale_fill_manual(values = nmjr)
```

<img src="man/figures/README-unnamed-chunk-7-2.png" width="100%" />

Plot the ABS layers (from
2016).

``` r
opal <- colorRampPalette(paletteer::paletteer_d(package = "ochRe", palette = "namatjira_qual"))
ozmap("abs_ced", col = opal(nrow(abs_ced)))
```

<img src="man/figures/README-unnamed-chunk-8-1.png" width="100%" />

``` r


ozmap("abs_ste", col = opal(nrow(abs_ste)))
```

<img src="man/figures/README-unnamed-chunk-8-2.png" width="100%" />

-----

Please note that the ‘ozmaps’ project is released with a [Contributor
Code of
Conduct](https://github.com/mdsumner/ozmaps/blob/master/CODE_OF_CONDUCT.md).
By contributing to this project, you agree to abide by its terms.
