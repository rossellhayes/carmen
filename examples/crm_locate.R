crm_locate("130.191.166.222")
crm_locate(c("130.191.166.222", "190.115.7.226", "201.248.64.43"))

library(dplyr)

tibble(
  id   = seq_len(100),
  name = generator::r_full_names(100),
  ip   = generator::r_ipv4_addresses(100)
) %>%
  mutate(crm_locate(ip))
