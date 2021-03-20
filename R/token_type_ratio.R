token_type_ratio <- function( file )
{
  tokens <- sourcetools::tokenize_file(file)
  tokens <- tokens[ tokens$type != "whitespace",]

  `%>%` <- magrittr::`%>%`
  unique_types <- tokens %>%
    dplyr::group_by(type) %>%
    dplyr::count() %>%
    dplyr::ungroup() %>%
    dplyr::mutate( rate = n/sum(n) ) %>%
    dplyr::select( type, rate )

  return(unique_types)
}

test_case <- "/home/jsco/Desktop/recovery/R/utils.R"

token_type_ratio(test_case) -> test_res
