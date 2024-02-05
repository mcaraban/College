Hearts <- read.csv("Heart1.csv", na.strings = "?",
                 stringsAsFactors = T)
Hearts=Hearts[,-1]
Hearts
attach(Hearts)

#1
cor(Hearts[, c("Biking", "Smoking")])

#2
plot(Biking,Heart_Disease, xlab = "Biking", ylab = "Heart Disease")
abline(lm(Heart_Disease ~ Biking))

plot(Smoking,Heart_Disease, xlab = "Smoking", ylab = "Heart Disease")
abline(lm(Heart_Disease ~ Smoking))

#3
Heart.mod <- lm(Heart_Disease ~ Biking + Smoking)

summary(Heart.mod)

#4
"Based off the linear model, we can see that biking has a negative effect on
heart disease, while smoking has a positive effect on heart disease. This 
makes sense logically, but we can also see that biking has a stronger 
effect than smoking as well based off the coefficients in the linear model."






