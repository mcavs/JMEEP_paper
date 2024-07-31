train_data <- data |> 
  filter(code_presentation == "2013J") |>
  select(-code_presentation)
test_data  <- data |> 
  filter(code_presentation == "2014J") |>
  select(-code_presentation)
