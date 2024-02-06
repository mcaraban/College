' 2.	Provide billing details (Invoice number, visitID, date, amount etc..) along with type of appointment for those patients who 
  visited doctor as walk in appointment. '
SELECT InvoiceNum, BILLING.VisitID, InvoiceAmt, ItemID, InvoicePaid, Insurance, WalkIn, DiagnosisID
FROM BILLING INNER JOIN APPOINTMENT ON BILLING.VisitID=APPOINTMENT.VisitID
WHERE WalkIn= TRUE;

' 3.	Display all the invoice items along with their name and average invoice amount billed for these invoice items in the descending
  order of the average amount. Only display those items whose average amount is greater than $200 '
SELECT INVOICE.ItemID, INVOICE.InvoiceItem, Avg(BILLING.InvoiceAmt) AS InvoiceAvg
FROM INVOICE INNER JOIN BILLING ON INVOICE.ItemID = BILLING.ItemID
GROUP BY INVOICE.ItemID, INVOICE.InvoiceItem
HAVING (Avg([InvoiceAmt]>200))
ORDER BY Avg(BILLING.InvoiceAmt) DESC;

' 4.	Provide billing details (Invoice number, visitID, date, item name and id, amount) for those invoices which are not billed for
  ‘Lab work’, ‘Pharmacy’ and ‘Office visit’ and whose payment is not made. Also calculate the 7 % interest on the billed amount and 
  display both interest amount as Late Penalty and the new billed amount. '
SELECT InvoiceNum, VisitID, InvoiceDate, InvoiceAmt, BILLING.ItemID, InvoicePaid, Insurance, InvoiceItem, InvoiceAmt*.07 AS LatePenalty, LatePenalty + InvoiceAmt AS Total
FROM BILLING INNER JOIN INVOICE ON BILLING.ItemID = INVOICE.ItemID
WHERE InvoicePaid= False AND NOT InvoiceItem='Lab Work' AND NOT InvoiceItem= 'Pharmacy' AND NOT InvoiceItem= 'Office visit';

' 5.	Provide maximum bill charged for each of the invoice item whose total insurance is not 0. Display only the maximum billed amount 
  and the invoice item for which the amount is charged. '
SELECT InvoiceItem, MAX(InvoiceAmt) AS MAXcharge
FROM INVOICE INNER JOIN BILLING ON INVOICE.ItemID=BILLING.ItemID
WHERE Insurance > 0
GROUP BY InvoiceItem;

' 6.	Display all patients (without repetition) had an appointment in February, 2016 and March, 2016. '
SELECT DISTINCT PatientID
FROM APPOINTMENT
WHERE DateVisit BETWEEN #02/01/2016# AND #03/31/2016#;





