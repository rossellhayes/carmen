
<!-- README.md is generated from README.Rmd. Please edit that file -->

# carmen

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
#>       id name           ip              country_code country_name            
#>    <int> <chr>          <chr>           <chr>        <chr>                   
#>  1     1 Nilsa Ferry    211.121.130.199 JP           Japan                   
#>  2     2 Lowell Carroll 42.179.179.50   CN           China                   
#>  3     3 Nita Cremin    134.58.174.129  BE           Belgium                 
#>  4     4 Alberto Daniel 242.19.228.29   -            -                       
#>  5     5 Adeline Willms 251.232.231.192 -            -                       
#>  6     6 Kattie Beier   61.206.112.81   JP           Japan                   
#>  7     7 Adolfo Kirlin  252.219.128.50  -            -                       
#>  8     8 Beau Donnelly  18.21.74.39     US           United States of America
#>  9     9 Veta Leuschke  215.172.194.79  US           United States of America
#> 10    10 Korey Murray   22.149.92.179   US           United States of America
#> # ... with 90 more rows
```

## Advantages 🚀

**carmen** is written using vectorized R code and C++ code with Rcpp.
This allows it to run much faster than alternatives like
[ip2location](https://github.com/ip2location/ip2location-r).

-----

Please note that **carmen** is released with a [Contributor Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
