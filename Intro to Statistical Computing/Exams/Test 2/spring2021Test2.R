
#####################################################
# 2021 Spring STAT 255 - Exam 2
#
#
# NAME: 
#
#####################################################



# Problem 1. The two parts of this problem both use the built-in dataset
# 'mtcars'.
#
# Part a) Two variables in the mtcars dataset are horsepower (hp) and
# miles per gallon (mpg).  Use the lm() function to fit a linear model to these 
# data where mpg is the dependent variable (ie y) and hp is the independent 
# variable. (ie x). Then produce a plot with the data points along with the 
# regression line.

x=mtcars$hp
y=mtcars$mpg
lm(y~x)
plot(x,y, xlab = "Horsepower", ylab = "MPG", main = "Horsepower vs MPG")
abline(lm(y~x))


# Part b}  Using mtcars again, perform a t-test to compare the mean weight (wt)
# between cars with 6 cylinders and those with 8 cylinders.  Perform the
# hypothesis test using the alternative that cars with less cylinders should
# weigh less on average.

x=mtcars$wt
SixWt=x[which(mtcars$cyl==6)]
EightWt=x[which(mtcars$cyl==8)]
t.test(SixWt,EightWt,alternative = "less")



# Problem 2. COnsider the following simple game

dice <- sample(1:6, 2, replace=TRUE)
if (dice[1] == dice[2]) { win <- 8
} else if (dice[1] < dice[2])  { win <- -1
} else {win<--2}

# a) Write a function called playgame which plays the game one time and returns
#    the quantity win

playgame <- function() {
  dice <- sample(1:6, 2, replace = TRUE)
  
  if (dice[1] == dice[2]) {
    win <- 8
  } else if (dice[1] < dice[2]) {
    win <- -1
  } else {
    win <- -2
  }
  
  return(win)
}

# b) Write a function called simgame that has an argument of the number of times 
#    played and returns the average value of win for these plays.

Simgame <- function(N) {
  total_win <- 0
  
  for (k in 1:N) {
    total_win <- total_win + playgame()
  }
  
  average_win <- total_win / N
  return(average_win)
}


# C) Run your simgame function with argument 10000.  Does output of your
#    simulation make you believe that this game is a long run winner for the player? 

Simgame(10000)


# Problem 3
# The following function attempts to find the median of a numerical vector.  However it is 
# not working correctly.  Your job is to find and fix the mistake.

mymedian = function(v) {
  sortedv = sort(v)
  a=length(v)
  if (a %% 2 == 1) {
    return(sortedv[(a-1)/2])
  } else {
    return(mean(sortedv[c(a/2,a/2+1)]))
  } 
}

#Corrected 

mymedian = function(v) {
  sortedv = sort(v)
  a=length(v)
  if (a %% 2 == 1) {
    return(sortedv[(a+1)/2])
  } else {
    return(mean(sortedv[c(a/2,a/2+1)]))
  } 
}




# Problem 4.
# On day 1, you have 500 dollars in an account. 
#
# On each one of the following days, you randomly decide to 
# either withdraw or deposit 10% of the previous day's 
# account balance.
#
# When the account balance goes below 300 or above 700 dollars, 
# you will close the account.
#
# Complete the blank (...) parts in the following code so that 
# the function returns the number of days the account remains open.

d <- function (bal) {
  # bal is the initial account balance on day 1
  days <- 1
  while ( bal > 300 & bal < 700 ) {
    bal <- bal + sample(c(-0.1, 0.1), 1) * bal
    days <- days+1
    if (bal < 300 | bal > 700) {
      break
    }
  }
  cat("Final Balance: $", round(bal, 2), "\n")
  cat("Days the Account is Open: ", days, "\n")
} 

d(500)



########## End of the exam



