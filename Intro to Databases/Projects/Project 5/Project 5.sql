' 1.	List First name and Last name for the patients who visited the health facility more than two times. '
SELECT PATIENT.FirstName, PATIENT.LastName, COUNT(VISIT.VisitID) AS Visits
FROM PATIENT INNER JOIN VISIT ON PATIENT.PatientID = VISIT.PatientID
GROUP BY VISIT.PatientID, PATIENT.FirstName, PATIENT.LastName
HAVING COUNT(VISIT.VisitID) > 2;

' 2.	Get the patient numbers and birthdays of patients who are three years older than the youngest patient in all. '
FROM PATIENT
WHERE (((Year([Birthday])-3)=(SELECT year(MIN(Birthday))
FROM PATIENT
)));

' 3.	Get the invoice id, paid status and amount of those unpaid invoices whose amount is greater than the average 
  invoice amount. Also display first name and last name of the patients associated with the invoice. '
SELECT BILLING.InvoiceID, BILLING.InvoicePaid, BILLING.InvoiceAmt, PATIENT.LastName, PATIENT.FirstName
FROM (PATIENT INNER JOIN VISIT ON PATIENT.PatientID = VISIT.PatientID) INNER JOIN BILLING ON VISIT.VisitID = BILLING.VisitID
WHERE (((BILLING.[InvoicePaid])=False) AND ((BILLING.[InvoiceAmt])>(SELECT AVG(InvoiceAmt) 
FROM BILLING 
WHERE InvoicePaid=0)));


