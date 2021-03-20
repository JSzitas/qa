lines_of_code <- function( file )
{
  loaded_file <- readLines(file)

  return( list( total = length(loaded_file),
                nonempty = length(loaded_file) - sum( loaded_file == "" ))
          )
}

test_case <- "/home/jsco/Desktop/recovery/R/utils.R"

lines_of_code(test_case) -> test_res
