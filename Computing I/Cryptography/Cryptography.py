""" crypto.py
    Implements a simple substitution cypher
"""
#added space to account for spaces

alpha = "ABCDEFGHIJKLMNOPQRSTUVWXYZ "
key =   "XPMGTDHLYONZBWEARKJUFSCIQV "

#main function
def main():
  keepGoing = True
  while keepGoing:
    response = menu()
    if response == "1":
      plain = input("text to be encoded: ")
      print(encode(plain))
    elif response == "2":
      coded = input("code to be decyphered: ")
      print (decode(coded))
    elif response == "0":
      print ("Thanks for doing secret spy stuff with me.")
      keepGoing = False
    else:
      print ("I don't know what you want to do...")

#create a menu with options and receive user input
def menu():
        print (
            """
            SECRET DECODER MENU

        0) Quit
        1) Encode
        2) Decode
            """)
        response=input("What do you want to do? ")
        return response

#create encoding function
def encode(plain):
    code=""
    plain=plain.upper() #capatilize
    for i in plain:
            position = alpha.index(i) #position in alpha
            encode = key[position] #matching letter in key
            code = code + encode
    return code

#create decoding function
def decode(coded):
    decoded=""
    coded=coded.upper() #capatilize
    for i in coded:
        position = key.index(i) #position in key
        decode = alpha[position]  #matching letter in alpha
        decoded = decoded + decode
    return decoded

main()



