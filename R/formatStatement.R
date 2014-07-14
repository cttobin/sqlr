formatStatement <- function (format) {
  function (statement) {
    if (format == 'compact') {
      multiline <- FALSE
    } else if (format == 'smart') {
      multiline <- length(statement) > 3L
    } else {
      multiline <- TRUE
    }
    sqlCommaList(statement, multiline)  
  }
}