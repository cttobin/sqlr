leftJoin <- function (table, first, second) {
  list(table = table, first = first, second = second)
}

rightJoin <- function (table, first, second) {
  list(table = table, first = first, second = second)
}

joinBuilder <- function (type) 
  function (x, printKeyword, printStatement) 
    sprintf('%s %s ON %s = %s', printKeyword(type), x$table, x$first, x$second)
  

# buildStatement.sqlrStatementRightJoin <- function (x, printKeyword, printStatement) {
#   sprintf('LEFT JOIN %s ON %s = %s', x$table, x$first, x$second)
# }
# 
# buildStatement.sqlrStatementLeftJoin <- function (x, printKeyword, printStatement) {
#   sprintf('LEFT JOIN %s ON %s = %s', x$table, x$first, x$second)
# }


buildStatement.sqlrStatementLeftJoin <- joinBuilder('left join')
buildStatement.sqlrStatementRightJoin <- joinBuilder('right join')
buildStatement.sqlrStatementRightJoin <- joinBuilder('join')