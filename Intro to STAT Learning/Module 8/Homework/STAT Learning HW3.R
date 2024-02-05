library(ISLR2)
Weekly
dim(Weekly)
attach(Weekly)

#a
summary(Weekly)
cor(Weekly[,-9])
pairs(Weekly)
"Based off, the cor function and pairs function, the only variables that 
seem to have a linear relationship are Volume and Year"

#b
glm.fits <- glm(Direction ~ Lag1 + Lag2 + Lag3 + Lag4 + Lag5 + Volume,
                  data = Weekly, family = binomial)
summary(glm.fits)

"Yes, there is one predictor that is statistically significant which is 
Lag2"

#c
glm.probs <- predict(glm.fits, type = "response")
glm.pred <- rep("Down", 1089)
glm.pred[glm.probs > .5] = "Up"
table(glm.pred , Direction)
mean(glm.pred == Direction)
"The model correctly predicted the weekly trend 56.1% of the time, more 
specifically it corrrectly predicted it would go down 54 times and up 
557 times"


#d
train = (Year < 2009)
Weekly.2009up <- Weekly[!train,]
dim(Weekly.2009up)
Direction.2009up = Direction[!train]
glm.fits <- glm(Direction ~ Lag2, data = Weekly, family = binomial,
                subset = train)
glm.prob= predict(glm.fits, Weekly.2009up, type = "response")
glm.pred = rep("Down", 104) 
glm.pred[glm.prob > 0.5] = "Up"
table(glm.pred, Direction.2009up)
mean(glm.pred == Direction.2009up)

#e
library(MASS)
lda.fit <- lda(Direction ~ Lag2, data = Weekly, family = binomial, 
               subset = train)
lda.pred <- predict(lda.fit, Weekly.2009up)
lda.class <- lda.pred$class
table(lda.class, Direction.2009up)
mean(lda.class == Direction.2009up)

#f
qda.fit <- qda(Direction ~ Lag2, data = Weekly, family = binomial,
               subset = train)
qda.class <- predict(qda.fit, Weekly.2009up)$class
table(qda.class, Direction.2009up)
mean(qda.class == Direction.2009up)

#g
library(class)
train.X <- as.matrix(Lag2[train])
test.X <- as.matrix(Lag2[!train])
train.Direction <- Direction[train]
set.seed(1)
knn.pred <- knn(train.X, test.X, train.Direction, k = 1)
table(knn.pred, Direction.2009up)
mean(knn.pred == Direction.2009up)

#h
library(e1071)
nb.fit <- naiveBayes(Direction ~ Lag2, data = Weekly, subset = train)
nb.class <- predict(nb.fit, Weekly.2009up)
table(nb.class, Direction.2009up)
mean(nb.class == Direction.2009up)

#i
"If we compare all the means, the methods with the best results are the
Logistic Regression and Linear Discriminant Analysis as they have the 
highest accuracy with 62.5% compared to the other methods"

#j
glm.fits2 <- glm(Direction ~ Lag2 + I(Lag2^.5), data = Weekly, family = binomial,
                 subset = train)
glm.prob= predict(glm.fits2, Weekly.2009up, type = "response")
glm.pred = rep("Down", 104) 
glm.pred[glm.prob > 0.5] = "Up"
table(glm.pred, Direction.2009up)
mean(glm.pred == Direction.2009up)

lda.fit <- lda(Direction ~ poly(Lag2,2), data = Weekly, family = binomial, 
               subset = train)
lda.pred <- predict(lda.fit, Weekly.2009up)
lda.class <- lda.pred$class
table(lda.class, Direction.2009up)
mean(lda.class == Direction.2009up)

qda.fit <- qda(Direction ~ Lag2 + Lag2*Lag3, data = Weekly, family = binomial,
               subset = train)
qda.class <- predict(qda.fit, Weekly.2009up)$class
table(qda.class, Direction.2009up)
mean(qda.class == Direction.2009up)

knn.pred <- knn(train.X, test.X, train.Direction, k = 5)
table(knn.pred, Direction.2009up)
mean(knn.pred == Direction.2009up)

knn.pred <- knn(train.X, test.X, train.Direction, k = 50)
table(knn.pred, Direction.2009up)
mean(knn.pred == Direction.2009up)

nb.fit <- naiveBayes(Direction ~ Lag2 + Lag4, data = Weekly, subset = train)
nb.class <- predict(nb.fit, Weekly.2009up)
table(nb.class, Direction.2009up)
mean(nb.class == Direction.2009up)

"It appear that our original answer of 62.5% from Logisitc and LDA provides
the best results"










