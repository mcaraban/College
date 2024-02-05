
#a
set.seed(111)
x1 <- runif(500) - 0.5
x2 <- runif(500) - 0.5
y <- 1 * (x1^2 - x2^2 > 0)

#b
plot(x1[y == 0], x2[y == 0], col = "red", xlab = "X1", ylab = "X2", pch = 19)
points(x1[y == 1], x2[y == 1], col = "darkblue", pch = 19)

#c
lm.fit <- glm(y ~ x1 +x2, family = binomial)
summary(lm.fit)

#d
dat <- data.frame(x1 = x1, x2 = x2, y = as.factor(y))
lm.prob <- predict(lm.fit, dat, type = "response")
lm.pred <- ifelse(lm.prob > 0.5, 1, 0)
dat.pos <- dat[lm.pred == 1, ]
dat.neg <- dat[lm.pred == 0, ]
plot(dat.pos$x1, dat.pos$x2, col = "darkblue", xlab = "X1", ylab = "X2", pch = 19)
points(dat.neg$x1, dat.neg$x2, col = "red", pch = 19)

#e
lm.fit <- glm(y ~ poly(x1, 2) + poly(x2, 3) + I(x1 * x2), data = dat, family = binomial)
summary(lm.fit)

#f
lm.prob <- predict(lm.fit, dat, type = "response")
lm.pred <- ifelse(lm.prob > 0.5, 1, 0)
dat.pos <- dat[lm.pred == 1, ]
dat.neg <- dat[lm.pred == 0, ]
plot(dat.pos$x1, dat.pos$x2, col = "darkblue", xlab = "X1", ylab = "X2", pch = 19)
points(dat.neg$x1, dat.neg$x2, col = "red", pch = 19)

#g
svmfit <- svm(y ~ x1 + x2, dat, kernel = "linear", cost = 1e5)
plot(svmfit, dat)
summary(svmfit)

#h
svmfit2 <- svm(y ~ x1 + x2, dat, kernel = "radial", gamma = 1)
plot(svmfit2, dat)
summary(svmfit)

#i
"Based off these different plots, fitting an SVM with a non-linear kernal and 
the logistic regression with interaction terms both provided strong methods to 
find a nonlinear model."



















