rnorm.bm <-function(n=10000) {
     U <- runif(n) 
     V <- runif(n)
     
       R <- sqrt(-2*log(1-V))
       Theta <- 2*pi*U
       
         X <- R*cos(Theta)
         Y <- R*sin(Theta)
         return(X)
       }

x=10+3*rnorm.bm()
summary(x)

y=rnorm(10000,10,3)
summary(y)

w=x>16.019
sum(w)

u=x<4.019
sum(u)

hist(x,freq = FALSE,nclass = 30,main = 'Simulated Normal Distribution')
est.den<-density(xx)
x0<-est.den$x
y0<-est.den$y

