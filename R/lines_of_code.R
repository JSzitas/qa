#' LOC calculator
#'
#' @description Calculate the lines of code in a file
#' @param file The file to calculate for - a file-path.
#'
#' @return The list with two entries - the total and the non-empty lines of code.
#' @export
lines_of_code <- function( file )
{
  loaded_file <- readLines(file)

  return( list( total = length(loaded_file),
                nonempty = length(loaded_file) - sum( loaded_file == "" ))
          )
}
