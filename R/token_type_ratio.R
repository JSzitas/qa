#' Token type ratio
#'
#' @description Calculate the ratio of tokens present in a file
#' @param file The file to calculate for - a file-path.
#'
#' @return The ratio of tokens present in the file (normalised so all tokens
#' together sum to 1).
#' @export
token_type_ratio <- function( file )
{
  tokens <- sourcetools::tokenize_file(file)
  tokens <- tokens[ tokens$type != "whitespace",]

  unique_types <- split(tokens, tokens$type)
  unique_types <- sapply( unique_types, nrow )
  unique_types <- unique_types/sum(unique_types)

  return(unique_types)
}
