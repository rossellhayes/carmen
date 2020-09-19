library(readr)
library(tibble)

test_db <- tibble(
  ip_from      = c(0, 1,          2147483648, 4294967295),
  ip_to        = c(0, 2147483647, 4294967294, 4294967295),
  country_code = c("MN", "LO", "HI", "MX")
)

write_csv(test_db, "inst/extdata/test_db.csv", col_names = FALSE)
