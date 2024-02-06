' 1. Display, full name (last name and first name together) of the patients who are waiting to have transplant surgery? '
SELECT Last_Name, First_Name
FROM PATIENTS;

' 2. Display surgeons by the last name who starts to work, in the facility, before 1994 '
SELECT LastName
FROM SURGEONS
WHERE DATESTARTED < #01/01/1994#;

' 3. Display surgeons last names with their total surgeries so far? '
SELECT LastName, COUNT(PATIENTS.SurgeonID) AS TotalSurgeries
FROM SURGEONS, PATIENTS
WHERE SURGEONS.SURID=PATIENTS.SurgeonID
GROUP BY LastName, SurgeonID;

' 4. Display all the patients with their last names, organ names who need a heart transplant  '
SELECT Last_Name, BodyPart
FROM ORGANS, PATIENTS
WHERE PATIENTS.ORGANID=ORGANS.OID AND PATIENTS.ORGANID='1'
GROUP BY Last_Name, BodyPart;

' 5. Display each hospital with annual incomes and state if for only annual income is between 4,6 billion and 6,9 billion? '
SELECT HosName, AnnualIncome, State
FROM HOSPITALS
WHERE AnnualIncome BETWEEN 4600000000 AND 6900000000;

' 6. Show how many patients are under 20 years old. '
SELECT Count(Age) AS Under20
FROM PATIENTS
WHERE Age < 20;

' 7. Display all the Patients’ last names in descending order along with their state. '
SELECT Last_Name, PState
FROM PATIENTS
ORDER BY Last_Name DESC;

' 8. Display, surgeons’ last names, first names, and their universities only from Indiana, Stanford, and Duke Universities? '
SELECT LastName, FirstName, Graduate
FROM SURGEONS
WHERE NOT Graduate = "University of Michigan" AND NOT Graduate = "Harvard University";

' 9. Display the total number of organs donated for each organ with organ id and name if the total number of organs is greater than 3. '
SELECT OrganID, BodyPart, COUNT(DONORS.OrganID) AS TotalOrganDonated
FROM DONORS, ORGANS
WHERE DONORS.OrganID=Organs.OID
GROUP BY OrganID, BodyPart
HAVING COUNT(DONORS.OrganID)>3;

' 10. Display the national rank of the Midwest region hospitals (Indiana, Ohio, etc.)? '
SELECT Ranking, State
FROM HOSPITALS
WHERE State = "IN" OR State ="MI" OR State = "OH";

