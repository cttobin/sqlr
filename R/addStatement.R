#' @description Add statement to current query.
#' @param query 
#' @param keyword
#' @param statement
addStatement <- function (query, keyword, statement) {
  confirmSqlr(query)
  query$statements[[keyword]] <- addClassName(statement, keyword, 'Statement')
  return (query)
}
