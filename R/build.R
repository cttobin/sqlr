#' @title Build SQL Query
#' @description Convert a sqlrQuery into a SQL statement.
#' @param query sqlrQuery object.
#' @param format how the SQL statement should be displayed.
#' @author Ciaran Tobin
#' @export
build <- function (query, format = 'compact', uppercase = TRUE) {
  confirmSqlr(query)
  printKeyword <- formatKeyword(uppercase)
  printStatement <- formatStatement(format)
  if (format == 'compact') {
    separator <- ' '
  } else {
    separator <- '\n'
  }
  paste0(sapply(query$statements, buildStatement, printKeyword, printStatement), collapse = separator)
}


#' @title Build SQL Query
#' @description Convert a sqlrQuery into a SQL statement.
#' @details Alias for sqlr::build().
#' @param query sqlrQuery object.
#' @param format how the SQL statement should be displayed.
#' @author Ciaran Tobin
#' @export
toCharacter <- build


#' @title Convert query to character string
#' @description Cast a sqlrQuery object to a character.
#' @param query sqlrQuery object.
#' @author Ciaran Tobin
#' @S3method as.character sqlrQuery
as.character.sqlrQuery <- function (query)
  build(query, 'compact')