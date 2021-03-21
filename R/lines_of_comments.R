#' Lines of comments for a file
#' @description Calculate the total lines of comments for a file
#' @param file The file to calculate for - a file-path.
#'
#' @return The list with two entries - the documentation comments, and the actual
#' comments.
#' @export
lines_of_comments <- function( file )
{
  tokens <- sourcetools::tokenize_file(file)
  tokens <- tokens[ tokens$type == "comment","value"]

  return( list(
    documentation = length( grep( pattern = "^#'", x = tokens) ),
    comments = length( grep( pattern = "^#'", x = tokens, invert = TRUE) )
  ))
}
