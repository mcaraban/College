f=file.choose()
Scores=read.table(f,header = FALSE)
colnames(Scores)=c("GPA","ACT")

#1
Scores.lm=lm(GPA~ACT-1,data = Scores)
#2
conf.Scores=confint(Scores.lm,level = .95)
conf.Scores
#3
predict(Scores.lm,data.frame(ACT=30),level = .95,interval = "prediction")

#4

plot(Scores[,2],Scores[,1],xlab = "ACT",ylab = "GPA")
abline(Scores.lm)

#5
Scores.lm$residuals
sum(Scores.lm$residuals)
plot(Scores.lm)

#6
alpha=.05
n=length(ACT)
a=unique(ACT)
F.test=qf(1-alpha,a-1,n-a)
anova



