M=10000
n=128
XSamples=matrix(rep(0,n*M),M,n)


for (j in 1:M) {XSamples[j,]=rexp(n,rate = 1)
  
}

Xbars=apply(XSamples,1,mean)

mean(Xbars)
var(Xbars)
sd(Xbars)
summary(Xbars)

hist(Xbars,nclass = 30,freq = F,main = "Sampling Distribution of Xbar when n=128 and lambda=1")

dens=density(Xbars)
lines(dens$x,dens$y,col= 4)

start=mean(Xbars)-4*sd(Xbars)
end=mean(Xbars)+4*sd(Xbars)
xx=seq(start,end,length=200)
lines(xx,dnorm(xx,mean(Xbars),sd(Xbars)),col=2,lwd=2)







