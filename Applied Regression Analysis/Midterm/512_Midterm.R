f=file.choose()
Taxes=read.table(f,header = T)
Taxes

apply(Taxes,2,mean)
apply(Taxes,2,var)
attach(Taxes)

par(mfrow=c(1,1))

Taxes1.lm=lm(SP ~ AV,data = Taxes)
summary(Taxes1.lm)
predict(Taxes1.lm,data.frame(AV=13.5),interval = "predict")
Pred1=predict(Taxes1.lm,interval = "predict")
T1=cbind(Taxes,Pred1)
Plot1 <- ggplot(T1, aes(AV, SP)) +
  geom_point() +
  stat_smooth(method = lm)+
  geom_line(aes(y = lwr), color = "red", linetype = "dashed")+
  geom_line(aes(y = upr), color = "red", linetype = "dashed")
Plot1

Taxes2.lm=lm(SP~-1+AV)
summary(Taxes2.lm)
predict(Taxes2.lm,data.frame(AV=13.5),interval = "predict")
Pred2=predict(Taxes2.lm,interval = "predict")
T2=cbind(Taxes,Pred2)
Plot2 <- ggplot(T2, aes(AV, SP)) +
  geom_point() +
  stat_smooth(method = lm)+
  geom_line(aes(y = lwr), color = "red", linetype = "dashed")+
  geom_line(aes(y = upr), color = "red", linetype = "dashed")
Plot2



Taxes3.lm=lm(log(SP)~AV)
summary(Taxes3.lm)
predict(Taxes3.lm,data.frame(AV=13.5),interval = "predict")
Pred3=predict(Taxes3.lm,interval = "predict")
Taxes3=Taxes
Taxes3$SP=log(Taxes3[,2])
T3=cbind(Taxes3,Pred3)
Plot3 <- ggplot(T3, aes(AV, SP)) +
  geom_point() +
  stat_smooth(method = lm)+
  geom_line(aes(y = lwr), color = "red", linetype = "dashed")+
  geom_line(aes(y = upr), color = "red", linetype = "dashed")
Plot3

###
Plot2=plot(AV,SP,main = "Regression")
abline(Taxes2.lm,col = "blue")
lwr2=Pred2[,2]
upr2=Pred2[,3]
lines(AV,lwr2,col = "red")
lines(AV,upr2,col = "red")
###

plot(AV,SP)

Taxes4.lm=lm(SP^.5~AV)
summary(Taxes4.lm)
predict(Taxes4.lm,data.frame(AV=13.5),interval = "predict")
Pred4=predict(Taxes4.lm,interval = "predict")
Taxes4=Taxes
Taxes4$SP=(Taxes4[,2])^.5
T4=cbind(Taxes4,Pred4)
Plot4 <- ggplot(T4, aes(AV, SP)) +
  geom_point() +
  stat_smooth(method = lm)+
  geom_line(aes(y = lwr), color = "red", linetype = "dashed")+
  geom_line(aes(y = upr), color = "red", linetype = "dashed")
Plot4



