
#Please complete this set of exercises and turn in your code
#by class time on March 24th 

#############
# Exercise 1.
# Write a loop which calculates the finite sequence, 
# (1/2)+(1/2)^3+(1/2)^5+(1/2)^7 ... +(1/2)^99
#
#Write a function that has an argument K and calculates the
#sequence with largest power 2K+1.  For example, if you
#execute your function with an argument of 48, it will return
#the sum of the sequence above.

#######
for (k in 0:49) {
  print((1/2)^(2*k+1))
  
}
#######

finite_sum <- 0

for (i in seq(1, 99, by = 2)) {
  finite_sum <- finite_sum + (1/2)^i
}
cat("Finite sequence sum:", finite_sum, "\n")


######
Series=function(N) {
  k=0
  while(N > k){
    print((1/2)^(2*k+1))
    k=k+1
  }
  return(k)
}
######
  
calculate_sequence <- function(K) {
  finite_sum <- 0
  largest_power <- 2 * K + 1
  
  for (i in seq(1, largest_power, by = 2)) {
    finite_sum <- finite_sum + (1/2)^i
  }
  
  return(finite_sum)
}

  

#############
# Exercise 2.
# Write a function that keeps rolling a die until the 
# sum of the rolls exceeds 100 and returns the number 
# of rolls needed.

# Evaluate your function 3000 times and compute the 
# average number of rolls it took for the sum to exceed 100.

Die=function() {
   rolls= 0
   rollSum= 0
   while (rollsum < 100) {
       rollSum= rollSum + sample(1:6,1,replace=TRUE)
       rolls= rolls+1
     }
   return(rolls)
}

####
rolls=c()
for(num in 1:3000) {
  rolls=c(rolls,Die())
}

mean(rolls)
####

N <- 3000
total_rolls <- 0

for (i in 1:N) {
  total_rolls <- total_rolls + roll100()
}

# Compute the average number of rolls
average <- total_rolls / N

cat("Average number of rolls to exceed 100:", average, "\n")


#############
# Exercise 3.
# Write a function that counts the number of digits 
# in a given integer. 
#
# Hint: 578 has 3 digits and floor(578/10^3) is 0.
# Given an integer N, your loop should check 
# whether floor(N/10^k) is 0 for increasing values of 
# the integer k. Once it catches the 0, k will be the 
# answer.

digitcount <- function (N) {
  define_k
  insert_awesome_code_here
  return(k)
}


digcount=function(N) {
  k=0
  while(floor(N/10^k) != 0) {
    k=k+1
  }
  return(k)
}

####################
# Problem 4.
# The Game of Craps.
# The player throws a pair of dice.
# If the sum is 7 or 11, then she wins.
# If the sum is 2, 3, or 12, then she loses. 
# If the sum is anything else (say E), then she continues 
# throwing until 
#   she throws that number (E) again, in which case she wins;
#   or she throws a 7, in which case she loses.
# 
# Write code that plays the game 20,000 times and reports 
# the percentage of wins. Run it multiple times and observe the 
# percentages.


craps= function(){
  first.roll = sum(sample(1:6,size=2,replace=TRUE))
  if (any(c(7,11) == first.roll)) return("win")
  if (any(c(2,3,12) == first.roll)) return("lose")
  while (TRUE) {
    roll = sum(sample(1:6,size=2,replace=TRUE))
    if (roll == first.roll) return("win")
    if (roll == 7) return("lose")
  }
}

WinPerc = function() {
  return(sum(replicate(20000,craps()) == "win")/20000)
}


WinPerc()


