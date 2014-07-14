buildStatement <- function (x, ...) UseMethod('buildStatement', x)

buildStatement.sqlrStatementSelect <- function (x, printKeyword, printStatement) {  
  paste0(printKeyword('select'), printStatement(x))  
}

buildStatement.sqlrStatementSelectDistinct <- function (x, printKeyword, printStatement) {  
  paste0(printKeyword('select distinct'), printStatement(x))  
}


buildStatement.sqlrStatementDeleteFrom <- function (x, printKeyword, printStatement) {
  paste0(printKeyword('delete from'), printStatement(x))  
}

buildStatement.sqlrStatementUpdate <- function (x, printKeyword, printStatement) {  
  paste0(printKeyword('update'), printStatement(x))  
}

buildFrom <- function (x, ...) 
  UseMethod('buildFrom', x)

buildFrom.sqlrQuery <- function (x, printKeyword, printStatement) 
  sprintf('(%s)', build(x))

buildFrom.character <- function (x, printKeyword, printStatement) 
  printStatement(x)

buildStatement.sqlrStatementFrom <- function (x, printKeyword, printStatement) {
  
  start <- printKeyword('from')
  statements <- paste(sapply(x, buildFrom, printKeyword, printStatement), collapse = ', ')
  paste0(start, statements)
  
}


buildStatement.sqlrStatementWhere <- function (x, printKeyword, printStatement) {
  sprintf('%s%s', printKeyword('where'), x)
}

buildStatement.sqlrStatementGroupBy <- function (x, printKeyword, printStatement) {
  paste0('GROUP BY ', sqlCommaList(x))
}

buildStatement.sqlrStatementOrderBy <- function (x, printKeyword, printStatement) {
  paste0('ORDER BY ', sqlCommaList(x))
}

buildStatement.sqlrStatementLimit <- function (x, printKeyword, printStatement) {
  paste0('LIMIT ', x)
}

