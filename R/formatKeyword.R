formatKeyword <- function (uppercase) {
  function (keyword) {
    keyword <- paste0(keyword, ' ')
    ifelse(uppercase, toupper(keyword), tolower(keyword))
  }
}