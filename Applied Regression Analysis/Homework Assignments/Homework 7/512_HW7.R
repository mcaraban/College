f=file.choose()
Properties=read.table(f)
colnames(Properties)=c('Y','X1','X2','X3','X4')

#6.18a
stem(Properties$X1)
stem(Properties$X2)
stem(Properties$X3)
stem(Properties$X4)

#6.18b
plot(Properties)
cor(Properties)

#6.18c
model=lm(Y~X1+X2+X3+X4,data = Properties)

#6.18d
res=resid(model)
boxplot(res)

#6.18e
plot(fitted(model),res)
plot(Properties$X1,res)
plot(Properties$X2,res)
plot(Properties$X3,res)
plot(Properties$X4,res)
plot(Properties$X1*Properties$X2,res)
plot(Properties$X1*Properties$X3,res)
plot(Properties$X1*Properties$X4,res)
plot(Properties$X2*Properties$X3,res)
plot(Properties$X2*Properties$X4,res)
plot(Properties$X3*Properties$X4,res)
plot(model)

#6.18g
Properties=cbind(Properties,fitted(model))
colnames(Properties)=c('Y','X1','X2','X3','X4','fitted')
attach(Properties)
Properties2=Properties[order(Properties$fitted),]
Properties3=data.frame(Properties2,Group = as.factor(rep(c("1","2"),times = c(40,41))))
bf.test(Y~Group,data = Properties3)

#6.19a
SSE=sum(model$residuals^2)
MSE=SSE/76
MSE
SST=var(Properties$Y)*(nrow(Properties-1))
SSR=SST-SSE
MSR=SSR/4
MSR
Fstar=MSR/MSE
Fstar
F=qf(.95,4,76)
F

#6.19b

confint(model,level = 1-.05/4)


#6.19c
R2=SSR/SST
R2

#6.20
f=file.choose()
Properties4=read.table(f)
colnames(Properties4)=c('X1','X2','X3','X4')

predict(model,Properties4,interval="confidence",level = 1-.05/4)


#6.21
f=file.choose()
Properties6=read.table(f)
colnames(Properties6)=c('X1','X2','X3','X4')
predict(model,Properties6,interval = "predict",level = .95)
                       
#3a
f=file.choose()
MathSal=read.table(f, header = F, sep = "")
colnames(MathSal)=c('Y','X1','X2','X3')
model=lm(Y~X1+X2+X3,data = MathSal)
MathSal=cbind(MathSal,fitted(model))
colnames(MathSal)=c('Y','X1','X2','X3','fitted')
SSE=sum(model$residuals^2)
MSE=SSE/20
MSE
SST=var(MathSal$Y)*(nrow(MathSal-1))
SSR=SST-SSE
MSR=SSR/3
MSR
Fstar=MSR/MSE
Fstar
F=qf(.95,3,20)
F

pf(Fstar,3,20,lower.tail = FALSE)
R2=SSR/SST
R2

#3b
confint(model,level = .95)

#3c
res=resid(model)
plot(fitted(model),res)
plot(MathSal$X1,res)
plot(MathSal$X2,res)
plot(MathSal$X3,res)

#3d
hist(res)
plot(model)

#3e
predict(model,data.frame(X1=6.2,X2=8,X3=5.9),level = .95,interval = "prediction")

                       
                  


