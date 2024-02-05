library(ISLR2)
library(tree)
#a
set.seed(111)
train <- sample(1:nrow(OJ), 800)
OJ.train <- OJ[train, ]
OJ.test <- OJ[-train, ]

#b
tree.oj = tree(Purchase ~ ., OJ.train)
summary(tree.oj)

"The training error rate is 16.75% and the tree has 8 terminal nodes."

#c
tree.oj

"Using the second terminal node, the split criterion is LoyalCH < .276142.
It has 108 observations with a deviance of 100.5 and a prediction for the
branch MM. Around 18% of the observations take the value of CH and 82%
take the value of MM"

#d
plot(tree.oj)
text(tree.oj, pretty = 0)

"The most important indicator for Purchase is Loyal CH. If a value is less 
than .482389 it has a pretty high change as being classified as MM
and if it's value is higher than .482389 then it has pretty high chance as being 
classified as CH.More specifically, it the value is higher than .764572 it will 
be classied as CH and if it is lower the next indicator looked at is ListPriceDiff
which if it is high than .235 will be classified as CH. Lower than .235 leads to 
the last indicator of PricDiff which high than .085 leads to a CH classifciation 
and lower leads to MM"

#e
tree.pred <- predict(tree.oj, OJ.test, type = "class")
table(tree.pred, OJ.test$Purchase)
Terr=1-(147+81)/270
Terr

#f
set.seed(1)
cv.oj <- cv.tree(tree.oj, FUN = prune.misclass)
cv.oj

#g
plot(cv.oj$size, cv.oj$dev, type = "b", xlab = "Tree size", ylab = "Deviance")

#h
"The 2 node tree has the smallest cross validation error with 156"

#i
par( mfrow = c (1 , 2))
prune.oj <- prune.misclass(tree.oj, best = 2)
plot(prune.oj)
text(prune.oj, pretty = 0)

prune.oj <- prune.misclass(tree.oj, best = 5)
plot(prune.oj)
text(prune.oj, pretty = 0)

#j
summary(tree.oj)
summary(prune.oj)

"Comparing the two trees, the prune tree has a slightly higher training 
error rate of 16.88% compared to 16.75%"

#k
prune.tree.pred <- predict(prune.oj, OJ.test, type = "class")
table(prune.tree.pred, OJ.test$Purchase)
PTerr=1 - (137+90)/270
PTerr

"Again, the prune tree has a slightly higher test error rate of 15.92% compared
to 15.55%"







