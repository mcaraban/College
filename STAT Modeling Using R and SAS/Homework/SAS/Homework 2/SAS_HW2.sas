'1'
data mydata;
input drug $ nausea $ count;
datalines;
DrugGiven Nauseated 15
DrugGiven NotNauseated 35
PlaceboGiven Nauseated 4
PlaceboGiven NotNauseated 46
;
run;
proc print data=mydata;
run;
proc freq data=mydata;
tables drug*nausea / chisq;
run;

'2a'
data homes;
infile 'home.txt';
input PRICE SQFT AGE FEATS NE CUST COR TAX;
run;
proc print data=homes;
run;
proc sgplot data=homse;
where COR = 0 and NE = 0;
scatter x=TAX y=FEATS;
run;
proc sgplot data=homes;
where COR = 1 and NE = 0;
scatter x=TAX y=FEATS;
run;
proc sgplot data=homes;
where COR = 0 and NE = 1;
scatter x=TAX y=FEATS;
run;
proc sgplot data=homes;
where COR = 1 and NE = 1;
scatter x=TAX y=FEATS;
run;

'2b'
data homes;
set homes;
if COR = 0 and NE = 0 then GROUP = 'COR=0, NE=0';
if COR = 0 and NE = 1 then GROUP = 'COR=0, NE=1';
if COR = 1 and NE = 0 then GROUP = 'COR=1, NE=0';
if COR = 1 and NE = 1 then GROUP = 'COR=1, NE=1';
run;
proc sgplot data=homes;
hbox TAX / group=GROUP;
run;

data homes;
set homes;
if COR = 0 and NE = 0 then GROUP = 'COR=0, NE=0';
if COR = 0 and NE = 1 then GROUP = 'COR=0, NE=1';
if COR = 1 and NE = 0 then GROUP = 'COR=1, NE=0';
if COR = 1 and NE = 1 then GROUP = 'COR=1, NE=1';
run;
proc sgplot data=homes;
hbox FEATS / group=GROUP;
run;




