lines_of_comments <- function( file )
{
  tokens <- sourcetools::tokenize_file(file)
  tokens <- tokens[ tokens$type == "comment","value"]

  return( list(
    documentation = length( grep( pattern = "^#'", x = tokens) ),
    comments = length( grep( pattern = "^#'", x = tokens, invert = TRUE) )
  ))
}

test_case <- "/home/jsco/Desktop/recovery/R/recover.R"

lines_of_comments(test_case) -> test_res
