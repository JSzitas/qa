#' Calculate software maintainability
#'
#' @description Calculate the software maintainability index for a given file
#' @param file The file to calculate for - a file-path.
#'
#' @return The maintainability index (a number).
#' @export
software_maintainability <- function( file )
{
  halstead_V <- halstead_measures(file)[["program_volume"]]

  ave_cyclocomp <- mean(cyclomatic_complexity(file))
  loc <- lines_of_code(file)[["nonempty"]]
  percent_comment <- lines_of_comments(file)[["comments"]]/loc

  maintainability <- 171 - 5.2*log(halstead_V)-0.23*ave_cyclocomp-16.2*log(loc)+50*sin(sqrt(2.46*percent_comment))

  return(maintainability)
}
