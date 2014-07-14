#' @title SQL Where Statement
#' @rdname where
#' @export where
where <- function (x, ...) 
  UseMethod('where', x)

#' @rdname where
#' @method where character
#' @S3method where character
where.character <- function (x, ...) {
  sprintf(x, ...)
}

# Where IN ??? 