#1
x <- c(1,3,2,5)
x

#2
x = c(1,6,2)
x
y = c(1,4,3)

#3
length(x)
length(y)
x+y

#4
ls()
rm(x,y)
ls()

#5
rm(list = ls())

#6
x = matrix(data = c(1,2,3,4), nrow = 2, ncol = 2)
x

#7
x = matrix(data = c(1,2,3,4),2,2, byrow = TRUE)

#8
sqrt(x)
x^2

#9
x = rnorm(50)
y = x+rnorm(50, mean = 50, sd = .1)
cor(x,y)

#10
set.seed(1303)
rnorm(50)

#11
set.seed(3)
y = rnorm(100)
mean(y)
var(y)
sqrt(var(y))
sd(y)

#12
x = rnorm(100)
y = rnorm(100)
plot(x,y)
plot(x,y,xlab = 'this is the x-axis', ylab = 'this is the y-axis',main = 'Plot of X vs Y')

#13
pdf("Figure.pdf")
plot(x,y,col = 'green')
dev.off()

#14
x = seq(1,10)
x
x = 1:10
x
x = seq(-pi,pi,length = 50)

#15
y = x
f= outer(x,y,function(x,y) cos(y) / (1+x^2))
contour(x,y,f)
contour(x,y,f,nlevels = 45, add = T)
fa= (f-t(f))/2
contour(x,y,fa,nlevels = 15)

#16
image(x,y,fa)
persp(x,y,fa)
persp(x,y,fa,theta = 30)
persp(x,y,fa,theta = 30,phi = 20)
persp(x,y,fa,theta = 30,phi = 70)
persp(x,y,fa,theta = 30,phi = 40)
















