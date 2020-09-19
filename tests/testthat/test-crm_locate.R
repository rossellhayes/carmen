test_that("scalar crm_locate()", {
  expect_equivalent(
    crm_locate("130.191.166.222"),
    dplyr::tibble(
      country_code = "US", country_name = "United States of America"
    )
  )
})

test_that("vector crm_locate()", {
  expect_equivalent(
    crm_locate(c("130.191.166.222", "190.115.7.226", "201.248.64.43")),
    dplyr::tibble(
      country_code = c("US", "GT", "VE"),
      country_name = c(
        "United States of America",
        "Guatemala",
        "Venezuela (Bolivarian Republic of)"
      )
    )
  )

  expect_equal(crm_locate(test_ips), test_res)
})

test_that("external db", {
  expect_equal(ls(db_cache), character(0))

  expect_equivalent(
    crm_locate(
      "130.191.166.222",
      system.file("extdata", "test_db.csv", package = "carmen")
    ),
    dplyr::tibble(country_code = "HI")
  )

  expect_equal(
    ls(db_cache), system.file("extdata", "test_db.csv", package = "carmen")
  )

  expect_equivalent(
    crm_locate(
      c("0.0.0.0", "1.1.1.1", "128.128.128.128", "255.255.255.255"),
      system.file("extdata", "test_db.csv", package = "carmen")
    ),
    dplyr::tibble(country_code = c("MN", "LO", "HI", "MX"))
  )

  crm_clear_cache()

  expect_equal(ls(db_cache), character(0))
})

test_that("crm_locate() errors", {
  expect_error(crm_locate("130.191.166.222", 1))
})

