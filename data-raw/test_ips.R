library(carmen)
library(generator)

test_ips <- r_ipv4_addresses(10000)
test_res <- crm_locate(test_ips)

usethis::use_data(test_ips, test_res, internal = TRUE, overwrite = TRUE)
