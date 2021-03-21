#' Calculate tokens pers line
#'
#' @description Calculate the number of tokens per line for a file
#' @param file The file to calculate for - a file-path.
#'
#' @return The number of tokens per line for the entire file.
#' @export
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
