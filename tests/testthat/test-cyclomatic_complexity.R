test_that("Calculating the cyclomatic complexity works", {
  result <- cyclomatic_complexity("./test_file.R")

  expect_true(is.numeric(result))
  expect_equal( c(result, use.names = FALSE), 4 )
  expect_equal( names(result), "test_fun" )
})
