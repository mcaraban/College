Auto <- read.csv("Auto-1.csv", na.strings = "?",
                 stringsAsFactors = T)
Auto
Auto <- na.omit(Auto)
attach(Auto)
#1a
lm.fit <- lm(mpg ~ horsepower)
summary(lm.fit)

#i
"Yes there seems to be a relationship between mpg and horsepower"

#ii
"There is an adjusted R-squared value of .6049 which suggests correlation, but
not as strongly"

#iii
"Negative"

#iv
predict(lm.fit, data.frame(horsepower = 10),
        interval = "confidence")
predict(lm.fit, data.frame(horsepower= 10),
        interval = "prediction")

#1b
plot(horsepower,mpg)
abline(lm.fit, lwd = 2)

#1c
par(mfrow = c(2, 2))
plot(lm.fit)
"Based off the Residuals vs Fitted plot, there is evidence of non-linearity"

#2a
pairs(Auto)

#2b
Auto2 = Auto[,1:8]
cor(Auto2)

#2c
lm.fit2 <- lm(mpg ~ . - name, data = Auto)
summary(lm.fit2)

#i
"Yes, there is correlation between the predictors and response"

#ii
"The predictors displacement, weight, year and origin have statistical
significance to the response"

#iii
"The coefficient of year suggests that for each increase of one mpg there is an 
increase of .750773 years"

#2d
par(mfrow = c(2, 2))
plot(lm.fit2)
"Again, based off the Residuals vs Fitted plot there is slight evididence of 
non-linearity. There are a few outliers (323,327,326 notably) in the residual plot
and a high leverage point (14) in the leverage plot."

#2e
lm.fit3 <- lm(mpg ~ displacement * weight)
summary(lm.fit3)
lm.fit4 <- lm(mpg ~ year * weight)
summary(lm.fit4)

"The interaction between displacement and weight, as well as year and weight 
is statistically significant"

#2f
lm.fit5 <- lm(mpg ~ horsepower + I(horsepower^2))
summary(lm.fit5)

lm.fit6 <- lm(mpg ~ poly(horsepower, 6))
summary(lm.fit6)

anova(lm.fit,lm.fit5)

"Using a transformation of X^2 on horsepower, there is evidence that 
the transformation is better than the original model. After taking a look 
at higher order transformations on horsepower, it is apparent that after the 
second order there are no signifcant p-values therefore there won't be an 
improvement on the model"







