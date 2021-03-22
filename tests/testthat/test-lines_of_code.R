test_that("Finding the number of lines of code works", {

  result <- lines_of_code("./test_file.R")
  expect_true(is.list(result))

  expect_equal(names(result), c("total","nonempty"))
  expect_equal(result[["total"]], 21)
  expect_equal(result[["nonempty"]], 18)

})
