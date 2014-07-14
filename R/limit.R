#' @title SQL Limit
#' @param n how many rows that should be returned.
#' @author Ciaran Tobin
#' @export
limit <- function (n) {
  verifyThat(n, is.numeric, 'n must be numeric in limit statement.')
  n
}