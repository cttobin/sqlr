print.sqlrQuery <- function (query) {
  statements <- query$statements
  writeLines(build(query, 'smart'))
}
