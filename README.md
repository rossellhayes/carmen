
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
#>       id name                ip             country_code country_name           
#>    <int> <chr>               <chr>          <chr>        <chr>                  
#>  1     1 Denisse Ebert       124.126.52.99  CN           China                  
#>  2     2 Micheal Schmeler    47.59.89.19    ES           Spain                  
#>  3     3 Nathanial Altenwer~ 235.162.136.1~ -            -                      
#>  4     4 August Brown        213.55.195.248 CH           Switzerland            
#>  5     5 Eldon Emmerich      176.227.114.1~ TR           Turkey                 
#>  6     6 Tanisha Russel      206.251.166.1~ US           United States of Ameri~
#>  7     7 Mervin Funk         10.30.246.182  -            -                      
#>  8     8 Dale Lesch          36.246.190.208 JP           Japan                  
#>  9     9 Leif Conroy         188.254.198.1~ BG           Bulgaria               
#> 10    10 Homer Wuckert       106.189.23.168 JP           Japan                  
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
