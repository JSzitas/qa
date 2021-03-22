test_that("Halstead software measures are calculated correctly", {

  result <- halstead_measures("./test_file.R")
  expect_equal(result[["program_vocabulary"]], 26)
  expect_equal(result[["program_length"]], 50)
  expect_equal(result[["program_length_estimate"]], 97.21928, tolerance = 0.05)
  expect_equal(result[["program_volume"]], 235.022, tolerance = 0.05)
  expect_equal(result[["program_difficulty"]], 13.6, tolerance = 0.05)
  expect_equal(result[["program_effort"]], 3196.299, tolerance = 0.05)
  expect_equal(result[["time_to_program_minutes"]], 2.96, tolerance = 0.05)
  expect_equal(result[["number_of_bugs"]], 0.07834066, tolerance = 0.05)

})
