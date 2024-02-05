library(MASS)
library(caret)
set.seed(111)

# Function for 10-fold cross-validation
cv <- function(data) {
  
  
  folds <- createFolds(data$perf, k = 10, list = TRUE, returnTrain = FALSE)
  
  test_error <- numeric(length = 10)
  for (i in 1:10) {
    
    train_set <- data[-folds[[i]], ]
    test_set <- data[folds[[i]], ]
    
    model <- lm(perf ~ mmin + mmax, data = train_set)
    predictions <- predict(model, newdata = test_set)
    
    test_error[i] <- mean((test_set$perf - predictions)^2)
    
  }
  return(mean(test_error))
  
}

cv(cpus)
















