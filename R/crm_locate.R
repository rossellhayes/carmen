#' Where in the world is this IP address?
#'
#' @param ip A vector of IP addresses. Either [character]
#'   (e.g. `"130.191.166.222"`) or [numeric] (e.g. `2193598174`).
#' @param database A database of IP address locations from
#'   [IP2Location](https://ip2location.com/).
#'   Either a [data.frame] or the path to a `.csv` file.
#' @param cache If `TRUE`, the data in `database` will be cached for this
#'   session, improving the speed of subsequent lookups.
#'
#' @return A [data.frame] with a row of location information for each element
#'   of `ip`.
#' @source This site or product includes IP2Location LITE data available from
#'   [https://lite.ip2location.com].
#' @family carmen
#'
#' @export
#' @example examples/crm_locate.R

crm_locate <- function(ip, database = ip2location_lite_db1, cache = TRUE) {
  if (database == "") {stop("Invalid database path specified.")}

  if (is.character(database)) {
    if (cache && database %in% names(db_cache)) {
      db <- db_cache[[database]]
    } else {
      db <- read.csv(database, header = FALSE, stringsAsFactors = FALSE)

      names(db) <- c(
        "ip_from", "ip_to", "country_code", "country_name", "region_name",
        "city_name", "latitude", "longitude", "zip_code", "time_zone"
      )[seq_along(db)]

      if (cache) {db_cache[[database]] <- db}
    }
  }

  if (is.character(ip)) {ip <- crm_ip_to_int(ip)}
  index <- db_index(ip, db$ip_from)

  db[index, 3:ncol(db)]
}

db_cache <- new.env()
