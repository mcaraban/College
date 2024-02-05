"""
The game begins with the computer generating a random integer between 1 and 100.
The user will guess a number, and the computer will indicate whether the guess
is too high, too low, or correct. This will continue until the user has correctly
guessed the computer's number.
"""
#Instructions
print("""I'm thinking of a number between 1 and 100 Guess a number,
and I'll tell you if you're too high, too low, or got it right.
Good luck!""")

#Generate Random Number
import random

GeneratedNumber=random.randrange(1,100,1)
#Sentry
KeepGoing=True

Tries=0
#While Loop of Game
while KeepGoing:
    Guess = input("Please enter a number ")
    Guess = int(Guess)
    Tries= Tries + 1
    if Guess < GeneratedNumber:
        print("Too Low!")
    if Guess > GeneratedNumber:
        print("Too High!")
    if Guess == GeneratedNumber:
        print("Correct, it took {} turns".format(Tries))
        KeepGoing=False








