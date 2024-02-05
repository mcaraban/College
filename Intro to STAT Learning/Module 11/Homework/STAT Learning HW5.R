College <- read.csv("College-1.csv", na.strings = "?",
                 stringsAsFactors = T, row.names = 1)
College
dim(College)
install.packages('glmnet')
install.packages('pls')
library(glmnet)
library(pls)
set.seed(1)

#a
train <-  sample(777, 388)
test <- -train

trainCollege <- College[train, ]
testCollege <- College[test, ] 

#b
lm.fit <- lm(Apps ~ ., data=trainCollege)
summary(lm.fit)
lm.pred <- predict(lm.fit, testCollege, 
                   type="response")
lm.MSE <- mean((lm.pred-testCollege$Apps)^2)
lm.MSE

#c
train.matrix <- model.matrix(Apps ~ ., data = trainCollege)
test.matrix <- model.matrix(Apps ~ ., data = testCollege)
lambdaVals = 10^seq(10, -2, length=100)

ridge <- glmnet(train.matrix, trainCollege$Apps, alpha = 0, lambda = lambdaVals)
ridge.cv  <- cv.glmnet(train.matrix, trainCollege$Apps, alpha=0)
lambda.ridge <- ridge.cv$lambda.min
ridge.pred <- predict(ridge, newx = test.matrix, s = lambda.ridge)
ridge.MSE <- mean((ridge.pred-testCollege$Apps)^2)
ridge.MSE

#d
lasso <- glmnet(train.matrix, trainCollege$Apps, alpha = 1, lambda = lambdaVals)
lasso.cv  <- cv.glmnet(train.matrix, trainCollege$Apps, alpha=1)
lambda.lasso <- lasso.cv$lambda.min
lasso.pred <- predict(lasso, newx = test.matrix, s = lambda.lasso)
lasso.MSE <- mean((lasso.pred-testCollege$Apps)^2)
lasso.MSE

#e
pcr.fit <- pcr(Apps ~ ., data = trainCollege, scale = TRUE, validation = "CV")
validationplot(pcr.fit, val.type = "MSEP")
summary(pcr.fit)
#M=17
pcr.pred <- predict(pcr.fit, testCollege, ncomp = 17)
pcr.MSE <- mean((pcr.pred-testCollege$Apps)^2)
pcr.MSE

#f
pls.fit <- plsr(Apps ~ ., data = trainCollege, scale = TRUE, validation = "CV")
validationplot(pls.fit, val.type = "MSEP")
summary(pls.fit)
#M=17
pls.pred <- predict(pls.fit, testCollege, ncomp = 17)
pls.MSE <- mean((pls.pred-testCollege$Apps)^2)
pls.MSE

#g
barplot(c(lm.MSE, ridge.MSE, lasso.MSE, pcr.MSE, pls.MSE), col="blue4", 
        names.arg=c("OLS","Ridge", "Lasso", "PCR", "PLS"), main = "Test Error",
        ylab = "MSE")

average.test <- mean(testCollege$Apps)
lm.R2 <- 1 - mean((testCollege$Apps-lm.pred)^2)/mean((testCollege$Apps-average.test)^2)
ridge.R2 <- 1 - mean((testCollege$Apps-ridge.pred)^2)/mean((testCollege$Apps-average.test)^2)
lasso.R2 <- 1 - mean((testCollege$Apps-lasso.pred)^2)/mean((testCollege$Apps-average.test)^2)
pcr.R2 <- 1 - mean((testCollege$Apps-pcr.pred)^2)/mean((testCollege$Apps-average.test)^2)
pls.R2 <- 1 - mean((testCollege$Apps-pls.pred)^2)/mean((testCollege$Apps-average.test)^2)
 
barplot(c(lm.R2, ridge.R2, lasso.R2, pcr.R2, pls.R2), col="red4", 
        names.arg=c("OLS","Ridge", "Lasso", "PCR", "PLS"), main = "R-Squared",
        ylab = "R-Squared", ylim = c(0,1))


"Comparing all the test errors, it seems that ridge regression model had the 
lowest test error(9763268.9) while the linear (1135758.3) and PCR (1135758.3) 
models had the highest. Comparing the models' R2 values, the ridge regression 
model had the highest accuaracy with an accuarcy of 91.5%"






