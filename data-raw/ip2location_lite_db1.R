library(readr)

ip2location_lite_db1 <- read_csv(
  "data-raw/IP2LOCATION-LITE-DB1.CSV",
  col_names = c("ip_from", "ip_to", "country_code", "country_name")
)

usethis::use_data(ip2location_lite_db1, overwrite = TRUE)
