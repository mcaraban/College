Income <- read.csv("Income1.csv", na.strings = "?",
                 stringsAsFactors = T)
Income <- Income[,-1]
Income
#1
hist(Income$Happiness, main="Histogram of Happiness Score")

"Bell shape"

#2
plot(Income$Income, Income$Happiness, main="Income vs. Happiness ", xlab="Income", ylab="Happiness")
abline(lm(Income$Happiness ~ Income$Income))

#3
Income.mod <- lm(Income$Happiness ~ Income$Income)
summary(Income.mod)

#4
"Based off these results, we can say there is a positive linear relationship
between happiness and income."






