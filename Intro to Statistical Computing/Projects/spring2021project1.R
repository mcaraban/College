# Project 1 - due Wednesday 2/17 before class


# YOUR NAME: 
#MichaelCarabantes

# Please answer the following questions with R code.



############
# Problem 1.
# We will use the dataset state.x77 given as a matrix.

w <- state.x77
x=data.frame(w)

# Find the average life expectancy among the states 
# where more than 60% graduated high school.

m=x[x[6]>60,]
avg60=mean(m[,4])

# Repeat for the states where less than 40% graduated 
# high school.
w <- state.x77
x=data.frame(w)
n=x[x[6]<40,]
avg40=mean(n[,4])


# Find the average income per capita in the U.S. (for 
# all states). Be careful here! States have different 
# populations.
w <- state.x77
x=data.frame(w)
IpC=x[2]/x[1]
AIpC=mean(IpC[,1])


# Create a vector that has a first column which contains the state names and a 
# second column which is one of the character strings "Lower", "Middle", "Upper"
# depending on which third it is in terms of population.  Modify the state.x77
# matrix to have an additional column which contains the "Lower", "Middle", 
# "Upper" character strings.
w <- state.x77
x=data.frame(w)
Pmean=mean(x[,1])
Bound=Pmean/3
upperbound=Pmean+Bound
lowerbound=Pmean-Bound

Upper=which(x[,"Population"] >= upperbound)
Lower=which(x[,"Population"] <= lowerbound)
Middle=which((x[,"Population"] >= lowerbound) & (x[,"Population"] <= upperbound))
Distribution=1:50
Distribution[Lower]="Lower"
Distribution[Middle]="Middle"
Distribution[Upper]="Upper"
cbind(x,Distribution)

# Find the average life expectancy for the states that are
# classified as "Lower".
AvgLower=mean(x[Lower,"Life.Exp"])


# Repeat for the states that are classified as either "middle" or "Upper".

AvgMid=mean(x[Middle,"Life.Exp"])
AvgUpper=mean(x[Upper,"Life.Exp"])



############
# Problem 2.
# For this problem we need to load a new dataset. 
# To do this, click on Tools and select install packages.  
# Then enter the name ISLR and click install.

# Next, run the following to load the package. 

library(ISLR)

# One of the datasets in that package has some 
# statistics about a large number of colleges in the U.S. 
# Run the following and observe the dataframe.

?College
str(College)
z <- College
head(z,10)

# Write commands answering the following questions.
# No manual counting!

# What is the row number of the University of Southern Indiana?
z <- College
USI=z[680,]


# What is the graduation rate at the University of Southern Indiana?
# Write 3 different ways of finding this.
z <- College
z[680,18]
College$Grad.Rate[680]
z[-c(1:679,681:777),-c(1:17)]

# Among all the public colleges in the dataset, 
# what is the average graduation rate?
z <- College
Public=which(z[,"Private"]=="No")
AvgPublic=mean(z[Public,"Grad.Rate"])


# Create a vector called accept_rate that gives the 
# acceptance rate for each college as a percentage 
# (100*accepted/applications)
# and attach it as a new column (variable) to the 
# end of the dataframe z.
z <- College
Accept_Rate=100*(z[3]/z[2])
cbind(z,Accept_Rate)

# Create a dataframe that just includes the colleges that are
# in the top 10% in terms of PhD's, Grad.Rate and Enrollment.
x=length(College$PhD) 
PhDL=round(x*.1,0)
w=length(College$Grad.Rate)
GRL=round(w*.1,0)
y=length(College$Enroll)
EL=round(y*.1,0)
s=intersect(College$Grad.Rate,College$Enroll)
t=intersect(s,College$PhD)
Distribution=1:777
Distribution[t]="Top"
Distribution[-t]="No"
cbind(z,Distribution)

# Randomly select 20 colleges and compute their median 
# room and board costs.
z <- College
RandomCollege=sample(College$Room.Board,20)
median(RandomCollege)




