set.seed(2)
library(leaps)
library(ISLR)
library(gam)
attach(College)
dim(College)
train <-  sample(777, 388)
test <- -train

#1

trainCollege <- College[train, ]
testCollege <- College[test, ] 

fit = regsubsets(Outstate ~ ., data = trainCollege, nvmax = 17, method = "forward")
summary=summary(fit)
par(mfrow = c(1,3))

plot(summary$cp, xlab = "# of variables",
     ylab = "Cp", type = "l")
min.cp = min(summary$cp)
std.cp = sd(summary$cp)
abline(h = min.cp + 0.2 * std.cp, col = "red", lty = 2)
abline(h = min.cp - 0.2 * std.cp, col = "red", lty = 2)

plot(summary$bic, xlab = "# of variables",
     ylab = "BIC", type='l')
min.bic = min(summary$bic)
std.bic = sd(summary$bic)
abline(h = min.bic + 0.2 * std.bic, col = "red", lty = 2)
abline(h = min.bic - 0.2 * std.bic, col = "red", lty = 2)

plot(summary$adjr2, xlab = "# of variables",
     ylab = "Adjusted R2", type = "l", ylim = c(0.4, 0.84))
max.adjr2 = max(summary$adjr2)
std.adjr2 = sd(summary$adjr2)
abline(h = max.adjr2 + 0.2 * std.adjr2, col = "red", lty = 2)
abline(h = max.adjr2 - 0.2 * std.adjr2, col = "red", lty = 2)

coef(fit, 6)

"From plotting the cp, BIC, and adjusted R2 one can see visually that the 
best amount of variables falls around 6 variables, which include PrivateYes,
Room.Board, Terminal, perc.alumni, Expend, and Grad.Rate"

#2

fit = gam(Outstate ~ Private + s(Room.Board, df = 2) + s(PhD, df = 2) +
            s(perc.alumni, df = 2) + s(Expend, df = 5) + s(Grad.Rate, df = 2),
          data=trainCollege)

par(mfrow = c(2,3))
plot.Gam(fit, se = T, col = "blue")

"From plotting the new model, one can see that the Grad.Rate and Room.Board variables 
are the closest to being linear. The rest of the variables are more nonlinear however,
perc.alumni is not too far off from linearity while Expend is the most nonlinear"


#3

preds = predict(fit, testCollege)
fit.MSE = mean((testCollege$Outstate - preds)^2)
fit.MSE

fit.R2 = 1 - fit.MSE / mean((testCollege$Outstate - mean(testCollege$Outstate))^2)
fit.R2

"With these six predictors using the GAM, we acquire a test error of 3641066 and 
and R2 value of .7736114"

#4

summary(fit)

"There is strong evidence of a nonlinear relationship between OutState and Expend.
Depending on the p-value, there is also evidence of a nonlinear relationship 
between Outstate and Room.Board and Outstate and Grad.Rate."

















