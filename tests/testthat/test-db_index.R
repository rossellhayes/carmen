test_that("db_index() at boundaries", {
  expect_equal(
    db_index(
      c(0, 16777215, 16777216, 16777471, 16777472, 16778239),
      ip2location_lite_db1$ip_from
    ),
    c(1, 1, 2, 2, 3, 3)
  )
})
