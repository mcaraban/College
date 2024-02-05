library(tidyverse)
f=file.choose()
fullBumpus=read_table(f)
#1a
with(fullBumpus,t.test(Weight[Survive==1],
                     Weight[Survive==0],
                     var.equal=TRUE))

with(fullBumpus,t.test(Weight[Survive==1],
                       Weight[Survive==0],
                       var.equal=FALSE))

#1b
res = resid(lm(Weight~Survive, fullBumpus))
source("http://www.stat.cmu.edu/~hseltman/files/qqn.R")
qqn(res)

#1c
with(fullBumpus, boxplot(Weight~Survive))

#1d
f=file.choose()
FakeCor=read_table(f)
with(FakeCor, boxplot(WeightA~Nest))
with(FakeCor, boxplot(WeightB~Nest))

#2a
mdl = lm(Alar~Female+Weight, data=fullBumpus)
summary(mdl)

#2b
b0M = mdl$coefficients[1]
b0M
b0F = mdl$coefficients[1] + mdl$coefficients[2]
b0F
b1 = mdl$coefficients[3]
b1

#2c
with(fullBumpus, table(Female, as.numeric(Female)))
with(fullBumpus, plot(Alar~Weight, pch=as.numeric(Female),
                   col=as.numeric(Female), main="Bumpus"))
abline(b0M, b1, col=1, lty=1)
abline(b0F, b1, col=2, lty=2)
legend(28, 240, c("Male", "Female"), col=1:2, lty=1:2, pch=1:2)

with(fullBumpus, plot(resid(mdl)~fullBumpus$Weight, col=as.numeric(fullBumpus$Female),
     pch=as.numeric(fullBumpus$Female)))
abline(h=0)

#2d
mdlI = lm(Alar~Female*Weight, data=fullBumpus)
summary(mdlI)
b0M = mdlI$coefficients[1]
b0M
b0F = mdlI$coefficients[1] + mdlI$coefficients[2]
b0F
b1M = mdlI$coefficients[3]
b1M
b1F = mdlI$coefficients[3] + mdlI$coefficients[4]
b1F
with(fullBumpus, plot(Alar~Weight, pch=as.numeric(Female),
                   col=as.numeric(Female), main="Bumpus"))
abline(b0M, b1M, col=1, lty=1)
abline(b0F, b1F, col=2, lty=2)
legend(28, 240, c("Male", "Female"), col=1:2, lty=1:2, pch=1:2)

#2e
anova(mdl,mdlI)

#2f
confint(mdlI)



