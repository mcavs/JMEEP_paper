########################################################################################
set.seed(123)
model     <- train(final_result ~.,
                   data      = train_data, 
                   method    = "ranger",
                   trControl = trainControl(classProbs = TRUE))

pred_labels      <- predict(model, test_data)
confusionMatrix(data = pred_labels, reference = test_data$final_result)

test_predictions <- predict(model, newdata = test_data, type = "prob")
roc_curve        <- roc(test_data$final_result, test_predictions[,2])
auc(roc_curve)
########################################################################################
set.seed(123)
we <- as.numeric(table(train_data$final_result)[2] / table(train_data$final_result)[1])
model_cse <- train(final_result ~.,
                   data      = train_data, 
                   method    = "ranger",
                   weights   = ifelse(train_data$final_result == "X0", we, 1),
                   trControl = trainControl(classProbs = TRUE))

pred_labels <- predict(model_cse, test_data)
confusionMatrix(data = pred_labels, reference = test_data$final_result)

test_predictions <- predict(model_cse, newdata = test_data, type = "prob")
roc_curve        <- roc(test_data$final_result, test_predictions[,2])
auc(roc_curve)
########################################################################################
set.seed(123)
model_ros <- train(final_result ~.,
                   data      = train_data_ros, 
                   method    = "ranger",
                   trControl = trainControl(classProbs = TRUE))

pred_labels <- predict(model_ros, test_data)
confusionMatrix(data = pred_labels, reference = test_data$final_result)

test_predictions <- predict(model_ros, newdata = test_data, type = "prob")
roc_curve        <- roc(test_data$final_result, test_predictions[,2])
auc(roc_curve)
########################################################################################
set.seed(123)
model_rus <- train(final_result ~.,
                   data      = train_data_rus, 
                   method    = "ranger",
                   trControl = trainControl(classProbs = TRUE))

pred_labels <- predict(model_rus, test_data)
confusionMatrix(data = pred_labels, reference = test_data$final_result)

test_predictions <- predict(model_rus, newdata = test_data, type = "prob")
roc_curve        <- roc(test_data$final_result, test_predictions[,2])
auc(roc_curve)
########################################################################################
set.seed(123)
model_smo <- train(final_result ~.,
                   data      = train_data_smo, 
                   method    = "ranger",
                   trControl = trainControl(classProbs = TRUE))

pred_labels <- predict(model_smo, test_data)
confusionMatrix(data = pred_labels, reference = test_data$final_result)

test_predictions <- predict(model_smo, newdata = test_data, type = "prob")
roc_curve        <- roc(test_data$final_result, test_predictions[,2])
auc(roc_curve)