import sqlite3
import random


#build connection to database
#console and cursor objects are global
db = sqlite3.connect("Quiz.db")
c = db.cursor()

def main():
  keepGoing = True
  while keepGoing:
    result = menu()
    if result == "0":
      keepGoing = False
    elif result == "1":
      buildDefault()
    elif result == "2":
      createRecord()
    elif result == "3":
      reportAll()
    elif result == "4":
      updateRecord()
    elif result == "5":
      deleteRecord()
    elif result == "6":
      searchCountry()
    elif result == "7":
        searchRegion()
    elif result == "8":
        genQuiz()
    else:
      print("I don't understand. Please try again...")

  c.close()

def menu():
  print ("""
  0) Quit
  1) Build default
  2) Create an entry
  3) Report all entries
  4) Update an entry
  5) Delete an entry
  6) Search for an entry by country
  7) Search for an entry by region
  8) Generate Quiz
  """)

  result = input("What will you do? ")
  return result

def buildDefault():

  #create a table
  c.execute("DROP TABLE IF EXISTS quiz")
  sql = """
  CREATE TABLE quiz (
  id INTEGER PRIMARY KEY,
  Region VARCHAR(20),
  Country VARCHAR(20),
  Capital VARCHAR(20),
  Ans1 VARCHAR(20),
  Ans2 VARCHAR(20),
  Ans3 VARCHAR(20)
  ) """
  c.execute(sql)

  #insert records into the table - note placeholders
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('Africa', 'Nigeria', 'Abuja', 'Lagos', 'Ibadan', 'Kano'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('Africa', 'Ethiopia', 'Addis Ababa', 'Gondar', 'Adama', 'Hawassa'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('Africa', 'Egypt', 'Cairo', 'Giza', 'Alexandria', 'Luxor'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('Africa', 'DR Congo', 'Kinshasa', 'Bukavu', 'Kisangani', 'Kananga'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('Africa', 'South Africa', 'Cape Town', 'Johannesburg', 'Soweto', 'Durban'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('Africa', 'Tanzania', 'Dodoma', 'Dar es Salaam', 'Tanga', 'Morogoro'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('Africa', 'Kenya', 'Nairobi', 'Mombasa', 'Kisumu', 'Eldoret'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('Africa', 'Uganda', 'Kampala', 'Gulu', 'Mbarara', 'Jinja'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('Africa', 'Algeria', 'Algiers', 'Oran', 'Constantine', 'Setif'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('Africa', 'Sudan', 'Khartoum', 'Nyala', 'Port Sudan', 'Kassala'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('Asia', 'China', 'Beijing', 'Shanghai', 'Guangzhou', 'Wuhan'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('Asia', 'India', 'New Delhi', 'Mumbai', 'Jaipur', 'Kolkata'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('Asia', 'Indonesia', 'Jakarta', 'Makassar', 'Depok City', 'Semarang'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('Asia', 'Pakistan', 'Islamabad', 'Lahore', 'Peshawar', 'Multan'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('Asia', 'Bangladesh', 'Dhaka', 'Chattogram', 'Sylhet', 'Khulna'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('Asia', 'Russia', 'Moscow', 'Saint Petersburg', 'Kazan', 'Omsk'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('Asia', 'Japan', 'Tokyo', 'Kyoto', 'Osaka', 'Yokohama'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('Asia', 'Philippines', 'Manila', 'Davao City', 'Baguio', 'Cebu City'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('Asia', 'Vietnam', 'Hanoi', 'Da Nang', 'Ho Chi Minh City', 'Can Tho'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('Asia', 'Iran', 'Tehran', 'Mashhad', 'Tabriz', 'Yazd'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('Europe', 'Russia', 'Moscow', 'Saint Petersburg', 'Kazan', 'Omsk'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('Europe', 'Turkey', 'Ankara', 'Istanbul', 'Konya', 'Izmir'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('Europe', 'Germany', 'Berlin', 'Munich', 'Dusseldorf', 'Hamburg'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('Europe', 'France', 'Paris', 'Marseille', 'Lyon', 'Nice'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('Europe', 'United Kingdom', 'London', 'Edinburgh', 'Brisol', 'Manchester'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('Europe', 'Italy', 'Rome', 'Milan', 'Naples', 'Florence'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('Europe', 'Spain', 'Madrid', 'Barcelona', 'Seville', 'Bilbao'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('Europe', 'Ukrain', 'Kyiv', 'Dnipro', 'Kharkiv', 'Odesa'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('Europe', 'Poland', 'Warsaw', 'Lublin', 'Poznan', 'Gdansk'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('Europe', 'Romania', 'Bucharest', 'Iasi', 'Timisoara', 'Oradea'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('North & Central America', 'United States', 'Washington D.C', 'Chicago', 'Los Angeles', 'Philadelphia'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('North & Central America', 'Mexico', 'Mexico City', 'Guadalajara', 'Cuidad Juarez', 'Tijuana'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('North & Central America', 'Canada', 'Ottawa', 'Ontario', 'Toronto', 'Montreal'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('North & Central America', 'Guatemala', 'Guatemala City', 'Villa Nueva', 'Mixco', 'Quetzaltenango'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('North & Central America', 'Cuba', 'Havana', 'Santa Clara', 'Holguin', 'Cienfuegos'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('North & Central America', 'Haiti', 'Port-au-Prince', 'Gonaives', 'Port-de-Paix', 'Petion-Ville'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('North & Central America', 'Domincan Republic', 'Santa Domingo', 'Puerto Plata', 'Santiago De Los Caballeros', 'Higuey'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('North & Central America', 'Honduras', 'Tegucigalpa', 'San Pedro Sula', 'Choloma', 'La Ceiba'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('North & Central America', 'Nicaragua', 'Managua', 'Granada', 'Masaya', 'Matagalpa'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('North & Central America', 'El Salvador', 'San Salvador', 'Santa Ana', 'San Miguel', 'Santa Tecla'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('Oceania', 'Australia', 'Sydney', 'Melbourne', 'Perth', 'Brisbane'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('Oceania', 'Papua New Guinea', 'Port Moresby', 'Lae', 'Popondetta', 'Arawa'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('Oceania', 'New Zealand', 'Wellington', 'Auckland', 'Christcurch', 'Dunedin'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('Oceania', 'Fiji', 'Suva', 'Nadi', 'Lautoka', 'Ba'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('Oceania', 'Solomon Islands', 'Honiara', 'Gizo', 'Kirakira', 'Noro'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('Oceania', 'Micronesia', 'Palikir', 'Tofol', 'Kolonia', 'Tol'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('Oceania', 'Vanuatu', 'Port Vila', 'Lugenville', 'Isangel', 'Sola'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('Oceania', 'Samoa', 'Apia', 'Asau', 'Siusega', 'Afega'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('Oceania', 'Kiribati', 'South Tarawa', 'Bairiki', 'Utiroa', 'Bikenibeu'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('Oceania', 'Tonga', 'Nuku’alofa', 'Pangai', 'Kolovai', 'Neiafu'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('South America', 'Brazil', 'Brasilia', 'Rio de Janeiro', 'Sao Paulo', 'Salvador'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('South America', 'Colombia', 'Bogota', 'Cali', 'Medellin', 'Cartagena'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('South America', 'Argentina', 'Buenos Aires', 'Rosario', 'Mendoza', 'La Plata'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('South America', 'Peru', 'Lima', 'Cusco', 'Arequipa', 'Chiclayo'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('South America', 'Venezuela', 'Caracas', 'Guayana City', 'Maracay', 'Barcelona'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('South America', 'Ecuador', 'Quito', 'Cuenca', 'Guayaquil', 'Ambato'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('South America', 'Chile', 'Santiago', 'Valpariso', 'Iquique', 'Vina del Mar'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('South America', 'Bolivia', 'Sucre', 'Santa Cruz la Sierra', 'Sacaba', 'El Alto'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('South America', 'Paraguay', 'Asuncion', 'Cuidad del Este', 'San Lorenzo', 'Encarnacion'))
  c.execute("INSERT INTO quiz VALUES (null, ?, ?, ?, ?, ?, ?)",
            ('South America', 'Uruguay', 'Montevideo', 'Cuidad de la Costa', 'Salto', 'Las Piedras'))



  db.commit()

def createRecord():

  Region = input("Region: ")
  Country = input("Country: ")
  Capital = input("Capital: ")
  Ans1= input("Ans1: ")
  Ans2= input("Ans2: ")
  Ans3= input("Ans3: ")

  c.execute("INSERT INTO quiz VALUES(null, ?, ?, ?, ?, ?, ?)",(Region, Country, Capital, Ans1, Ans2, Ans3))
  db.commit()

def reportAll():
  """ report each record in the table """

  #view the results
  result = c.execute("SELECT * FROM quiz")
  names = [description[0] for description in result.description]
  for record in result:
    fieldNum = 0
    for field in record:
        print ("{:10}: {}".format(names[fieldNum], field))
        fieldNum = fieldNum + 1
    print ("")


def updateRecord():

  rn = getRecordID()

  if rn == 0:
    print ("Not a legal ID. Please try again")
  else:
    result = c.execute("SELECT * FROM quiz WHERE id = ?",(rn,))
    for row in result:
      (id, Region, Country, Capital, Ans1, Ans2, Ans3) = row

      newRegion = input ("Region ({}): ".format(Region))
      if newRegion == '':
        newRegion = Region

      newCountry = input("Country ({}): ".format(Country))
      if newCountry == '':
        newCountry = Country

      newCapital = input("Capital ({}): ".format(Capital))
      if newCapital == '':
        newCapital = Capital

      newAns1 = input("Ans1 ({}): ".format(Ans1))
      if newAns1 == '':
        newAns1 = Ans1

      newAns2 = input("Ans2 ({}): ".format(Ans2))
      if newAns2 == '':
        newAns2 = Ans2

      newAns3 = input("Ans3 ({}): ".format(Ans3))
      if newAns3 == '':
        newAns3 = Ans3

    c.execute ("""UPDATE quiz
                  SET
                    Region = ?,
                    Country = ?,
                    Capital = ?,
                    Ans1 = ?,
                    Ans2 = ?,
                    Ans3 = ?
                  WHERE
                    id = ?""",
                    (newRegion, newCountry, newCapital, newAns1, newAns2, newAns3, rn))
    db.commit()

def deleteRecord():
  """ get a record ID, deletes that record """
  rn = getRecordID()
  if rn == 0:
    print("Not a valid record. Please try again")
  else:
    result = c.execute("SELECT * FROM quiz WHERE id = ?", (rn,))
    for row in result:
      (id, Region, Country, Capital, Ans1, Ans2, Ans3) = row

      print("Region: {}".format(Region))
      print("Country: {}".format(Country))
      print("Capital: {}".format(Capital))
      print("Ans1: {}".format(Ans1))
      print("Ans2: {}".format(Ans2))
      print("Ans3: {}".format(Ans3))


    confirmation = input("Are you sure you want to delete this record? (Y/N) ")
    confirmation = confirmation.upper()
    if confirmation.startswith("Y"):
      c.execute("DELETE FROM quiz WHERE ID = ?", (rn,))
      print("record deleted")
      db.commit()

def searchCountry():
  """ asks for a country.  Searches the database for a similar country using the
      LIKE clause """
  searchCountry = input("Country to search for: ")
  print()

  result = c.execute("SELECT * FROM quiz WHERE Country LIKE ?",("%"+searchCountry+"%",))
  for row in result:
    (id, Region, Country, Capital, Ans1, Ans2, Ans3) = row
    print("Region: {}".format(Region))
    print("Country: {}".format(Country))
    print("Capital: {}".format(Capital))
    print()

def searchRegion():
  """ asks for a Region.  Searches the database for a similar country using the
      LIKE clause """
  searchRegion = input("Region to search for: ")
  print()

  # You have to be a little sneaky with wildcards and placeholders...
  result = c.execute("SELECT * FROM quiz WHERE Region LIKE ?",("%"+searchRegion+"%",))
  for row in result:
    (id, Region, Country, Capital, Ans1, Ans2, Ans3) = row
    print("Region: {}".format(Region))
    print("Country: {}".format(Country))
    print("Capital: {}".format(Capital))
    print()


def genQuiz():
    searchRegion = input("Region? ")
    searchRegion= searchRegion.capitalize()
    print()
    result = c.execute("SELECT * FROM quiz WHERE Region LIKE ?",("%"+searchRegion+"%",))
    Score=int(0)
    for row in result:
        (id, Region, Country, Capital, Ans1, Ans2, Ans3) = row
        Answers= [row[3],row[4],row[5],row[6]]
        random.shuffle(Answers)
        useranswer = input("""What is the Capital of {}?
        A){:10}
        B){:10}
        C){:10}
        D){:10}

        Please spell out the city name!

        """.format(Country,Answers[0],Answers[1],Answers[2],Answers[3]))
        useranswer = useranswer.capitalize()
        if useranswer == Capital.capitalize():
            print("Correct!")
            Score += 1
        else:
            print("Incorrect")
    print("Final Score: {}".format(Score))


def getRecordID():

  result = c.execute("SELECT id, Country FROM quiz")

  print()
  legalIDs = []
  for row in result:
    (id, Region) = row
    print("{}: {}".format(id, Region))

    legalIDs.append(id)

  print()
  returnVal = input("Which id #? (or 0 to cancel) ")

  if not returnVal.isdigit():
    print("ID must be a digit")
    returnVal = 0

  if int(returnVal) not in legalIDs:
    returnVal = 0

  return returnVal



if __name__ == "__main__":
  main()









