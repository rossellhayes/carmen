#' Clear the carmen database cache
#'
#' @return Nothing.
#' @family carmen
#' @export

crm_clear_cache <- function() {rm(list = ls(db_cache), pos = db_cache)}
