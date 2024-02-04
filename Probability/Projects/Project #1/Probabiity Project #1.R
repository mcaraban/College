#Task 1

#a
y = 3*7^2+5
y

#b
x = c(2, -7, -1, 3, 8, 10, -5)
sum(x)
sum(x^2)
length(x)
sum(x)/length(x)
mean(x)
sum(x-mean(x))
sum((x-mean(x))^2)

#c
MyFunction<-function(x)
{
  Y<-3*x^2+5
  return(Y)
}

#d
MyFunction(7)
MyFunction(7:11)

#e
xx<-seq(0, 7, length=200)
plot(xx, MyFunction(xx), type="l", main="Plotting MyFunction",
     xlab="x-values", ylab="Y=f(x)")

#Task 2

#a
MHW<- read.table('MHW.txt', header=TRUE, sep = ',')

#b
head(MHW)

#c
MHW[1:10,]

#d
attach(MHW)


#Task 3

#a
summary(MHW)
summary(grain)
summary(straw)

#b

min(grain)
max(grain)
mean(grain)
median(grain)
var(grain)
sd(grain)
quantile(grain)
IQR(grain)

min(straw)
max(straw)
mean(straw)
median(straw)
var(straw)
sd(straw)
quantile(straw)
IQR(straw)

#c
yield.ratio = grain/straw
summary(yield.ratio)


#Task 4

#a
stem(grain)

#b
hist(grain)

#c
hist(straw,  nclass=30,  col  =  "lightblue", 
     border  =  "red",  main  =  "The MHW Data", 
     xlab  =  "Straw  yield per plot")

hist(grain,  breaks  =  seq(2.6,  5.2,  by  =  0.1),
     col  =  "lightblue", border  =  "red",  
     main  =  "The MHW Data", xlab  =  "Grain  yield per plot")





