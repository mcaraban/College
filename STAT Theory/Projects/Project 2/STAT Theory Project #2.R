
N<-10000; n<-10; mu<-72; sigma=12
MySamples<-matrix(rep(0, N*n), n, N)
MySamples<-replicate(N, rnorm(n, mu, sigma))

Xbar<-apply(MySamples, 2, mean)
SDx<-apply(MySamples, 2, sd)

alpha<-0.05
q_alpha<-qnorm(1-alpha/2)   #Z-Interval
ME<-q_alpha*sigma/sqrt(n) 
LCL<-Xbar-ME
UCL<-Xbar+ME
Intervals<-data.frame(Xbar, ME, LCL, UCL, Length=UCL-LCL)
head(Intervals)

Coverage<-(abs(Xbar-mu)<=ME)
Coverage[1:10]

Confidence<-sum(Coverage)/N
Confidence

q_alpha<-qt(1-alpha/2, n-1)  #T-Interval
ME<-q_alpha*SDx/sqrt(n) 
LCL<-Xbar-ME
UCL<-Xbar+ME
Intervals<-data.frame(Xbar, ME, LCL, UCL, Length=UCL-LCL)
head(Intervals)

Coverage<-(abs(Xbar-mu)<=ME)
Coverage[1:10]

Confidence<-sum(Coverage)/N
Confidence

Gamma

N<-10000; n<-1000; mu<-72; sigma=12
MySamples<-matrix(rep(0, N*n), n, N)
MySamples<-replicate(N, rgamma(n,mu/2,1/2))

Xbar<-apply(MySamples, 2, mean)
SDx<-apply(MySamples, 2, sd)

alpha<-0.05
q_alpha<-qnorm(1-alpha/2)   #Z-Interval
ME<-q_alpha*sigma/sqrt(n) 
LCL<-Xbar-ME
UCL<-Xbar+ME
Intervals<-data.frame(Xbar, ME, LCL, UCL, Length=UCL-LCL)
head(Intervals)

Coverage<-(abs(Xbar-mu)<=ME)
Coverage[1:10]

Confidence<-sum(Coverage)/N
Confidence

q_alpha<-qt(1-alpha/2, n-1)   #T-Interval
ME<-q_alpha*SDx/sqrt(n) 
LCL<-Xbar-ME
UCL<-Xbar+ME
Intervals<-data.frame(Xbar, ME, LCL, UCL, Length=UCL-LCL)
head(Intervals)

Coverage<-(abs(Xbar-mu)<=ME)
Coverage[1:10]

Confidence<-sum(Coverage)/N
Confidence

N<-10000; n<-100; mu<-72; sigma=12
MySamples<-matrix(rep(0, N*n), n, N)
MySamples<-replicate(N, rgamma(n,mu/2,1/2))

Xbar<-apply(MySamples, 2, mean)
SDx<-apply(MySamples, 2, sd)
hist(Xbar,nclass = 100,freq = FALSE)
lines(sort(Xbar),dnorm(sort(Xbar),72,12/sqrt(n)),col=2,)








