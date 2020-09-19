
<!-- README.md is generated from README.Rmd. Please edit that file -->

# carmen <img src="man/figures/logo.png?raw=TRUE" align="right" height="138" />

> Where in the world is this IP address?

<!-- badges: start -->

[![](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![License:
MIT](https://img.shields.io/badge/license-MIT-blueviolet.svg)](https://cran.r-project.org/web/licenses/MIT)
[![R build
status](https://github.com/rossellhayes/carmen/workflows/R-CMD-check/badge.svg)](https://github.com/rossellhayes/carmen/actions)
[![](https://codecov.io/gh/rossellhayes/carmen/branch/master/graph/badge.svg)](https://codecov.io/gh/rossellhayes/carmen)

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
#>  1     1 Venus Anderson 200.229.30.56   BR           Brazil                    
#>  2     2 Maryanne Kub   238.79.29.122   -            -                         
#>  3     3 Eliana Kunde   134.42.104.111  US           United States of America  
#>  4     4 Yuki Buckridge 29.206.69.8     US           United States of America  
#>  5     5 Willy Hilpert  15.238.80.103   US           United States of America  
#>  6     6 Ted Corkery    239.175.232.174 -            -                         
#>  7     7 Almeta Koepp   33.117.92.22    US           United States of America  
#>  8     8 Allyson Pouros 50.220.84.254   US           United States of America  
#>  9     9 Jeri Gulgowski 219.91.83.200   TW           Taiwan (Province of China)
#> 10    10 Leonard Willms 236.35.162.189  -            -                         
#> # ... with 90 more rows
```

## Advantages 🚀

**carmen** is written using a local database and vectorized R and C++
code. This allows it to run much faster than alternatives like
[rIP](https://github.com/MAHDLab/rIP),
[ip2location](https://github.com/ip2location/ip2location-r) and
[rgeolocate](https://github.com/Ironholds/rgeolocate).

``` r
ips <- generator::r_ipv4_addresses(20)

bench::mark(
  crm_locate(ips),
  lapply(ips, rIP::iphub_check),
  lapply(ips, ip2location::get_all),
  rgeolocate::ip2location(ips, ip2location),
  rgeolocate::maxmind(ips, maxmind),
  lapply(ips, rgeolocate::ip_info),
  rgeolocate::ip_api(ips),
  check = FALSE
)
#> Warning: Some expressions had a GC in every iteration; so filtering is disabled.
#> # A tibble: 7 x 6
#>   expression                                     min   median `itr/sec`
#>   <bch:expr>                                <bch:tm> <bch:tm>     <dbl>
#> 1 crm_locate(ips)                            271.1us  384.4us  2074.   
#> 2 lapply(ips, rIP::iphub_check)                3.48s    3.48s     0.287
#> 3 lapply(ips, ip2location::get_all)         101.02ms 111.72ms     9.04 
#> 4 rgeolocate::ip2location(ips, ip2location)  553.9us  747.1us  1213.   
#> 5 rgeolocate::maxmind(ips, maxmind)          384.3us  483.8us  1977.   
#> 6 lapply(ips, rgeolocate::ip_info)             1.81s    1.81s     0.551
#> 7 rgeolocate::ip_api(ips)                   586.66ms 586.66ms     1.70 
#> # ... with 2 more variables: mem_alloc <bch:byt>, `gc/sec` <dbl>
```

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
