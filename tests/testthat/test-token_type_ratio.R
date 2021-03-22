test_that("Calculating the ratio of tokens works", {
  result <- token_type_ratio("./test_file.R")

  expect_equal(length(result), 7)
  expect_equal(
    result,
    c(
      bracket = 0.310344827586207,
      comma = 0.0344827586206897,
      comment = 0.137931034482759,
      keyword = 0.0862068965517241,
      number = 0.0517241379310345,
      operator = 0.137931034482759,
      symbol = 0.241379310344828
    )
  )
})
