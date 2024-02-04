#3

Diamonds=read.table("Diamonds.txt", header = T)
Diamonds=Diamonds[-49,]
Diamonds=Diamonds[order(Diamonds$W),]
Diamonds

plot(Diamonds$W, Diamonds$P, main="Diamond Study", xlab="Weight (Carats)"
      , ylab="Price ($$)")
lm.out=lm(P ~ W, data = Diamonds)
abline(lm.out)
summary(lm.out)

#5
library(readxl)

CDI=read_xlsx('cdi.xlsx')
CDI=CDI[,c(5,8,9,16)]
attach(CDI)

Population_Model = lm(physicians ~ pop)
Bed_Model = lm(beds ~ pop)
Income_Model = lm(total_income ~ pop)

R2= c("Population" = summary(Population_Model)$r.square,
      "Beds" = summary(Bed_Model)$r.square,
      "Income" = summary(Income_Model)$r.square)
R2


