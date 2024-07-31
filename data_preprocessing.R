data <- dataset |> 
  select(code_presentation, final_result, contains("week")) |>
  select(1:44)
  
  data$final_result   <- ifelse(data$final_result == "Pass", "X1", "X0")
  data$final_result   <- as.factor(data$final_result)
  colnames(data)[3:6] <- c("week_minus4", 
                           "week_minus3", 
                           "week_minus2", 
                           "week_minus1")
  data <- data[,-3]
  
