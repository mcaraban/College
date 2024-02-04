#Task 1

#a
MHW<- read.table('MHW.txt', header=TRUE, sep = ',')

#b
head(MHW)

#c
MHW[1:10,]

#d
attach(MHW)


#Task 2

#a
summary(MHW)
summary(grain)
summary(straw)

#b

min(grain)
max(grain)
mean(grain)
median(grain)
var(grain)
sd(grain)
quantile(grain)
IQR(grain)

min(straw)
max(straw)
mean(straw)
median(straw)
var(straw)
sd(straw)
quantile(straw)
IQR(straw)

#c
yield.ratio = grain/straw
summary(yield.ratio)


#Task 3

#a
stem(grain)

#b
hist(grain)

#c
hist(straw,  nclass=30,  col  =  "lightblue", 
     border  =  "red",  main  =  "The MHW Data", 
     xlab  =  "Straw  yield per plot")

hist(grain,  breaks  =  seq(2.6,  5.2,  by  =  0.1),
     col  =  "lightblue", border  =  "red",  
     main  =  "The MHW Data", xlab  =  "Grain  yield per plot")

#d
boxplot(grain)
boxplot(straw)
boxplot(grain,straw)

#Task 4

#a
apply(cbind(straw, grain), 2, mean)
apply(cbind(straw, grain), 2, sd)

#b
plot(straw ~ grain)

#Positive correlation between straw and grain
#The simple linear regression model is appropriate here

#d
abline(h=mean(straw), col=2)
abline(v=mean(grain), col=2)

#f
cov(grain,straw)

#i
abline(lm(straw ~ grain), col =2, lwd=2)

#j
yield.fit = lm(straw ~ grain)
yield.fit
summary(yield.fit)

#k
pred = yield.fit$coefficients[1] + 4*yield.fit$coefficients[2]
pred






