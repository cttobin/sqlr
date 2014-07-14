# 
# select_  <- function (x, ...) {
#   UseMethod('select_', x)  
# }
# 
# select_.character <- function (x, keyword, ...) {
#   createQuery(keyword, characterList(...))  
# }
# 
# 
# #' @title SQL Select
# #' @description Create SQL select statement.
# #' @author Ciaran Tobin
# #' @export
# select <- function (x, ...)
#   UseMethod('select', x)
# 
# select.character <- function (...) { 
#   createQuery('select', characterList(...))
# }
# 
# select.sqlrQuery <- function (x) {
#   
# }
# 
# select <- function (x, ...)
#   select_(x, keyword = 'select', ...)
# 
# selectDistinct <- function (x) {
#   createQuery('selectDistinct', characterList(...))
# }
# 

select <- function (...)
  createQuery('select', list(...))

selectDistinct <- function (...)
  createQuery('selectDistinct', list(...))

selectTop <- function (...)
  createQuery('selectTop', list(...))