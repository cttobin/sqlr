supplyMethods <- function (query) {
  
  query_methods <- sapply(query$methods, function (method_name) {
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




supplyMethods <- function (query) {
  
  query_methods <- sapply(query$methods, function (method_name) {
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