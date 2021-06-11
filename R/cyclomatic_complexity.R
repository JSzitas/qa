#' Calculate the cyclomatic complexity
#' @description Calculate the cyclomatic complexity for each function in a file
#' @param file The file to calculate for - a file-path.
#'
#' @return The cyclomatic complexity for each function in a file.
#' @export
cyclomatic_complexity <- function( file )
{
  code <- readLines(file)

  custom_env <- new.env()
  eval( parse(text = code), envir = custom_env)

  custom_env <- as.list(custom_env, all.names = TRUE)

  fun_indices <- names( sapply( custom_env, is.function ))

  funs <- custom_env[fun_indices]
  cyclocomps <- sapply( funs,
                        function(i){
                          cyclocomp::cyclocomp(expr = i)
                        })
  names(cyclocomps) <- fun_indices

  return(cyclocomps)
}
