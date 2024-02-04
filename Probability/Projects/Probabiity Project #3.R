xx=1:10
PP=c(.01,.12,.13,.14,.2,.2,.1,.05,.04,.01)
require(graphics)
par(mfrow = c(2, 1))
plot(xx,PP,type = "h", col = 2,main = "Pmf List",xlab = "x",ylab = "p(x)")
points(xx,PP,col = 2);abline(h=0,col=3)
QQ=cumsum(PP)
c(xx,PP,QQ)
plot(c(0,xx),c(0,QQ),type = "s",ylab = "F(x)",col = 2, xlab = "x",main = "Cdf
     for user defined dist.")
abline(h=0:1,col=4)

xx=1:10
PP=pbinom(xx,size = 10,prob = .6)
require(graphics)
par(mfrow = c(2, 1))
plot(xx,PP,type = "h", col = 2,main = "Pmf List",xlab = "x",ylab = "p(x)")
points(xx,PP,col = 2);abline(h=0,col=3)
QQ=cumsum(PP)
c(xx,PP,QQ)
plot(c(0,xx),c(0,QQ),type = "s",ylab = "F(x)",col = 2, xlab = "x",main = "Cdf
     for user defined dist.")
abline(h=0:1,col=4)

xx=1:10
PP=dbinom(xx,size = 10,prob = .6)
require(graphics)
par(mfrow = c(2, 1))
plot(xx,PP,type = "h", col = 2,main = "Pmf List",xlab = "x",ylab = "p(x)")
points(xx,PP,col = 2);abline(h=0,col=3)
QQ=cumsum(PP)
c(xx,PP,QQ)
plot(c(0,xx),c(0,QQ),type = "s",ylab = "F(x)",col = 2, xlab = "x",main = "Cdf
     for user defined dist.")
abline(h=0:1,col=4)

xx=1:10
PP=ppois(xx,lambda = 6)
require(graphics)
par(mfrow = c(2, 1))
plot(xx,PP,type = "h", col = 2,main = "Pmf List",xlab = "x",ylab = "p(x)")
points(xx,PP,col = 2);abline(h=0,col=3)
QQ=cumsum(PP)
c(xx,PP,QQ)
plot(c(0,xx),c(0,QQ),type = "s",ylab = "F(x)",col = 2, xlab = "x",main = "Cdf
     for user defined dist.")
abline(h=0:1,col=4)

xx=1:10
PP=dpois(xx,lambda = 6)
require(graphics)
par(mfrow = c(2, 1))
plot(xx,PP,type = "h", col = 2,main = "Pmf List",xlab = "x",ylab = "p(x)")
points(xx,PP,col = 2);abline(h=0,col=3)
QQ=cumsum(PP)
c(xx,PP,QQ)
plot(c(0,xx),c(0,QQ),type = "s",ylab = "F(x)",col = 2, xlab = "x",main = "Cdf
     for user defined dist.")
abline(h=0:1,col=4)

