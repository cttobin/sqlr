deleteFrom <- function (x, ...)
  UseMethod('deleteFrom', x)

deleteFrom.character <- function (...) { 
  createQuery('deleteFrom', characterList(...)) 
}
