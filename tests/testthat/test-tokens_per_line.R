test_that("Counting tokens per line works", {

  result <- tokens_per_line("./test_file.R")
  expect_true(is.numeric(result))
  expect_equal( length(result), 10)
  expect_equal( result, c(16,1,5,8,1,4,1,1,12,1))

})
