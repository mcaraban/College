MHW<-read.table("MHW.txt", header=T, sep=",") 
attach(MHW) 

apply(cbind(straw, grain), 2, mean) 
apply(cbind(straw, grain), 2, sd) 

plot(grain, straw)

abline(h=mean(straw), col=2) 
abline(v=mean(grain), col=2)

abline(.866279364,1.43049775, col =2, lwd=2)

cor(grain, straw)

Yield.fit<-lm(straw~grain) 
Yield.fit 
summary(Yield.fit) 








