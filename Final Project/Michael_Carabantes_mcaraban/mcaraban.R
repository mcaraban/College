#1
f=file.choose()
ais=read.table(f,header = T)
library(dplyr)
ais_mc=sample_n(ais,size = 25)
dim(ais_mc)


#2
install.packages('fastDummies')
library('fastDummies')
ais_mc <- dummy_cols(ais_mc, select_columns = 'Sex')
ais_mc <- dummy_cols(ais_mc, select_columns = 'Sport')

#3
summary(ais_mc)
colSums(ais_mc[,14:24])

#4
library(tidyverse)
#box plots
ggplot(ais_mc,aes(x=Sex,y=BMI))+geom_boxplot()
ggplot(ais_mc,aes(x=Sex,y=LBM))+geom_boxplot()
#scatter plots
ggplot(ais_mc,aes(x=BMI,y=LBM,colour=Sex))+
  geom_point()
ggplot(ais_mc,aes(x=Ht,y=Wt,colour=Sex))+
  geom_point()
#histograms
ggplot(ais_mc,aes(x=BMI))+geom_histogram(bins=10)
ggplot(ais_mc,aes(x=LBM))+geom_histogram(bins=10)
ggplot(ais_mc,aes(x=Ht))+geom_histogram(bins=10)
ggplot(ais_mc,aes(x=Wt))+geom_histogram(bins=10)

#5
MBMI=ais_mc[which(ais_mc$Sex=='male'),'BMI']
length(MBMI)
FBMI=ais_mc[which(ais_mc$Sex=='female'),'BMI']
length(FBMI)
mean(MBMI)
mean(FBMI)
mean(MBMI)-mean(FBMI)
t.test(MBMI,FBMI,conf.level = .95)

#6
Model=lm(LBM~BMI,data = ais_mc)
summary(Model)
ggplot(ais_mc,aes(x=BMI,y=LBM))+
  geom_point()+geom_smooth(method="lm")

#7
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

MaleBMI=sample(MBMI,4)
FemaleBMI=sample(FBMI,4)
z=c(MaleBMI,FemaleBMI)
thetahat=mean(MaleBMI)-mean(FemaleBMI)
n=length(MaleBMI);m=length(FemaleBMI);N=m+n
perm=permutations(N)
thetahatstars=data.frame(t(perm))%>%map(~.x%in%(1:n))%>%bind_cols()%>% 
  map_dbl(~mean(z[.x])-mean(z[!.x]))
#p-value
mean(abs(thetahatstars)>=abs(thetahat))

#8
Actual.meandiff=abs(mean(MBMI)-mean(FBMI))
n=length(ais_mc$Sex)
B=1000
ais_mc = ais_mc %>% arrange(desc(Sex))
m=ais_mc$BMI

#Bootstrap Samples Matrix
BootStrap=matrix(sample(m,size = n*B,replace = T),nrow = n,ncol = B)
Boot.mean=rep(0,1000)
for (i in 1:B) {
  Boot.mean[i]=abs(mean(BootStrap[1:14,i])-mean(BootStrap[15:25,i]))
  
}

#p-value
mean(Boot.mean >= Actual.meandiff)





















