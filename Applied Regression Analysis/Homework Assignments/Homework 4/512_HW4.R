x=c(4,8,10,12,16,20)
x
e=c(rnorm(6,0,5))
e
y=20+4*x+e
y
mod=lm(y~x)
mod
pred <- predict(mod, data.frame(x = 14), interval = "confidence")
pred

x
MySamples=replicate(2000,rnorm(6,0,5))
y2=20+4*x+MySamples
t(y2)
mod2=lm(y2~x)
t(coefficients(mod2))
pred2 <- predict(mod2, data.frame(x = 14), interval = "confidence")
pred2 <- setNames(c(pred2), dimnames(pred2)[[2]])
t(pred2)



hist(MySamples, right = FALSE, xlab = "Sample proportion")

mean(t(coefficients(mod2)[2,]))
sd(t(coefficients(mod2)[2,]))

76+mean(t(coefficients(mod2)[2,]))
76-mean(t(coefficients(mod2)[2,]))

mean(71.98672 < pred2 & 80.01328 > pred2)

