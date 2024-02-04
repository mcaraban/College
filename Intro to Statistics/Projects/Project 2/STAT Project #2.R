M<-1000
n<-16
XSamples<- replicate(M,rexp(n,rate=0.1))
dim(XSamples)

Xbars<- colSums(XSamples)/n 


hist(Xbars, nclass=30, freq=F, main="Sampling Distribution 
of Xbar when n=16")

dens<-density(Xbars)
lines(dens$x, dens$y, col=2)

mean(Xbars)
var(Xbars)
sd(Xbars)
summary(Xbars)



M<-1000
n<-32
XSamples<- replicate(M,rexp(n,rate=0.05))
dim(XSamples)
Xbars<- colSums(XSamples)/n
mean(Xbars)
sd(Xbars)

M<-1000
n<-64
XSamples<- replicate(M,rexp(n,rate=0.05))
dim(XSamples)
Xbars<- colSums(XSamples)/n
mean(Xbars)
sd(Xbars)


M<-1000
n<-128
XSamples<- replicate(M,rexp(n,rate=0.05))
dim(XSamples)
Xbars<- colSums(XSamples)/n
mean(Xbars)
sd(Xbars)

M<-1000
n<-32
XSamples<- replicate(M,rexp(n,rate=0.1))
dim(XSamples)
Xbars<- colSums(XSamples)/n
mean(Xbars)
sd(Xbars)

M<-1000
n<-64
XSamples<- replicate(M,rexp(n,rate=0.1))
dim(XSamples)
Xbars<- colSums(XSamples)/n
mean(Xbars)
sd(Xbars)

M<-1000
n<-128
XSamples<- replicate(M,rexp(n,rate=0.1))
dim(XSamples)
Xbars<- colSums(XSamples)/n
mean(Xbars)
sd(Xbars)

M<-1000
n<-32
XSamples<- replicate(M,rexp(n,rate=0.5))
dim(XSamples)
Xbars<- colSums(XSamples)/n
mean(Xbars)
sd(Xbars)

M<-1000
n<-64
XSamples<- replicate(M,rexp(n,rate=0.5))
dim(XSamples)
Xbars<- colSums(XSamples)/n
mean(Xbars)
sd(Xbars)

M<-1000
n<-128
XSamples<- replicate(M,rexp(n,rate=0.5))
dim(XSamples)
Xbars<- colSums(XSamples)/n
mean(Xbars)
sd(Xbars)

M<-1000
n<-32
XSamples<- replicate(M,rexp(n,rate= 1))
dim(XSamples)
Xbars<- colSums(XSamples)/n
mean(Xbars)
sd(Xbars)

M<-1000
n<-64
XSamples<- replicate(M,rexp(n,rate=1))
dim(XSamples)
Xbars<- colSums(XSamples)/n
mean(Xbars)
sd(Xbars)

M<-1000
n<-128
XSamples<- replicate(M,rexp(n,rate=1))
dim(XSamples)
Xbars<- colSums(XSamples)/n
mean(Xbars)
sd(Xbars)

M<-1000
n<-16
XSamples<- replicate(M,rnorm(n,10,1))
dim(XSamples)
Xbars<- colSums(XSamples)/n
mean(Xbars)
sd(Xbars)

M<-1000
n<-25
XSamples<- replicate(M,rnorm(n,10,1))
dim(XSamples)
Xbars<- colSums(XSamples)/n
mean(Xbars)
sd(Xbars)

M<-1000
n<-36
XSamples<- replicate(M,rnorm(n,10,1))
dim(XSamples)
Xbars<- colSums(XSamples)/n
mean(Xbars)
sd(Xbars)

M<-1000
n<-16
XSamples<- replicate(M,rnorm(n,10,3))
dim(XSamples)
Xbars<- colSums(XSamples)/n
mean(Xbars)
sd(Xbars)

M<-1000
n<-25
XSamples<- replicate(M,rnorm(n,10,3))
dim(XSamples)
Xbars<- colSums(XSamples)/n
mean(Xbars)
sd(Xbars)

M<-1000
n<-36
XSamples<- replicate(M,rnorm(n,10,3))
dim(XSamples)
Xbars<- colSums(XSamples)/n
mean(Xbars)
sd(Xbars)

M<-1000
n<-16
XSamples<- replicate(M,rnorm(n,20,1))
dim(XSamples)
Xbars<- colSums(XSamples)/n
mean(Xbars)
sd(Xbars)

M<-1000
n<-25
XSamples<- replicate(M,rnorm(n,20,1))
dim(XSamples)
Xbars<- colSums(XSamples)/n
mean(Xbars)
sd(Xbars)

M<-1000
n<-36
XSamples<- replicate(M,rnorm(n,20,1))
dim(XSamples)
Xbars<- colSums(XSamples)/n
mean(Xbars)
sd(Xbars)

M<-1000
n<-16
XSamples<- replicate(M,rnorm(n,20,3))
dim(XSamples)
Xbars<- colSums(XSamples)/n
mean(Xbars)
sd(Xbars)

M<-1000
n<-25
XSamples<- replicate(M,rnorm(n,20,3))
dim(XSamples)
Xbars<- colSums(XSamples)/n
mean(Xbars)
sd(Xbars)

M<-1000
n<-36
XSamples<- replicate(M,rnorm(n,20,3))
dim(XSamples)
Xbars<- colSums(XSamples)/n
mean(Xbars)
sd(Xbars)

n<-50
XSample<- rbinom(n,1,0.4)

n<-50
XSamples<- replicate(10000, rbinom(n,1,0.4))

hatpk<- colSums(XSamples)/n 

hist(hatpk,xlab = expression(bar(X)[n]), main = "", prob =  
       TRUE)

mean(hatpk<.22)
















