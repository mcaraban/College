#Task 1
#a
x=rbinom(50,1,.2)
x
#b
thetaobs=sum(x)/50
thetaobs

#Task 2
#a
N<-10000; n<-50; theta<-.4
MySamples<-replicate(N, rbinom(n,1,theta))
#b
thetak=colSums(MySamples)/50
#c
hist(thetak, right = FALSE, xlim = c(0,1), xlab = "Sample proportion")
#d
mean(thetak<thetaobs)















