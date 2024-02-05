#a
College=read.csv("College.csv")

#b
View(College)
rownames(College) <- College[, 1]
View(College)
College <- College[, -1] 
View(College)

#c(i)
summary(College)

#c(ii)
pairs(College[,2:10])

#c(iii)
attach(College)
Private=as.factor(Private)
plot(Private, Outstate)
plot(Private,Outstate, varwidth = T,
     xlab = "Private", ylab = "Outstate")

#c(iv)
Elite <- rep("No", nrow(College))
Elite[College$Top10perc > 50] <- "Yes"
Elite <- as.factor(Elite)
College <- data.frame(College , Elite)
summary(Elite) #78
plot(Elite,Outstate, varwidth = T,
     xlab = "Elite", ylab = "Outstate")

#c(v)
par(mfrow = c(2, 2))
hist(PhD, breaks = 15)
hist(Top25perc, breaks = 15)
hist(Grad.Rate, breaks = 25)
hist(Top10perc,breaks = 15)

#c(vi)
plot(PhD,Grad.Rate)
abline(lm(Grad.Rate~PhD))
summary(lm(Grad.Rate~PhD))

College[which.max(Grad.Rate),1]
College[which.min(Grad.Rate),1]

EliteColleges= Elite == "Yes"
sum(EliteColleges)
College[EliteColleges & Grad.Rate < 90,1]
44/sum(EliteColleges)




"
For this data, I thought it would be interesting if there was correlation between
the graduation rate and the percentage of professors with Phds. There was a small
positive correlation, but not enough for there to be a strong relationship. I wanted
to see which school had the highest gradutation rate in the dataframe. I discovered 
an error because it returned Cazenovia University with a graduation rate of 118%.
I also looked at the univsersity with the lowest graduation rate which was Texas 
Southern University with 10%. Finally, I wanted to see how many of the Elite
colleges had a gradution rate below 90%. I calculated 78 Elite colleges and out 
of those 78 only 44 had a graduation rate below 90%. This means around 56% of
Elite colleges have a graduation rate below 90%.
"




