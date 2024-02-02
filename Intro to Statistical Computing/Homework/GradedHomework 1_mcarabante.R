# For each question below, write code to perform the task described.
# Write the code under each question and submit the file via Bb by
# the beginning of class on Feb. 8th


# Question 1: Create a vector called X1 which contains the odd integers
# from 1 to 99.  Using x1, create a vector called x11 which is a random 
# sample (with replacement) of size 10 from x1.  Create a new vector called
# x111 which contains the three largest values from x11.  Create a single 
# character which consists of the minimum and maximum value in x111
# separated by "&&".

x1=seq(1,99,2)
x11=sample(x1,10,replace=TRUE)
c=sort(x11,decreasing = FALSE)
n=length(x11)
x111=c(c[n],c[n-1],c[n-2])
max=max(x111)
min=min(x111)
paste(min, max, sep="&&")

#5/5

# Question 2: Write code which creates a vector called name1
# which containing the letters of your first name, with the first letter
# capitalized, by extracting letters from the two built-in "letters"
# vectors.  Create a character string called name2 which 
# consists of your first name.  Create a second character string
# called namemixedup which is a random reordering of your first name. 


name1=c(LETTERS[13],letters[9],letters[3],letters[8],letters[1],letters[5],letters[12])
name2=paste(name1,collapse = '')
namemixedup=sample(name1,7)

#5/5


# Question 3: Consider the collection of all possible 8-character 
# passwords that contain: 
#   exactly one capital letter,
#   exactly 2 digits from 0-9, and
#   5 lowercase letters,
# without any spaces. For example, 5tGhfbc7, y3hg9Qee, etc.
# Write code that randomly selects one such password and then
# creates a character string with each symbol on the password
# separates by a "-".

Capital= LETTERS
Lowercase= letters
digits= 0:9
RandomCapital=sample(Capital,1)
RandomDigit=sample(digits,2)
RandomLowercase=sample(Lowercase,5)
Combination=c(RandomCapital, RandomDigit,RandomLowercase)
Password=sample(Combination,8)
paste(Password,collapse = "-")

#5/5

