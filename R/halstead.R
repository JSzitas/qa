halstead_measures <- function(file)
{
  tokens <- sourcetools::tokenize_file(file)

  tokens <- tokens[ !(tokens$type %in% c("whitespace","comment")),]
  tokens[ tokens$type %in% c("keyword","bracket","comma"), "type" ] <- "operator"
  tokens[ tokens$type %in% c("symbol","number","string"), "type" ] <- "operand"

  operators <- tokens[ tokens$type == "operator", "value"]
  operands <- tokens[ tokens$type == "operand", "value"]

  eta_1 <- length( unique( operators ))
  eta_2<- length( unique( operands ))

  N_1 <- length(operators)
  N_2 <- length(operands)

  result <- list()
  result[["program_vocabulary"]] <- eta_1 + eta_2
  result[["program_length"]] <- N_1 + N_2
  result[["program_length_estimate"]] <- (eta_1 * log2(eta_1)) + (eta_2 * log2(eta_2))
  result[["program_volume"]] <- result[["program_length"]] * log2(result[["program_vocabulary"]])
  result[["program_difficulty"]] <- (eta_1/2) * (N_2/eta_2)
  result[["program_effort"]] <- result[["program_difficulty"]] * result[["program_volume"]]
  result[["time_to_program_minutes"]] <- round( result[["program_effort"]]/18/60, 2)
  result[["number_of_bugs"]] <- result[["program_volume"]]/3000

  return(result)
}


test_case <- "/home/jsco/Desktop/recovery/R/utils.R"

halstead_measures(test_case) -> test_result
