#Question One

#Let z be a vector of 10 or more observations. Write commands that 
#perform the following tasks without changing the original z.  Call the 
#new vectors za,zb,zc, ...

#It may be helpful to test your commands on a test vector like

z<-sample(-10:10,15)

#a) Extract the first 5 entries of z and assign them to za.
za=head(z,5)

#b) Extract the last 5 entries of z and assign them to zb.
zb=tail(z,5)

#c) Attach the value 50 to the end of z and assign the result to zc.
zc=append(z,50)

#d) Add the value 50 between the 7th and 8th entry of z and assign 
# the result to zd
zd=c(z[1:7],50,z[8:(length(z))])

#e) Change the negative entries of Z to the value 99 and assign the result to ze.
ze=ifelse(z < 0,99,z)

#f) Extract the odd indexed entries of z and assign the result to zf.
zf <- z[seq(1, length(z), 2)]

#Question Two

#a) Write a function that evaluates a piecewise defined function.  The 
#function returns 3w+1 if -2<w<3 and -2w+4 if w >= 3.  If the function is 
#evaluated on a number not in either of these ranges, the function returns 
#the message, "The number (insert number entered here) is not in the domain".
#For example, if you evaluated myfun(-4), the function would return
#"The number -4 is not in the domain". 


f <- function(w) {
  
  if (-2 < w & w < 3) {
    y=(3*w +1)
  } else if (w >= 3) {
    y=(-2*w +4)
  } else if (w < -2) {
    y=paste("The number",w,"is not in the domain")
  }
  return(y)
}


#Question Three

#Write code which will plot sin(x) from x=-1 to x=10.  Label the x axis 
#with the words "angle in radians" and the y axes with the word "length".
#Also give the plot a main title of "Sin(x)".
fx=-1:10 
plot(sin(fx),xlab = "angle in radians",ylab = "length",main = "Sin(x)")


#Question Four

#Below are two vectors.  The first contains some random integers and the 
#second some random letters (please execute to create your own vectors)

x<-sample(1:50,100,replace=TRUE)
y<-sample(letters,100,replace=TRUE)

#a) Write code that will return the index of each entry in x that contains 
#a multiple of 5 (ie 5,10,15, ...).
xa=x[x%%5==0]

#b) Write code that will create a dataframe called xy with x as its first 
#column and y as its second column. Also name the columns "numbers" and 
#"letters".
Dataframe=data.frame(x,y)
names(Dataframe)<-c("numbers","letters")

#c) Write code that will create a new dataframe, called xy5, that only 
#includes rows of "xy" which correspond to a number that is a multiple of 5.

xy5=Dataframe[Dataframe$numbers %% 5 == 0,]


