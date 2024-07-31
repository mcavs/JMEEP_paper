IR = 1
balance <- function(data, method = "ros", IR = 1, seed = TRUE) {
  if(seed == TRUE){set.seed(123)}   
  if(method == "ros"){
    return(ROSE::ovun.sample(final_result~., data = data, method = "over", p = (1 / (IR + 1)))$data)
  } else if (method == "rus"){
    return(ROSE::ovun.sample(final_result~., data = data, method = "under", p = (1 / (IR + 1)))$data)
  } else if (method == "SMOTE"){
    if(anyNA(data)){data <- na.omit(data)}
    return(themis::smote(data, "final_result", over_ratio = (1 / IR)))
  } else if (method == "Near miss"){
    if(anyNA(data)){data <- na.omit(data)}
    return(themis::nearmiss(data, "final_result", under_ratio = IR))
  } else {  # original data
    return(data)
  }
}

train_data_ros <- balance(train_data, method = "ros")
train_data_rus <- balance(train_data, method = "rus")
train_data_nea <- balance(train_data, method = "Near miss")
train_data_smo <- balance(train_data, method = "SMOTE")

if(levels(train_data_ros$final_result)[1] == "X1"){
  train_data_ros$final_result <- relevel(train_data_ros$final_result, "X0")
}
if(levels(train_data_rus$final_result)[1] == "X1"){
  train_data_rus$final_result <- relevel(train_data_rus$final_result, "X0")
}  
  
  
