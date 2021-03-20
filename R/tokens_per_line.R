tokens_per_line <- function( file )
{
  tokens <- sourcetools::tokenize_file(file)
  tokens <- tokens[ tokens$type != "whitespace",]
  tokens <- tokens[ tokens$type != "comment",]
  lines <- unique(tokens$row)

  n_token_line <- rep(0,length(lines))
  for( line in seq_along(lines) )
  {
    n_token_line[line] <- sum( tokens$row == lines[line] )
  }
  n_token_line[is.na(n_token_line)] <- 0

  return(n_token_line)
}

test_case <- "/home/jsco/Desktop/recovery/R/utils.R"

tokens_per_line(test_case) -> test_res
