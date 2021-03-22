test_that("Calculating the lines of comments and documentation works", {

  lines_of_comments("./test_file.R")

  result <- lines_of_comments("./test_file.R")
  expect_true(is.list(result))

  expect_equal(names(result), c("documentation","comments"))
  expect_equal(result[["documentation"]], 7)
  expect_equal(result[["comments"]], 1)

})
