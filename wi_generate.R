wi_generate <- function(model, test_data, name){
  predictor <- Predictor$new(model)
  pred  <- predict(model, test_data[,-1], type = "prob")
  index <- which(pred$X0 > 0.5)
  
  x_interest <- test_data[index,]
  predictor$predict(x_interest)
  
  wi_classif <- WhatIfClassif$new(predictor, n_counterfactuals = 10L) 
  eval         <- list()
  wi_cfactuals <- list()
  for(i in 1:dim(x_interest)[1]){
    set.seed(i)
    wi_cfactuals[[i]] <- wi_classif$find_counterfactuals(x_interest[i,], 
                                                         desired_class = "X1", 
                                                         desired_prob = c(0.5, 1))
    eval[[i]] <- wi_cfactuals[[i]]$evaluate()
    print(i)
  }
  
  wi_evals <- do.call(rbind, eval)
  #setwd("/cloud/project/eval_files")
  write.csv(wi_evals, paste0(name,".csv"), row.names = FALSE)
  #setwd("/cloud/project")
}

wi_generate(model = model,
             test_data = test_data,
             name = "wi_eval")

wi_generate(model = model_ros,
             test_data = test_data,
             name = "wi_ros_eval")

wi_generate(model = model_rus,
             test_data = test_data,
             name = "wi_rus_eval")

wi_generate(model = model_smo,
             test_data = test_data,
             name = "wi_smo_eval")

wi_generate(model = model_cse,
            test_data = test_data,
            name = "wi_cse_eval")

# tuned
wi_generate(model = tuned_model,
            test_data = test_data,
            name = "wi_tuned_eval")

wi_generate(model = tuned_model_ros,
            test_data = test_data,
            name = "wi_tuned_ros_eval")

wi_generate(model = tuned_model_rus,
            test_data = test_data,
            name = "wi_tuned_rus_eval")

wi_generate(model = tuned_model_smo,
            test_data = test_data,
            name = "wi_tuned_smo_eval")

wi_generate(model = tuned_model_cse,
            test_data = test_data,
            name = "wi_tuned_cse_eval")