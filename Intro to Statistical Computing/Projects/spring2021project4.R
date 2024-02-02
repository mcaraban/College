# The goal of this project is to simulate the play of the game "Say Red"
# for a particular strategy for saying red the first time there are more
# red cards than black cards in the remaining deck.

#Step One
#
# Write a function called getdeck which has input of the number of red cards in
# the deck.  Please include an input check which returns the message, "Argument 
# must be an integer between 2 and 100" if such a number is not entered.
# The function returns a vector of 1's and 0's randoming placed and of equal 
# number.

getdeck=function(red){
  if(red < 2 | red > 100) return("Arguement must be an integer between 2 and 100")
  sample(rep(c(0,1),red),size=2*red,replace = FALSE)
  
}

#Step Two
#
# Write a function called playgame that impliments the strategy.  It has 
# input of a vector of the type returned by getdeck and returns a one 
# if the strategy leads to a win and zero otherwise.

playgame=function(deck){
  nred=length(deck)/2
  nblack=nred
  r.remain=.5
  current.location=1
  repeat{
    if(deck[current.location]==1){nred=nred-1} else if(deck[current.location]==0){
      nblack=nblack-1
    }
    r.remain=nred/(nred+nblack)
    if(r.remain > .5 & current.location < length(deck)) return(deck[current.location+1])
    if(current.location == length(deck)) return(deck[current.location])
    current.location=current.location+1
  }
  
}

#Step Three
#
# Write a function that simulates the play of the game.  It has an argument 
# of the number of times the game will be played and returns the percent of
# wins.  It returns the message, "The argument must be an integer in 1:10000
# if such a value is not entered.

Simulation=function(x){
  if(x < 1 | x > 10000) return(print("The arguement must be an integer in 1:10000"))
  games=c()
  for (k in 1:x){ 
  outcome = playgame(getdeck(3))
  if (outcome==1) games=c(games,TRUE) else games=c(games,FALSE)
  }
  return(mean(games))
  }


#Step Four
#
# Suppose a player is allow to wager on this game and they can wager either one
# token or two.  The player can decide how much to wager anytime before they
# say red.  If the person wins they recieve a profit of the number of tokens
# wagered.  If they lose they lose the tokens wagered. Suppose the person is 
# employing the strategy we are implementing and wager two tokens whenever 
# they have an advantage and one token otherwise.  Modify your code and simulate 
# this game.  Your output should be the amount won or lost.

playgame2=function(deck){
  nred=length(deck)/2
  nblack=nred
  r.remain=.5
  current.location=1
  repeat{
    if(deck[current.location]==1){nred=nred-1} else if(deck[current.location]==0){
      nblack=nblack-1
    }
    r.remain=nred/(nred+nblack)
    if(r.remain > .5 & current.location < length(deck)) return(deck[current.location+1])
    if(current.location == length(deck)) return(deck[current.location])
    current.location=current.location+1
  }
    if(nred == 1) return(2) else return(-1)
}



playwagergame=function(x) {
  tokens=0
  for(k in 1:x){
    tokens=tokens + playgame2(getdeck(3))
  }
  cat("Token amount =",tokens)
}


