#2-Model.R
#according to the tutorial, we will build 5 different models
#to predict species from flower measurements and we will
#set up a 10-fold cross validation to test the model and select
#the best one (most accurate)


#------- Set up cross validation

control <- trainControl(method = "cv", number=10)
metric <- "Accuracy"

  #we'll be splitting the dataset into 10 parts, training on 9 and
  #testing on 1 and then release, for all combinations of train test splits
  #Also, the metric "Accuracy" will be used to evaluate the models. This
  #is the ratio of correctly predicted instances divided by the total number
  #of instances in the dataset

#------- Build Models

#We don't yet know which algorithms would be good on this problem, so
#we'll evaluate 5 different algorithms:
  # - linear discriminant analysis (simple linear)
  # - classification and regression trees (CART) (nonlinear)
  # - k-Nearest Neighbours (KNN) (nonlinear)
  # - Support Vector Machines (SVM) with a linear kernal (complex nonlinear)
  # - Random Forest (RF) (complex nonlinear)

#a) linear algorithm
set.seed(7)
fit.lda <- train(Species~., data=dataset, method="lda", metric=metric, trControl=control)
# b) nonlinear algorithms
# CART
set.seed(7)
fit.cart <- train(Species~., data=dataset, method="rpart", metric=metric, trControl=control)
# kNN
set.seed(7)
fit.knn <- train(Species~., data=dataset, method="knn", metric=metric, trControl=control)
# c) advanced algorithms
# SVM
set.seed(7)
fit.svm <- train(Species~., data=dataset, method="svmRadial", metric=metric, trControl=control)
# Random Forest
set.seed(7)
fit.rf <- train(Species~., data=dataset, method="rf", metric=metric, trControl=control)


#------- Select Best Model


#summarize accuracy of models
results <- resamples(list(lda=fit.lda, cart=fit.cart, knn=fit.knn, svm=fit.svm, rf=fit.rf))
summary(results)
dotplot(results) #best model looks to be linear discrimant analysis

#summarize best model
print(fit.lda)


#------- Make Predictions


#estimate skill of LDa on the validation dataset
predictions <- predict(fit.lda, validation)
confusionMatrix(predictions, validation$Species)


