###########################################################
# Spring 2021 - Stat 255 - Final Exam
#
#
# NAME: Michael Carabantes
#
###########################################################


# Problem 1.
# Consider the R code where x is a vector of numerical values

x=c(1:5)

j <- 1
y <- 0
while (j <= length(x)) {
  if (x[j] > 2) y <- y + x[j]
  j <- j+1
}
print(y)


# 1a) Describe what the code is doing to the vector x. It may be helpful 
#     to run the code on a few example x vectors. 

"The code is taking a vector and adding each index to each other if the 
value within the index is greater than 2 and returing the resulting value.
In this example vector of numbers 1 through 5, numbers 3,4, and 5 are all added 
together to return the sum of 12."
#
# 1b) Produce new code that performs the same operation but uses
#     a for loop instead of a while loop.

y <- 0

for(j in 3:length(x)) {
  if (x[j] > 2) {
    y <- y + x[j]
  }
}
  print(y)
  
  #
  # 1c) Produce a single line of code that performs the same operation
  #     without using a loop.
  
x_sum=sum(x[x>2])
  
  
  # Problem 2.
  # Given a vector x of length n (greater than 7), 
  # write a code that computes the sum 
  #   x[7]+x[14]+x[21]+... 
  # using which(), sum() and the %% operator.
  # (do not use a loop for this one)

x = 1:20

result_sum <- sum(x[which((1:length(x)) %% 7 == 0)])

# Problem 3.
#Let z be a matrix of numerical values with 5 rows and 6 columns. Write commands that 
#perform the following tasks without changing the original matrix z.

#It may be helpful to test your commands on a test vector like

z = matrix(sample(1:30,30),nrow=5)

#2a) Extract the first 3 rows of z and assign them to za.

za=head(z,3)

#2b) Extract the last 3 columns of z and assign them to zb.
zb=tail(z,c(5,3))

#2c) Create a vector zc which consists of the last three entries in the 4th row.
zc <- tail(z[4, ], 3)

#2d) Create row labels of row1,row2,row3,row4 and row5 and assign the new matrix to zd.
row.names(z)=c("row1","row2","row3","row4","row5")
zd=z

#2e) multiple row 1 by row 3 termwise, add the values together and assign this value to ze
ze=sum(z[1,]*z[3,])

# Problem 4
# Two data structures we have discussing this semester are matrices and dataframes.  All matrices can be 
# converted to a dataframe but some dataframes cannot be converted to a matrix.  Give two reasons this is
# true. In other words, give two reasons why dataframes can be used in some cases where matrices cannot.

#Dataframes allow for different data types to exist in different columns while in
#matrices the data must all be the same data type. Dataframes can also act as a list 
#and a matrix and are better for processing data.

# Problem 5
# Consider the dataset "Orange" in R

?Orange

# There are two variables in Orange called "age" and "circumference".


# 5a) Use the lm() function to fit a linear model to these 
# data where age is the dependent variable (ie y) and circumference is the independent 
# variable. (ie x). Then produce a plot with the data points along with the 
# regression line.

y=Orange$age
x=Orange$circumference
lm(y~x)
plot(x,y,xlab = "Circumference", ylab = "Age", main = "Age vs Circumference")
abline(lm(y~x))


# 5b) Produce a histogram of the circumference with 7 break points and the bars shaded in blue.
#     Note: Getting exactly seven break points will take some extra work.

x=Orange$circumference
hist(x,breaks = seq(min(x),max(x),length.out= 7), xlab = "Circumference", main = 
       "Histogram of Circumference", col = "lightblue")

# Problem 6. 
#In this question you will be writing a simulation that approximates the area under a parabola.

# Consider the code below which produces a random point in the unit square and then checks if it is 
# below the parabola y=x^2. It returns a one if it is and a zero if it is not.

randomx = runif(1,0,1)
randomy = runif(1,0,1)
ifelse (randomy < randomx^2,1,0)


# Use this code to write a function, called indicate, which generates a point in the unit
# square and returns a one if the point is below the parabola and a zero if it is not.

indicate=function(){
  randomx = runif(1,0,1)
  randomy = runif(1,0,1)
  ifelse (randomy < randomx^2,1,0)
} 

indicate()


# Write a function, called mysim, with an argument of the number of iterations the simulation
# will perform and an output of the percent of those iterations that fell below 
# the parabola.  Note: your output is the approximate area under the parabola so should 
# be close to 1/3 when you run a simulation with a large number of iterations.


mysim <- function(N) {
  Below <- sum(replicate(N, indicate()))
  percent <- Below / N
  return(percent)
}

#Bonus question: use this idea to approximate Pi

Pi <- function(N) {
  # Generate random points in a square [0,1] x [0,1]
  x <- runif(N)
  y <- runif(N)
  
  # Count points within the quarter circle (x^2 + y^2 <= 1)
  points <- x^2 + y^2 <= 1
  count_within_circle <- sum(points)
  
  # Approximate Pi using the ratio of points within the quarter circle to total points
  pi_approx <- 4 * count_within_circle / N
  
  return(pi_approx)
}



