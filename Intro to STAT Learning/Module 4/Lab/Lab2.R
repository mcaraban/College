#Indexing Data

A <- matrix(1:16,4,4)
A

A[2,3]
A[c(1,3),c(2,4)]
A[1:3,2:4]
A[1:2,]
A[,1:2]
A[1,]
A[-c(1,3),]
A[-c(1,3),-c(1,3,4)]
dim(A)

#Loading Data

Auto <- read.table("Auto.data")
View(Auto)
head(Auto)
Auto <- read.table("Auto.data",header = T, na.strings = "?'",
                   stringsAsFactors = T)
View(Auto)
Auto <- read.csv("Auto.csv", na.strings = "?",
                 stringsAsFactors = T)
View(Auto)

dim(Auto)
Auto[1:4,]
Auto <- na.omit(Auto)
dim(Auto)

#Graphical and Numerical Summaries

plot(cylinders,mpg) #wrong

plot(Auto$cylinders, Auto$mpg)
attach(Auto)
plot(cylinders,mpg)
cylinders <- as.factor(cylinders)
plot(cylinders,mpg)
plot(cylinders,mpg, col = "red")
plot(cylinders,mpg, col = "red", varwidth = T)
plot(cylinders,mpg, col = "red", varwidth = T,
     horizontal = T)
plot(cylinders,mpg, col = "red", varwidth = T,
     xlab = "cylinders", ylab = "MPG")

hist(mpg)
hist(mpg,col = 2)
hist(mpg, col = 2, breaks = 15)

pairs(Auto)
pairs(
  ~ mpg + displacement + horsepower + weight + acceleration,
  data = Auto
)

plot(horsepower, mpg)
identify(horsepower, mpg, name)

summary(Auto)
summary(mpg)






