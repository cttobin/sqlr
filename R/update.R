update <- function (x, ...)
  UseMethod('update', x)

update.character <- function (...) { 
  createQuery('update', characterList(...)) 
}
