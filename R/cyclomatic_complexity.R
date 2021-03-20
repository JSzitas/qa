cyclomatic_complexity <- function( file )
{
  loaded_file <- readLines(file)

  custom_env <- new.env()
  eval( parse(text = loaded_file), envir = custom_env)

  function_indices <- names(sapply( custom_env, is.function ))
  funs <- as.list(custom_env)

  cyclocomps <- sapply( funs[function_indices],
                        function(i){
    cyclocomp::cyclocomp(expr = i)
  })
  names(cyclocomps) <- function_indices

  return(cyclocomps)
}

test_case <- "/home/jsco/Desktop/recovery/R/utils.R"

cyclomatic_complexity(test_case) -> test_res
