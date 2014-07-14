
addClassName <- function (x, keyword, prefix = NULL) {
  full_prefix <- 'sqlr'
  if (!is.null(prefix)) {
    full_prefix <- paste0(full_prefix, prefix)
  }
  class_name <- paste0(full_prefix, toupper(substring(keyword, 1, 1)), substring(keyword, 2, nchar(keyword)))
  class(x) <- class_name
  return (x)
}