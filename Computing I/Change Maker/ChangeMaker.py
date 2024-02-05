"""
The program should ask for a purchase price and the amount of cash tendered.
It should then determine how many coins or bills of the following denominations
should be returned:
"""

#Ask for price
Price = input("Price of item ")
Price = float(Price)


#Ask for amount of cash tendered
Cash = input("Cash Tendered ")
Cash = float(Cash)

#Change
Change = Cash - Price
#Round to nearest cent
Change = float(round(Change, 2))
print("Change:", Change)
#Convert to pennies
Change=Change*100
Change = float(round(Change, 2))
print("Change in Pennies:",Change)

"""
Divide by pennies of each denomination to nearest integer and use the remainder
for next denomination (quotient gives amount and remainder is used for next amount)
"""
print("twenties:", Change//2000)
Change = Change%2000
print("tens:",Change//1000)
Change = Change%1000
print("fives:",Change//500)
Change = Change%500
print("dollars:",Change//100)
Change = Change%100
print("quarters:", Change//25)
Change = Change%25
print("dimes:",Change//10)
Change = Change%10
print("nickles:",Change//5)
Change = Change%5
print("pennies:",Change)






















