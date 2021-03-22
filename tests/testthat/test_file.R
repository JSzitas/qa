#' test_file
#' @description Just a function for testing
#' @param a logical
#' @param b numeric
#' @param c numeric
#' @return a logical
#'

test_fun <- function( a = TRUE, b = 10, c = 3 )
{

  # really what is this

  if(a){
    for(i in 1:b)
    {
      print(i)
    }
  }
  return( (c*b >= b) == a)
}
