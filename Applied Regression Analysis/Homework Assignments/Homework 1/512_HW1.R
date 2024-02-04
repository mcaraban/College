#Task 1

#a
MHW<- read.table("MHW.txt", header=TRUE, sep=",")

#b
str(MHW)

#c
names(MHW)

#d
MHW[1:10, ]

#e
attach(MHW)
plot(grain, straw, main="Scatterplot of Straw on
Grain", xlab="grain", ylab="straw")
detach(MHW)

#f
yield.ratio <-grain/straw
MHW1<-cbind(MHW, yield.ratio)
MHW1[1:8,]

#g
save(MHW1, file='MHW1.RData')

#Task 2

#a
attach(MHW1)
stem(grain)
stem(straw)

#b
hist(grain)
hist(straw)

#c
hist(grain, breaks = seq(2.6, 5.2, by = 0.1),
     col = "lightblue", border = "red", main = "Mercer-
Hall Data", xlab = "Grain yield, lb. per plot")

hist(straw, breaks = seq(2.6, 5.2, by = 0.1),
     col = "lightblue", border = "red", main = "Mercer-
Hall Data", xlab = "Grain yield, lb. per plot")

#d
hist(grain, freq=FALSE, breaks = seq(2.6, 5.2,
     by = 0.1), col = "lightblue", border = "red",
     main = "Mercer-Hall Data", xlab = "Grain yield,
lb. per plot")

lines(density(grain, adj=1.5), lwd = 1.5, col =
        "brown")
      
hist(straw, freq=FALSE, breaks = seq(2.6, 5.2,
                                     by = 0.1), col = "lightblue", border = "red",
     main = "Mercer-Hall Data", xlab = "Grain yield,
lb. per plot")

lines(density(straw, adj=1.5), lwd = 1.5, col =
        "brown")
      
#g
boxplot(grain, straw,names =  c("grain", "straw"), ylab = "lbs per pot",
        col = c("yellow", "blue"))

#Task 3

#a
summary(MHW1)
apply(MHW1, 2, summary)
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
qa<-quantile(grain, probs = c(0.25, 0.75))
abline(v=qa[1])
abline(v=qa[2])

qa<-quantile(straw, probs = c(0.25, 0.75))
abline(v=qa[1])
abline(v=qa[2])

#d
MHW1[which.max(grain),]
MHW1[which.min(grain),] 

MHW1[which.max(straw),] 
MHW1[which.min(straw),] 


#Task 4

#a
xx<-sort(grain)
hist(xx, nclass=30, freq=FALSE)
lines(xx, dnorm(xx, mean(xx), sqrt(var(xx))))

yy<-sort(straw)
hist(yy, nclass=30, freq=FALSE)
lines(yy, dnorm(yy, mean(yy), sqrt(var(yy))))

#b
plot(grain, straw)
abline(v=mean(grain))
abline(h=mean(straw))

#c
lm.out<-lm(straw~ grain)
summary(lm.out)

#d
abline(lm.out, col = "red", lwd = 2 )









