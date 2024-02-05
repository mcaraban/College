M=10000
n=96
XSamples=matrix(rep(0,n*M),M,n)

for(j in 1:M)
  {XSamples[j , ]<- rnorm(n, 10, 10)}

Xbars=apply(XSamples,1,mean)
Sdn=apply(XSamples,1,sd)

Tn=sqrt(n)*((Xbars-10)/Sdn)

mean(Tn)
var(Tn)
sd(Tn)
summary(Tn)

hist(Tn, nclass=30, freq=F, main="Sampling Distribution of Tn when n=96 and lambda
=0.1")

start<-min(Tn)-5*sd(Tn) 
end<-max(Tn)+5*sd(Tn) 
xx<-seq(start, end, length=200) 
lines(xx, dnorm(xx, mean(Tn), sd(Tn)), col=2, lwd=2)
 lines(xx, dt(xx, n-1), col=4, lwd=2) 









