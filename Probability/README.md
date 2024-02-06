# STAT 41600 – Probability, Fall 2021

An introduction to mathematical probability is suitable as preparation for actuarial science, statistical theory, and mathematical modeling. General probability rules, conditional probability, Bayes theorem, discrete and continuous random variables, moments and moment generating functions, continuous distributions and their properties, the law of large numbers, and the Central Limit Theorem. Students will also gain some experience with the R statistical software.

## Project 1
The objective of this introductory project is to get acquainted with the basic features of Rstudio (or R).

## Project 2
Simulate, using R, different events, and figure out their probabilities by using the relative frequency approach and determine which game is more favorable to “Winning”. That is, use R to simulate 3,000 plays of the following games:
1) Game 1: roll a die one time, WIN if you have an Ace (a ‘6’).
2) Game 2: roll a die four times, WIN if you have one or more Aces.
3) Game 3: roll a pair of dice 24 times, WIN if you have one or more Double Aces.

Note, you don’t have to perform all 3,000 plays, at once. You can perform n=100, plays at first, then n=200, n=400, n=500, n=800, and finally n=1000 additional plays, and then record the results and complete the tables.

## Project 3 
Calculate and plot the pmf and the cdf for the first 11 values (x=0, 1, 2, …10) of the:
a) Binomial distribution with n=10 and p=0.6
b) the Poisson distribution with lambda=6 (corresponding to n=10 and p=0.6)

## Project 4
Use the above procedures to generate n = 10000 random values from the N(10, 9) distribution.
• Obtain the summary statistics of these data. Do they conform with the theoretical distribution you
meant to use?
• What proportion of your simulated data do you expect to fall within two σ units from the mean?
• What proportion of your simulated data you actually found within two σ units from the mean?
• Use these simulated values to draw the approximate graph of the pdf of this distribution, appropriately
labeled and marked.

## Project 5
You will now use R to generate (simulate), the sampling distribution of the statistic nx (the sample average) when sampling from the Exponential distribution.
• Generate 10000M=different random samples, each with 16n= observations, from the Exponential distribution, (0.1)XExpλ=, which has mean 10μ= and a standard deviation 10σ;



