test_that("scalar ip to int", {
  expect_equal(crm_ip_to_int("130.191.166.222"), 2193598174)
})

test_that("vector ip to int", {
  expect_equal(crm_ip_to_int(c("0.0.0.0", "255.255.255.255")), c(0, 4294967295))
})
