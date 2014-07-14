context('Class names')

test_that('class names are created correctly', {
  
  expect_that(addClassName(list(), 'test'), is_a('sqlrTest'))
  expect_that(addClassName(list(), 'testCamelCase'), is_a('sqlrTestCamelCase'))
  
  expect_that(addClassName(list(), 'test', 'Prefix'), is_a('sqlrPrefixTest'))
  expect_that(addClassName(list(), 'testCamelCase', 'Prefix'), is_a('sqlrPrefixTestCamelCase'))
    
})
