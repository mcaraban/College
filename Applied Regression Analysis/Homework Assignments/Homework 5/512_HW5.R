f=file.choose()
TestScores=read.table(f)
colnames(TestScores)= c("GPA","ACT")
#3.3a
boxplot(TestScores$ACT)
#3.3b
model=lm(GPA~ACT, data = TestScores)
res=resid(model)
plot(res)
abline(0,0)
#3.3c
plot(fitted(model),res)
abline(0,0)
#3.3d
qqnorm(res)
qqline(res)
r=cor(TestScores$GPA,TestScores$ACT)
r

#3.3f
f=file.choose()
Scores=read.table(f)
colnames(Scores)= c("GPA","ACT","Intelligence","Percentile")
mod=lm(GPA~ACT, data = Scores)
res2=resid(mod)
plot(res2)
abline(0,0)
attach(Scores)
plot(Intelligence,res2)
abline(0,0)
plot(Percentile,res2)
abline(0,0)

#3.8a
f=file.choose()
CrimeRate=read.table(f)
colnames(CrimeRate)=c("Crime Rate","Diploma%")
stem(CrimeRate$`Diploma%`)
#3.8b
attach(CrimeRate)
model=lm(`Crime Rate`~ `Diploma%`)
res=resid(model)
boxplot(res)
#3.8c
plot(fitted(model),res)
abline(0,0)
#3.8d
qqnorm(res)
qqline(res)
r=cor(`Crime Rate`,`Diploma%`)
r

#3.15a
f=file.choose()
SolutionConc=read.table(f)
colnames(SolutionConc)=c("Concentration","Hours")
mod=lm(Concentration~Hours, data = SolutionConc)

#3.16a
plot(SolutionConc)

#3.16b
bc=boxcox(Concentration~Hours)
lamdba=bc$x[which.max(bc$y)]

#3.16c
Concentration=log10(SolutionConc$Concentration)
newmod=lm(Concentration~SolutionConc$Hours,)
newmod

#3.16d
plot(SolutionConc$Hours,Concentration)
abline(newmod)

#3.16e
plot(newmod)

#3.18a
f=file.choose()
ProdTime=read.table(f)
colnames(ProdTime)=c("Hours","Size")
attach(ProdTime)
plot(Size,Hours)
Prodmod=lm(Hours~Size)

#3.18b
Size=sqrt(Size)
NewProdMod=lm(Hours~Size)
NewProdMod

#3.18c
plot(Size,Hours)
abline(NewProdMod)

#3.18d
plot(NewProdMod)


