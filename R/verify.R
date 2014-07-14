verifyThat <- function (x, condition, error) {
  if (!condition(x))
    throwError(error)
}