"""
Do anything you want to spruce up the joke. Maybe tell multiple jokes
"""


#Ask the user his or her name
name = input(" Hi. What's your name? ")
#Repeat the user's name in a greeting
print(" Hi,{}! ".format(name))
#Engage in an 'interactive' knock knock joke
print(" Here is a joke ")
#Begin KnockKnock Joke
KnockKnock = input(" Knock Knock ")
#Response to user
Boo = input(" Boo ")
#Punchline
joke = input(" Don't cry it's just a joke ")
#Begin Next Joke
Question = input(" Want to hear another? ")
#Give options if Yes or No, I made different possible 'Yes' options
#If one of the Yes options are picked next joke starts
if Question == "Yes" :
    KnockKnock = input(" Knock Knock ")
    Hatch = input(" Hatch ")
    print( " Bless You! ")
elif Question == "Sure":
    KnockKnock = input(" Knock Knock ")
    Hatch = input(" Hatch ")
    print( " Bless You! ")
elif Question == "Ok":
    KnockKnock = input(" Knock Knock ")
    Hatch = input(" Hatch ")
    print( " Bless You! ")
#If Yes option is not detected, don't say joke
else:
    print(" You're no fun :( ")


