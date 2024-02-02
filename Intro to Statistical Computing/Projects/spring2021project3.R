#Project 3

#The goal of this project is to produce a function that performs 
#t test.  

#
# 1) Name your function myhtest and give it four arguments, level, type, mydata and mu.  
# 
#    level - the significance level of the tes
#    type - the type of alternative and has one of the values, "l" (for less than), "g" (for greater than) 
#           or "ne" (for not equal to).
#   mydata - a vector of numerical values.
#   mu - value in the null hypothesis.
#
# Let level default to 0.05, type default to "g" and mu default to "0".
# 2) If the data vector has any missing values, the function returns the statement, "missing values not allowed".
#    If type is not one of the three values, the function returns the statement, "invalid type entry".
#    If the level is not between 0 and 1, the function returns the statement, "not a valid significance level".
#    Note: Once your function finds one of these errors it does not need to check the other possible errors
# 3) The function calculates the test statistic (the mean() and sd() functions will be useful here).
# 4) The function compares the test statistic to an appropriate rejection region cutoff depending on the "type" input.
# 5) The function computes an appropriate p-value depending on the "type" input.
# 6) The function returns one of the following statements

# Reject the null hypothesis in favor of the alternative with a p-value of (insert p-value here)
# Fail to reject the hypothesis with a p-value of (insert p-value here)

myhtest=function(level=.05,type="g",mydata,mu=0){
  if(any(is.na(mydata))== TRUE) return("missing value")
  if(!(type %in% c("l","g","ne"))) return("invalid type entry") 
  if(!(level >= 0 & level <= 1)) return("not a valid significance level")
  TS=(mean(mydata)- mu)/(sd(mydata)/sqrt(length(mydata)))
  if(type =="g"){cutoff=qt(level,length(mydata)-1,lower.tail = FALSE)
  pvalue=pt(TS,length(mydata)-1,lower.tail = FALSE)
  if(TS>cutoff){return(cat("Reject the null hypothesis in favor of the alternative
                           with a pvalue of", pvalue))}
  else{return(cat("Fail to reject the hypothesis with a p-value of", pvalue))}}
  if(type == "l"){cutoff=qt(level,length(mydata)-1,lower.tail = TRUE)
  pvalue= pt(TS,length(mydata)-1,lower.tail = TRUE)
  if(TS<cutoff){return(cat("Reject the null hypothesis in favor of the alternative
                           with a pvalue of", pvalue))}
  else{return(cat("Fail to reject the hypothesis with a p-value of", pvalue))}}
  if(type == "ne"){cutoff=qt(level/2,length(mydata)-1,lower.tail = FALSE)
  pvalue= pt(abs(TS),length(mydata)-1,lower.tail = FALSE)
  if(abs(TS)>cutoff){return(cat("Reject the null hypothesis in favor of the alternative
                           with a pvalue of", pvalue))}
  else{return(cat("Fail to reject the hypothesis with a p-value of", pvalue))}}
  
}
    
  
