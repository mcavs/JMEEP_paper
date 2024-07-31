nicesp_generate <- function(model, test_data, name){
  predictor <- Predictor$new(model)
  pred  <- predict(model, test_data[,-1], type = "prob")
  index <- which(pred$X0 > 0.5)
  
  x_interest <- test_data[index,]
  predictor$predict(x_interest)
  
  nice_classif <- NICEClassif$new(
    predictor,
    optimization = "sparsity", 
    x_nn_correct = FALSE,
    return_multiple = TRUE,
    finish_early = TRUE,
    distance_function = "gower")
  eval           <- list()
  nice_cfactuals <- list()
  for(i in 1:dim(x_interest)[1]){
    set.seed(i)
    nice_cfactuals[[i]] <- nice_classif$find_counterfactuals(x_interest[i,], 
                                                             desired_class = "X1", 
                                                             desired_prob = c(0.5, 1))
    eval[[i]] <- nice_cfactuals[[i]]$evaluate()
    print(i)
  }
  nice_sp_evals <- do.call(rbind, eval)
  #setwd("/cloud/project/eval_files")
  write.csv(nice_sp_evals, paste0(name,".csv"), row.names = FALSE)
  #setwd("/cloud/project")
}

nicesp_generate(model = model,
                test_data = test_data,
                name = "nicesp_eval")

nicesp_generate(model = model_ros,
                test_data = test_data,
                name = "nicesp_ros_eval")

nicesp_generate(model = model_rus,
                test_data = test_data,
                name = "nicesp_rus_eval")

nicesp_generate(model = model_smo,
                test_data = test_data,
                name = "nicesp_smo_eval")

nicesp_generate(model = model_cse,
                test_data = test_data,
                name = "nicesp_cse_eval")

# tuned
nicesp_generate(model = tuned_model,
                test_data = test_data,
                name = "nicesp_tuned_eval")

nicesp_generate(model = tuned_model_ros,
                test_data = test_data,
                name = "nicesp_tuned_ros_eval")

nicesp_generate(model = tuned_model_rus,
                test_data = test_data,
                name = "nicesp_tuned_rus_eval")

nicesp_generate(model = tuned_model_smo,
                test_data = test_data,
                name = "nicesp_tuned_smo_eval")

nicesp_generate(model = tuned_model_cse,
                test_data = test_data,
                name = "nicesp_tuned_cse_eval")