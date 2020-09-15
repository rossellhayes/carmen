#' Convert a character vector of IP addresses to integers
#'
#' Note: integer IP addresses are stored as a [double] vector to prevent
#' integer overflows.
#'
#' @param ip A character vector of IP addresses (e.g. `"130.191.166.222"`).
#'
#' @return A [numeric] vector of integer IP addresses.
#' @family carmen
#' @export
#' @examples
#' crm_ip_to_int("130.191.166.222")
#' crm_ip_to_int(generator::r_ipv4_addresses(100))

crm_ip_to_int <- function(ip) {
  stopifnot(is.character(ip))

  ip_list <- strsplit(ip, "\\.")

  stopifnot(all(lengths(ip_list) == 4))

  ip_list <- matrix(as.numeric(unlist(ip_list)), ncol = length(ip))
  ip_list <- ip_list * rep(c(256^3, 256^2, 256, 1), length(ip))
  colSums(ip_list)
}
