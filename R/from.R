# from <- function (x, continue = FALSE, ...)
#   UseMethod('from', x)
# 
# from.character <- function (...) {
#   as.character(list(...))
# }
# 
# from.sqlrQuery <- function (query, alias) {
#   
#   if (!is.null(alias) | !is.na(alias)) {
#     verifyThat(alias, is.character, 'alias must be a character.')
#     
#     if (length(alias) > 1L) {
#       throwWarning('alias should be of length one, taking only the first element.')
#       alias <- alias[1L]
#     }  
#   }
#   
#   list(query = query, alias = alias)
#   
# }
# 
# from_ <- function (x, ...) 
#   UseMethod('from_', ...)
# 
# from_.character <- function (x) x
# from_.factor <- function (x) as.character(x)
# from_.sqlrQuery <- function (x) 

from <- function (...) {
  list(...)
}
# 
# createStatement <- function (statement, subquery = FALSE) 
#   structure(list(statement = statement, subquery = subquery), class="sqlrStatement")