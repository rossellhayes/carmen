
<!-- README.md is generated from README.Rmd. Please edit that file -->

# carmen <img src="man/figures/logo.png?raw=TRUE" align="right" height="138" />

> Where in the world is this IP address?

<!-- badges: start -->

[![](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![License:
MIT](https://img.shields.io/badge/license-MIT-blueviolet.svg)](https://cran.r-project.org/web/licenses/MIT)
[![R build
status](https://github.com/rossellhayes/carmen/workflows/R-CMD-check/badge.svg)](https://github.com/rossellhayes/carmen/actions)

<!-- badges: end -->

**carmen** determines the location associated with IP addresses in R.

## Installation

<!-- You can install the released version of **fracture** from [CRAN](https://cran.r-project.org/package=fracture) with: -->

<!-- ``` {r eval = FALSE} -->

<!-- install.packages("fracture") -->

<!-- ``` -->

You can install the development version of **carmen** from
[GitHub](https://github.com/rossellhayes/carmen) with:

``` r
# install.packages("remotes")
remotes::install_github("rossellhayes/carmen")
```

## Usage

**carmen** can locate a vector of IP addresses.

``` r
crm_locate("130.191.166.222")
#> # A tibble: 1 x 2
#>   country_code country_name            
#>   <chr>        <chr>                   
#> 1 US           United States of America
```

**carmen** can be used within `dplyr::mutate()`.

``` r
tibble(
  id   = seq_len(100),
  name = generator::r_full_names(100),
  ip   = generator::r_ipv4_addresses(100)
) %>%
  mutate(crm_locate(ip))
#> # A tibble: 100 x 5
#>       id name               ip             country_code country_name            
#>    <int> <chr>              <chr>          <chr>        <chr>                   
#>  1     1 Gabriel Breitenbe~ 213.176.122.1~ IR           Iran (Islamic Republic ~
#>  2     2 Elvia Sipes        101.34.181.209 CN           China                   
#>  3     3 Lacy Strosin       147.244.46.196 US           United States of America
#>  4     4 Chae Heathcote     108.213.131.24 US           United States of America
#>  5     5 Arla Luettgen      115.246.7.197  IN           India                   
#>  6     6 Frankie Witting    121.233.83.107 CN           China                   
#>  7     7 Broderick Ward     168.109.36.39  US           United States of America
#>  8     8 Clemente Hyatt     239.194.73.65  -            -                       
#>  9     9 Maegan Hilpert     81.74.212.67   IT           Italy                   
#> 10    10 Un Champlin        141.242.174.2~ US           United States of America
#> # ... with 90 more rows
```

## Advantages 🚀

**carmen** is written using vectorized R code and C++ code with Rcpp.
This allows it to run much faster than alternatives like
[ip2location](https://github.com/ip2location/ip2location-r).

-----

Icon adapted from
[Ctrlastudio](https://www.flaticon.com/authors/ctrlastudio) from
[www.flaticon.com](https://www.flaticon.com/).

Hex sticker fonts are [Source Sans
Pro](https://github.com/adobe-fonts/source-sans-pro) by
[Adobe](https://www.adobe.com).

Please note that **carmen** is released with a [Contributor Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
