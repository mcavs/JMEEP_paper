########################################################################################
set.seed(123)
tuned_model     <- train(final_result ~.,
                         data      = train_data, 
                         method    = "ranger",
                         trControl = trainControl(classProbs = TRUE,
                                                  method     = "repeatedcv",
                                                  number     = 10,
                                                  repeats    = 10))

preds            <- predict(tuned_model$finalModel, test_data)
pred_labels      <- as.factor(ifelse(preds$predictions[, 1] > 0.5, "X0", "X1"))   
conf_matrix      <- confusionMatrix(data = pred_labels, reference = test_data$final_result)
conf_matrix$overall["Accuracy"]

sensitivity      <- as.numeric(conf_matrix$byClass["Sensitivity"])
pos_pred_value   <- as.numeric(conf_matrix$byClass["Pos Pred Value"])
2 * (sensitivity * pos_pred_value) / (sensitivity + pos_pred_value)

test_predictions <- preds$predictions[,1]
roc_curve        <- roc(test_data$final_result, test_predictions)
auc(roc_curve)
########################################################################################
set.seed(123)
tuned_model_ros <- train(final_result ~.,
                         data      = train_data_ros, 
                         method    = "ranger",
                         trControl = trainControl(classProbs = TRUE,
                                                  method     = "repeatedcv",
                                                  number     = 10,
                                                  repeats    = 10))

preds            <- predict(tuned_model_ros$finalModel, test_data)
pred_labels      <- as.factor(ifelse(preds$predictions[, 1] > 0.5, "X0", "X1"))   
conf_matrix      <- confusionMatrix(data = pred_labels, reference = test_data$final_result)
conf_matrix$overall["Accuracy"]

sensitivity      <- as.numeric(conf_matrix$byClass["Sensitivity"])
pos_pred_value   <- as.numeric(conf_matrix$byClass["Pos Pred Value"])
2 * (sensitivity * pos_pred_value) / (sensitivity + pos_pred_value)

test_predictions <- preds$predictions[,1]
roc_curve        <- roc(test_data$final_result, test_predictions)
auc(roc_curve)
########################################################################################
set.seed(123)
tuned_model_rus <- train(final_result ~.,
                         data      = train_data_rus, 
                         method    = "ranger",
                         trControl = trainControl(classProbs = TRUE,
                                                  method     = "repeatedcv",
                                                  number     = 10,
                                                  repeats    = 10))

preds            <- predict(tuned_model_rus$finalModel, test_data)
pred_labels      <- as.factor(ifelse(preds$predictions[, 1] > 0.5, "X0", "X1"))   
conf_matrix      <- confusionMatrix(data = pred_labels, reference = test_data$final_result)
conf_matrix$overall["Accuracy"]

sensitivity      <- as.numeric(conf_matrix$byClass["Sensitivity"])
pos_pred_value   <- as.numeric(conf_matrix$byClass["Pos Pred Value"])
2 * (sensitivity * pos_pred_value) / (sensitivity + pos_pred_value)

test_predictions <- preds$predictions[,1]
roc_curve        <- roc(test_data$final_result, test_predictions)
auc(roc_curve)
########################################################################################
set.seed(123)
tuned_model_smo <- train(final_result ~.,
                         data      = train_data_smo, 
                         method    = "ranger",
                         trControl = trainControl(classProbs = TRUE,
                                                  method     = "repeatedcv",
                                                  number     = 10,
                                                  repeats    = 10))

preds            <- predict(tuned_model_smo$finalModel, test_data)
pred_labels      <- as.factor(ifelse(preds$predictions[, 1] > 0.5, "X0", "X1"))   
conf_matrix      <- confusionMatrix(data = pred_labels, reference = test_data$final_result)
conf_matrix$overall["Accuracy"]

sensitivity      <- as.numeric(conf_matrix$byClass["Sensitivity"])
pos_pred_value   <- as.numeric(conf_matrix$byClass["Pos Pred Value"])
2 * (sensitivity * pos_pred_value) / (sensitivity + pos_pred_value)

test_predictions <- preds$predictions[,1]
roc_curve        <- roc(test_data$final_result, test_predictions)
auc(roc_curve)
########################################################################################
set.seed(123)
we <- as.numeric(table(train_data$final_result)[2] / table(train_data$final_result)[1])
tuned_model_cse <- train(final_result ~.,
                         data      = train_data, 
                         method    = "ranger",
                         weights   = ifelse(train_data$final_result == "X0", we, 1),
                         trControl = trainControl(classProbs = TRUE,
                                                  method     = "repeatedcv",
                                                  number     = 10,
                                                  repeats    = 10))

preds            <- predict(tuned_model_cse$finalModel, test_data)
pred_labels      <- as.factor(ifelse(preds$predictions[, 1] > 0.5, "X0", "X1"))   
conf_matrix      <- confusionMatrix(data = pred_labels, reference = test_data$final_result)
conf_matrix$overall["Accuracy"]

sensitivity      <- as.numeric(conf_matrix$byClass["Sensitivity"])
pos_pred_value   <- as.numeric(conf_matrix$byClass["Pos Pred Value"])
2 * (sensitivity * pos_pred_value) / (sensitivity + pos_pred_value)

test_predictions <- preds$predictions[,1]
roc_curve        <- roc(test_data$final_result, test_predictions)
auc(roc_curve)