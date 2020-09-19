library(readr)
library(tibble)

test_db <- tibble(
  ip_from      = c(0,          2147483648),
  ip_to        = c(2147483647, 4294967295),
  country_code = c("LO", "HI")
)

write_csv(test_db, "inst/extdata/test_db.csv", col_names = FALSE)
