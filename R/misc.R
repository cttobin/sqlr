
print.toberQuery <- function (x) writeLines(x$query)
print.sqlrColumn <- function (x) writeLines(x$query)
# 
# 
# column <- function (...) {
#   query <- paste0(list(...), collapse='.')
#   result <- list(
#     as = function (x) alias(query, x),
#     
#     equal = function (x) sprintf('%s = %s', query, x),
#     notEqual = function (x) sprintf('%s <> %s', query, x),
#     
#     like = function (x) {},
#     notLike = function (x) {},
#     
#     in = function (x) {},
#     notIn = function (x) {},
#     
#     greaterThan = function (x) sprintf('%s > %s', query, x),
#     lessThan = function (x) sprintf('%s < %s', query, x),
#     greaterThanOrEqual = function (x) sprintf('%s >= %s', query, x),
#     lessThanOrEqual = function (x) sprintf('%s <= %s', query, x),
#     
#     notGreaterThan = function (x) {},
#     notLessThan = function (x) {},
#     notGreaterThanOrEqual = function (x) {},
#     notLessThanOrEqual = function (x) {},
#     
#     between = function (lower, upper, bounds = 'both') sqlBetween(query, lower, upper, FALSE, bounds),
#     notBetween = function (lower, upper, bounds = 'neither') sqlBetween(query, lower, upper, TRUE, bounds),
#     
#     isNull = function () sprintf('%s IS NULL', query),
#     isNotNull = function () sprintf('%s IS NOT NULL', query),
#     
#     query = query
#   )
#   class(result) <- 'sqlrColumn'
#   return (result)  
# }

sqlBetween <- function (x, lower, upper, reverse = FALSE, bounds = 'both') {
  
  checkArgument(bounds, c('both', 'lower', 'upper', 'neither'))
  
  if (bounds == 'both') {
    lt_sign <- '<='
    gt_sign <- '>='
  } else if (bounds == 'lower') {
    lt_sign <- '<='
    gt_sign <- '>'
  } else if (bounds == 'upper') {
    lt_sign <- '<'
    gt_sign <- '>='
  } else {
    lt_sign <- '<'
    gt_sign <- '>'
  }
  
  if (reverse) {
    return (paste(x, lt_sign, lower, 'AND', x, gt_sign, upper))
  } else {
    return (paste(x, gt_sign, lower, 'AND', x, lt_sign, upper))
  }
  
}

displayList <- function(x, last = 'and') {
  n <- length(x)
  if (n == 1) return (x)
  else return (paste(paste(head(x, -1), collapse = ', '), last, x[n]))
} 

checkArgument <- function (x, allowed) {
  if (!x %in% allowed) 
    throwError(substitute(x), ' must be one of ', displayList(allowed, 'or'), '.')    
}

throwError <- function (...) {
  stop(as.character(list(...)), call. = FALSE)
}

alias <- function (name, alias) sprintf('%s AS %s', name, alias)

keywords <- list(
  select = list(
    methods = c('from',  'leftJoin','where', 'limit', 'orderBy', 'groupBy', 'execute'),
    required = c('from')
  ),
  deleteFrom = list(
    methods = c('where', '')
  ),
  update = list(
    methods = c('set', 'where')
  )
)

checkMandatory <- function (x) 
  UseMethod('checkMandatory', x)

checkMandatory.sqlrSelect <- function (x)
  confirmQueryHas(x, c('select', 'from'))

confirmQueryHas <- function (query, requirements) {
  missing <- sapply(query[requirements], is.null)
  if (any(missing))
    stop('The query is missing some required statements.', call. = FALSE)
}



characterList <- function (...)
  as.character(list(...))



commaList <- function (...)
  paste(list(...), collapse = ', ')


confirmSqlr <- function (x)
  if (!inherits(x, 'sqlrQuery'))  
    throwError(substitute(x), ' is not a sqlrQuery object.')

transformKeyword <- function (keyword) {
  
}



continueQuery <- function (query) {
  c(query, supplyMethods(query))
}

# supplyMethods <- function (query) {
#   sapply(keywords[[query$base]]$methods, function (method_name) {
#     f <- get(method_name)
#     force(query)
#     function (...) 
#       f(query, ...)
#   })
# }





sqlCommaList <- function (x, multiline = TRUE) {
  separator <- ifelse(multiline, '\n, ', ', ')
  paste0(x, collapse = separator)
}
