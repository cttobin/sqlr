execute <- function (query, into, argument = NULL, ...) {
  confirmSqlr(query)
  if (!is.function(into))
    throwError('You must provide a function.')
  query_text <- build(query, FALSE)
  if (is.null(argument)) {
    into(query_text)
  } else {
    arguments <- c(setNames(list(query_text), argument), ...)
    do.call(into, arguments)
  }
}
