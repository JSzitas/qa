test_that("Software maintainability index (MI) calculation works", {

  result <- software_maintainability("./test_file.R")

  expect_true(is.numeric(result))
  expect_equal( result, 112.9317, tolerance = 0.005 )
})
