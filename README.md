
<!-- README.md is generated from README.Rmd. Please edit that file -->
[![Travis build status](https://travis-ci.org/mdsumner/ozmaps.svg?branch=master)](https://travis-ci.org/mdsumner/ozmaps) [![AppVeyor Build Status](https://ci.appveyor.com/mdsumner/ozmaps)](https://ci.appveyor.com/api/projects/status/github//mdsumner/ozmaps/?branch=master&svg=true) [![Coverage status](https://codecov.io/gh/mdsumner/ozmaps/branch/master/graph/badge.svg)](https://codecov.io/github/mdsumner/ozmaps?branch=master) [![CRAN status](http://www.r-pkg.org/badges/version/ozmaps)](https://cran.r-project.org/package=ozmaps)

Overview
========

The goal of ozmaps is to get maps of Australia to plot!

Installation
============

ozmaps may be installed directly from github.

``` r
devtools::install_github("mdsumner/ozmaps")
```

The package includes some *simple features* data, which can be used independently of ozmaps with the 'sf' package. If required, install `sf` from CRAN.

``` r
install.packages("sf")
```

Usage
-----

Plot Australia with states.

``` r
library(ozmaps)
ozmap()
```

<img src="man/figures/README-unnamed-chunk-3-1.png" width="100%" />

Plot Australia without states.

``` r
ozmap(states = FALSE)
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
sf_oz <- ozmap_data("ozmap_states")
#> returning `sf` data format
#>  to use/plot ensure `sf` package is installed, then `library(sf)`

tibble::as_tibble(sf_oz)
#> Simple feature collection with 11 features and 3 fields
#> geometry type:  MULTIPOLYGON
#> dimension:      XY
#> bbox:           xmin: 112.9194 ymin: -54.75042 xmax: 159.1065 ymax: -9.240167
#> epsg (SRID):    4326
#> proj4string:    +proj=longlat +datum=WGS84 +no_defs
#> # A tibble: 11 x 4
#>    name                         type   adm1_code                  geometry
#>    <chr>                        <chr>  <chr>        <sf_geometry [degree]>
#>  1 Macquarie Island             <NA>   AUS+00?   MULTIPOLYGON (((158.8657…
#>  2 Jervis Bay Territory         Terri… AUS-1932  MULTIPOLYGON (((150.6131…
#>  3 Northern Territory           Terri… AUS-2650  MULTIPOLYGON (((136.6955…
#>  4 Western Australia            State  AUS-2651  MULTIPOLYGON (((122.2469…
#>  5 Australian Capital Territory Terri… AUS-2653  MULTIPOLYGON (((149.3818…
#>  6 New South Wales              State  AUS-2654  MULTIPOLYGON (((150.7038…
#>  7 South Australia              State  AUS-2655  MULTIPOLYGON (((137.6229…
#>  8 Victoria                     State  AUS-2656  MULTIPOLYGON (((146.4898…
#>  9 Queensland                   State  AUS-2657  MULTIPOLYGON (((153.4873…
#> 10 Norfolk Island               Terri… AUS-2659  MULTIPOLYGON (((159.0689…
#> 11 Tasmania                     State  AUS-2660  MULTIPOLYGON (((147.364 …
```

Plot with a custom palette.

``` r
library(sf)
nmjr <- ochRe::ochre_pal()(dim(sf_oz)[1])
plot(st_geometry(sf_oz), col = nmjr)
```

<img src="man/figures/README-unnamed-chunk-7-1.png" width="100%" />

``` r

## soon...plot directly with ggplot2
library(ggplot2)
ggplot(sf_oz, aes(fill = name)) + geom_sf() + coord_sf(crs = "+proj=lcc +lon_0=135 +lat_0=-30 +lat_1=-10 +lat_2=-45 +datum=WGS84") + scale_fill_manual(values = nmjr)
```

<img src="man/figures/README-unnamed-chunk-7-2.png" width="100%" />
