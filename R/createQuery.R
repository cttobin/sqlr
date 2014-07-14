createQuery <- function (keyword, statement) {
  
  query <- structure(c(statements = list(setNames(list(addClassName(statement, keyword, 'Statement')), keyword)), base = keyword)) 
  class_name <- paste0('sqlr', toupper(substring(keyword, 1, 1)), substring(keyword, 2, nchar(keyword)))
  class(query) <- c('sqlrQuery', class_name)
  
  query_methods <- sapply(keywords[[keyword]]$methods, function (method_name) {
    f <- get(method_name)
    force(query)
    force(f)
    function (...)       
      f(query, ...)
  })
  
  query$methods <- names(query_methods)
  
  for (m in names(query_methods))
    query[[m]] <- query_methods[[m]]
  
  return (query)
}





createQuery <- function (keyword, statement) {
  
  query <- structure(c(statements = list(setNames(list(addClassName(statement, keyword, 'Statement')), keyword)), base = keyword)) 
  class_name <- paste0('sqlr', toupper(substring(keyword, 1, 1)), substring(keyword, 2, nchar(keyword)))
  class(query) <- c('sqlrQuery', class_name)
  
  query_methods <- sapply(keywords[[keyword]]$methods, function (method_name) {
    force(method_name)
    f <- match.fun(method_name)
    force(f)
    force(query)
    function (...)       
      supplyMethods(addStatement(query, method_name, f(...)))
  })
  
  query$methods <- names(query_methods)
  
  for (m in names(query_methods))
    query[[m]] <- query_methods[[m]]
  
  return (query)
}