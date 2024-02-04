#7.5a
f=file.choose()
Satisfaction=read.table(f)
colnames(Satisfaction)=c('Y','X1','X2','X3')
SatModelX2=lm(Y~X2,data = Satisfaction)
summary(SatModelX2)
AnovaX2=anova(SatModelX2)
SSRX2=AnovaX2$`Sum Sq`[1]
SatModelX1UX2=lm(Y~X1+X2, data = Satisfaction)
summary(SatModelX1UX2)
AnovaX1UX2=anova(SatModelX1UX2)
AnovaX1UX2
SSRX2gX1=AnovaX2$`Sum Sq`[2]-AnovaX1UX2$`Sum Sq`[3]
SatModelX1UX2UX3=lm(Y~X1+X2+X3,data = Satisfaction)
summary(SatModelX1UX2UX3)
AnovaX1UX2UX3=anova(SatModelX1UX2UX3)
AnovaX1UX2UX3
SSRX3gX1X2=AnovaX1UX2$`Sum Sq`[3]-AnovaX1UX2UX3$`Sum Sq`[4]

#7.5b
SSE=AnovaX1UX2UX3$`Sum Sq`[4]
Fstar=(SSRX3gX1X2/1)/(SSE/42)
Fstar
F=qf(.975,1,42)
F
pvalue=AnovaX1UX2UX3$`Pr(>F)`[3]
pvalue



#7.7a
f=file.choose()
CommercialProp=read.table(f)
colnames(CommercialProp)=c('Y','X1','X2','X3','X4')
PropmodX4=lm(Y~X4,data = CommercialProp)
summary(PropmodX4)
AnovaX4=anova(PropmodX4)
AnovaX4
SSRX4=AnovaX4$`Sum Sq`[1]
SSRX4
PropmodX1UX4=lm(Y~X1+X4, data = CommercialProp)
summary(PropmodX1UX4)
AnovaX1UX4=anova(PropmodX1UX4)
AnovaX1UX4
SSRX1gX4=AnovaX4$`Sum Sq`[2]-AnovaX1UX4$`Sum Sq`[3]
SSRX1gX4
PropmodX1UX2UX4=lm(Y~X1+X2+X4,data = CommercialProp)
summary(PropmodX1UX2UX4)
AnovaX1UX2UX4=anova(PropmodX1UX2UX4)
AnovaX1UX2UX4
SSRX2gX1X4=AnovaX1UX4$`Sum Sq`[3]-AnovaX1UX2UX4$`Sum Sq`[4]
SSRX2gX1X4
PropmodX1UX2UX3UX4=lm(Y~X1+X2+X3+X4,data = CommercialProp)
summary(PropmodX1UX2UX3UX4)
AnovaX1UX2UX3UX4=anova(PropmodX1UX2UX3UX4)
AnovaX1UX2UX3UX4
SSRX3gX1X2X4=AnovaX1UX2UX4$`Sum Sq`[4]-AnovaX1UX2UX3UX4$`Sum Sq`[5]
SSRX3gX1X2X4

#7.7b
SSE=AnovaX1UX2UX3UX4$`Sum Sq`[5]
Fstar=(SSRX3gX1X2X4/1)/(SSE/76)
Fstar
F=qf(.99,1,76)
F
pvalue=AnovaX1UX2UX3UX4$`Pr(>F)`[4]
pvalue

#7.6
SatModelX1=lm(Y~X1,data = Satisfaction)
summary(SatModelX1)
AnovaX1=anova(SatModelX1)
AnovaX1
SSEX1=AnovaX1$`Sum Sq`[2]
SSEX1
SSRX2X3gX1=SSEX1-SSE
Fstar=(SSRX2X3gX1/2)/(SSE/42)
Fstar
F=qf(.975,1,42)
F
pvalue=AnovaX1UX2UX3$`Pr(>F)`[3]
pvalue

#7.8
SSE=AnovaX1UX2UX3UX4$`Sum Sq`[5]
SSRX2X3gX1X4=AnovaX1UX4$`Sum Sq`[3]-SSE
SSRX2X3gX1X4
Fstar=(SSRX2X3gX1X4/2)/(SSE/76)
Fstar
F=qf(.99,2,76)
F
pvalue=AnovaX1UX2UX3UX4$`Pr(>F)`[4]
pvalue

#7.9
SatModelRed=lm(Y+X1~X3,data = Satisfaction)
summary(SatModelRed)
AnovaRed=anova(SatModelRed)
AnovaRed
SSERed=AnovaRed$`Sum Sq`[2]
F_star=((SSERed-SSE)/2)/(SSE/42)

#7.10
PropmodRed=lm(Y ~ I(-.1*X1)+I(.4*X2)+X3+X4,data = CommercialProp)
AnovaRed=anova(PropmodRed)
SSE=AnovaX1UX2UX3UX4$`Sum Sq`[5]
SSERed=AnovaRed$`Sum Sq`[3]



#7.27
PropmodX3=lm(Y~X3,data = CommercialProp)
AnovaX3=anova(PropmodX3)
AnovaX3
PropmodX3UX4=lm(Y~X3+X4,data = CommercialProp)
AnovaX3UX4=anova(PropmodX3UX4)
AnovaX3UX4
SSRX4gX3=AnovaX3$`Sum Sq`[2]-AnovaX3UX4$`Sum Sq`[3]
SSRX4gX3
SSRX4=AnovaX4$`Sum Sq`[1]
SSRX4

PropmodX1=lm(Y~X1,data = CommercialProp)
AnovaX1=anova(PropmodX1)
AnovaX1
PropmodX1UX3=lm(Y~X1+X3,data = CommercialProp)
AnovaX1UX3=anova(PropmodX1UX3)
AnovaX1UX3
SSRX1gX3=AnovaX3$`Sum Sq`[2]-AnovaX1UX3$`Sum Sq`[3]
SSRX1gX3
SSRX1=AnovaX1$`Sum Sq`[1]
SSRX1

cor(CommercialProp)

#8.10


X1=-10:10 
X2=-10:10
y<-matrix(nrow=length(X1),ncol=length(X2))
for(i in 1:length(X1))
{ for(j in 1:length(X2))
{ y[i,j]=2+4*X1[i]+10*X2[j]+5*X1[i]*X2[j] } }
contour(X1,X2,y)

#8.13


Y=25.3+.2*x1-12.1*x2

#8.16b
f=file.choose()
GPA=read.table(f)
colnames(GPA)=c('Y','X1')
f=file.choose()
Major=read.table(f)
colnames(Major)='X2'
GPA=cbind(GPA,Major)
GpaMod=lm(Y~X1+X2,data = GPA)
summary(GpaMod)

#8.16c
GPAanovaX1UX2=anova(GpaMod)
anova(GpaMod)
SSE=GPAanovaX1UX2$`Sum Sq`[3]
GpaModX1=lm(Y~X1,data = GPA)
summary(GpaModX1)
GPAanovaX1=anova(GpaModX1)
GPAanovaX1
SSRX1gX2=GPAanovaX1$`Sum Sq`[2]-SSE
SSRX1gX2
Fstar=(SSRX1gX2/1)/(SSE/117)
Fstar
F=qf(.99,1,117)
F

#8.16d
res=residuals(GpaMod)
X1X2=GPA$X1*GPA$X2
plot(X1X2,res)


#8.19
f=file.choose()
Copier=read.table(f)
colnames(Copier)=c('Y','X1')
f=file.choose()
Copier2=read.table(f)
colnames(Copier2)='X2'
CopMain=cbind(Copier,Copier2)
CopMainmod=lm(Y~X1+X2,data = CopMain)
summary(CopMainmod)
CopMainMod=lm(Y~X1+X2+X1*X2,data = CopMain)
summary(CopMainMod)

#8.20a
GPAMod=lm(Y~X1+X2+X1*X2,data = GPA)
summary(GPAMod)

#8.20b
AnovaX1X2=anova(GPAMod)
AnovaX1X2
SSE=AnovaX1X2$`Sum Sq`[4]
SSE
SSRX1X2gX1X2=GPAanovaX1UX2$`Sum Sq`[3]- AnovaX1X2$`Sum Sq`[4]
SSRX1X2gX1X2
Fstar=(SSRX1X2gX1X2/1)/(SSE/117)
Fstar
F=qf(.95,1,117)
F








