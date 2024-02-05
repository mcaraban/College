g=file.choose()
DriveTest=read.table(g,header = TRUE)
Sober=DriveTest[c(1:24,41:80),1]
Drug=DriveTest[c(25:40,81:119),1]

#1a
t.test(Sober,Drug,var.equal = T)

#1b
nm=DriveTest%>%filter(Drug=="1" | Drug=="0")%>%
  arrange(Drug)%>%group_by(Drug)%>%summarise(n())%>%pull(2)
z=DriveTest%>%filter(Drug=="1" | Drug=="0")%>%
  arrange(Drug)%>%group_by(Drug)%>%pull(Distance)
n=nm[1];m=nm[2];N=sum(nm)
x=z[1:n];y=z[(n+1):N]

t0 <- t.test(x, y)$statistic
ts <- map(1:100,~sample.int(N,n))%>%map_dbl(~t.test(z[.x],z[-.x])$statistic)
p <- mean(abs(ts) >= abs(t0))
p

hist(ts, main = "", freq = FALSE, xlab = "T",breaks = "scott")
points(t0, 0, cex = 1, pch = 16)

#1b
permutations <- function(n)
{if(n==1){
  return(matrix(1))
} else {
  sp <- permutations(n-1)
  p <- nrow(sp)
  A <- matrix(nrow=n*p,ncol=n)
  for(i in 1:n)
  { A[(i-1)*p+1:p,] <- cbind(i,sp+(sp>=i))
  }
  return(A)
}
}

sober=sample(Sober,3)
drug=sample(Drug,3)
z=c(sober,drug)
thetahat=mean(sober)-mean(drug)
n=length(sober);m=length(drug);N=m+n
perm=permutations(N)
thetahatstars=data.frame(t(perm))%>%map(~.x%in%(1:n))%>%bind_cols()%>%
  map_dbl(~mean(z[.x])-mean(z[!.x]))
mean(abs(thetahatstars)>=abs(thetahat))



#1c
wilcox.test(Sober,Drug)

rbinom()

uniroot(rbinom(r,n,1),)
#3
N = 100000 
U =runif(N)
rand.samples = rep(NA,N)
for(i in 1:N){
  if(U[i]<.99){
    rand.samples[i] = rnorm(1,0,5)
  }else if(U[i]<.01){
    rand.samples[i] = rnorm(1,0,25)
  }
}

#2
n<- 1000;x1 <- rnorm(n, 0, 1);x2 <- rnorm(n, 0, 25);s <- x1 + x2#the convolution
u <- runif(n);k <- as.integer(u > 0.99) #vector of 0's and 1's
x <- k * x1 + (1-k) * x2
mean(x)

avg.bs <- c()
for(b in 1:1000) {
  yStar <- sample(x,64,replace=T)
  avg.bs <- c(avg.bs, mean(yStar)) }

quantile(avg.bs,c(.025,.975))

mean(x)-(quantile(avg.bs,.975)-mean(x))

mean(x)+(mean(x)-quantile(avg.bs,.025))




#4
library(car)
data("Ornstein")
Ornstein

p_glm=glm(interlocks~assets,family = poisson,data = Ornstein)
summary(p_glm)
