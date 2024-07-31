moc_generate <- function(model, test_data, name){
  
  predictor <- Predictor$new(model)
  pred  <- predict(model, test_data[,-1], type = "prob")
  index <- which(pred$X0 > 0.5)
  
  x_interest <- test_data[index,]
  predictor$predict(x_interest)
  
  moc_classif <- MOCClassif$new(
    predictor
  )

  eval          <- list()
  moc_cfactuals <- list()
  for(i in 1:dim(x_interest)[1]){
    set.seed(i)
    moc_cfactuals[[i]] <- moc_classif$find_counterfactuals(x_interest[i,], 
                                                           desired_class = "X1", 
                                                           desired_prob = c(0.5, 1))
    eval[[i]] <- moc_cfactuals[[i]]$evaluate()
    print(i)
    #i <- i + 1 
  }
  
  moc_evals <- do.call(rbind, eval)
  #setwd("project/eval_files_AAA")
  write.csv(moc_evals, paste0(name,".csv"), row.names = FALSE)
  #setwd("/cloud/project")
}

moc_generate(model = tuned_model_rus,
             test_data = test_data,
             name = "tuned_moc_rus_eval")