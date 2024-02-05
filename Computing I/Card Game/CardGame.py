""" cardGame.py
    basic card game framework
    keeps track of card locations for as many hands as needed

    BIG HINT:
    You can think of the cards in a deck like this:

     0  1  2  3  4  5  6  7  8  9 10 11 12
    13 14 15 16 17 18 19 20 21 22 23 24 25
    26 27 28 29 30 31 32 33 34 35 36 37 38
    39 40 41 42 43 44 45 46 47 48 49 50 51

    In that arrangement, you can see all of the card numbers in order, but broken into 
    four rows and 13 columns.  Interesting, because there are four suits and 13 ranks.
    If there was an easy way to figure out what row and column a number was in, we could
    use that to find the suit and the rank.

    In this way, we can massively simplify our data structure, because each card number
    contains in its DNA its own suit and rank.
"""
from random import *
NUMCARDS = 52
DECK = 0
PLAYER = 1
COMP = 2

cardLoc = [0] * NUMCARDS
suitName = ("hearts", "diamonds", "spades", "clubs")
rankName = ("Ace", "Two", "Three", "Four", "Five", "Six", "Seven", 
            "Eight", "Nine", "Ten", "Jack", "Queen", "King")
playerName = ("deck", "player", "computer")

def main():
  clearDeck()

  for i in range(5):
    assignCard(PLAYER)
    assignCard(COMP)

  showDeck()
  showHand(PLAYER)
  showHand(COMP)  

def clearDeck():
    #go through every card
    for cardNum in range(NUMCARDS):
        #set location to deck
        cardLoc[cardNum] = DECK
        
def showDeck():
    print( """
        Location of all cards
    #           card        location 
    
    """)
    #go through every card 
    for cardNum in range(NUMCARDS):
        #show card number, location
        position = cardLoc[cardNum]
        hand = playerName[position]
        cardName = getCardName(cardNum)
        print ("    {}       {}:    {}".format(cardNum,cardName,hand))
      
    print()  
     
def getCardName(cardNum):
    #given a card number 
    #use integer division and modulus to get card name 
    suit = cardNum // 13
    rank = cardNum % 13
    
    cardName = "{} of {}".format(rankName[rank],suitName[suit])
    
    #return card name
    return cardName

def assignCard(hand):  
    #pick random number 0-51
    #assign that card to the hand
    cardNum = randrange(NUMCARDS)
    KeepGoing = True
    while KeepGoing:
        cardNum = randrange(NUMCARDS)
        if cardLoc[cardNum] == DECK:
            KeepGoing = False
    cardLoc[cardNum] = hand
    
def showHand(hand):
    #given a hand 
    print ( "Displaying {} hand".format(playerName[hand]))
    #got through all cards
    for cardNum in range(NUMCARDS):
        #if card is in hand 
        if cardLoc[cardNum] == hand:
            print (getCardName(cardNum))
    print()
    
main()


  
  

