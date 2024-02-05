library(ISLR2)
set.seed(4)
data("Default")
View(Default)
summary(Default)
dim(Default)

#a
glm.fit <- glm(default ~ balance + income, data = Default, family = binomial)
summary(glm.fit)

#b(i)
trainDefault <- sample(10000, 5000)
testDefault <- Default[-trainDefault, ]

#b(ii)
glm.fit2 <- glm(default ~ balance + income, data = Default, family = binomial, subset = trainDefault)

#b(iii)
glm.probs <- predict(glm.fit2 , testDefault,
                     type = "response")
glm.pred <- rep("No", 5000) 
glm.pred[glm.probs > .5] <- "Yes"
table(glm.pred , testDefault$default)

#b(iv)
mean(glm.pred !=testDefault$default)

#c(1)
trainDefault <- sample(10000, 5000)
testDefault <- Default[-trainDefault, ]

glm.fit2 <- glm(default ~ balance + income, data = Default, family = binomial, subset = trainDefault)
glm.probs <- predict(glm.fit2 , testDefault,
                     type = "response")
glm.pred <- rep("No", 5000) 
glm.pred[glm.probs > .5] <- "Yes"
table(glm.pred , testDefault$default)
mean(glm.pred !=testDefault$default)

#c(2)
trainDefault <- sample(10000, 5000)
testDefault <- Default[-trainDefault, ]

glm.fit2 <- glm(default ~ balance + income, data = Default, family = binomial, subset = trainDefault)
glm.probs <- predict(glm.fit2 , testDefault,
                     type = "response")
glm.pred <- rep("No", 5000) 
glm.pred[glm.probs > .5] <- "Yes"
table(glm.pred , testDefault$default)
mean(glm.pred !=testDefault$default)

#c(3)
trainDefault <- sample(10000, 5000)
testDefault <- Default[-trainDefault, ]

glm.fit2 <- glm(default ~ balance + income, data = Default, family = binomial, subset = trainDefault)
glm.probs <- predict(glm.fit2 , testDefault,
                     type = "response")
glm.pred <- rep("No", 5000) 
glm.pred[glm.probs > .5] <- "Yes"
table(glm.pred , testDefault$default)
mean(glm.pred !=testDefault$default)

"After repeating the process three different times, we can see that the error rate
does change but is still around the same."

#d
trainDefault <- sample(10000, 5000)
testDefault <- Default[-trainDefault, ]

glm.fit3 = glm(default ~ income + balance + student, data = Default, family = binomial, subset = trainDefault)
glm.pred2 <- rep("No", 5000) 
glm.probs2 <- predict(glm.fit3 , testDefault,
                     type = "response")
glm.pred2[glm.probs2 > .5] <- "Yes"
table(glm.pred2 , testDefault$default)
mean(glm.pred2 !=testDefault$default)

"The error rate still remains similar to the error rate without the student dummy 
variable so there is not a signifcant effect"




