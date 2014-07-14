
#' @title SQL Set Statement
#' @description Update table and set columns to specific values. Values supplied must be named.
#' @details Character values will be surrounded with quotes. NAs will be converted to the string 'NULL' for SQL compatability.
#' @author Ciaran Tobin
#' @param ... Named values to insert.
#' @export 
set <- function (...) {
  x <- list(...)
  verifyThat(x, hasNames, 'Everything that you provide to set() must be given a name.')
  x <- lapply(x, convertValue)
  mapply(function (name, value) sprintf('%s = %s', name, value), names(x), x, USE.NAMES = FALSE)
}

#' @title Convert R Value to SQL
#' @description Convert values to appropriate SQL values that can be inserted in a query. 
#'              The conversion function is generated here and passed to another function
#'              to perform it on all non-NA values.
#' @param       Value(s) to convert.
convertValue <- function (x) 
  UseMethod('convertValue', x)

convertValue.character <- function (x) 
  performValueConversion(x, function (x) paste0("'", x, "'"))
  
convertValue.factor <- function (x) 
  convertValue(as.character(x))

convertValue.default <- function (x) 
  performValueConversion(x, function (x) x)

#' @title Convert R Value to SQL
#' @description Convert values to appropriate SQL values that can be inserted in a query. 
#'              This includes quoting characters and converting NA to NULL.
#' @param x           Value(s) to convert.
#' @param converter   Function to convert each non-NA value.
performValueConversion <- function (x, converter) {
  na_values <- is.na(x)
  x[na_values] <- 'NULL'
  x[!na_values] <- converter(x[!na_values])
  x
}
