test_db_ip_from <- read.csv(
  system.file("extdata", "test_db.csv", package = "carmen"),
  header = FALSE, stringsAsFactors = FALSE
)[, 1]

test_that("db_index() at boundaries", {
  expect_equal(
    db_index(
      c(0, 16777215, 16777216, 16777471, 16777472, 16778239),
      ip2location_lite_db1$ip_from
    ),
    c(1, 1, 2, 2, 3, 3)
  )

  expect_equal(
    db_index(
      c(0, 1, 2147483647, 2147483648, 4294967294, 4294967295),
      test_db_ip_from
    ),
    c(1, 2, 2, 3, 3, 4)
  )
})

test_that("single_db_index() at boundaries", {
  expect_equal(single_db_index(0,        ip2location_lite_db1$ip_from), 1)
  expect_equal(single_db_index(16777215, ip2location_lite_db1$ip_from), 1)
  expect_equal(single_db_index(16777216, ip2location_lite_db1$ip_from), 2)
  expect_equal(single_db_index(16777471, ip2location_lite_db1$ip_from), 2)
  expect_equal(single_db_index(16777472, ip2location_lite_db1$ip_from), 3)
  expect_equal(single_db_index(16778239, ip2location_lite_db1$ip_from), 3)
})
