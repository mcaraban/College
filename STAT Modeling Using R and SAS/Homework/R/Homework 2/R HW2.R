#1
library(tidyverse)
library(readxl)
library(purrr)
library(dplyr)
GDP=read_excel("GDP.xlsx")
Fertility=read_excel("fertility.xlsx")
Life_Expectancy=read_excel("life_expectancy.xlsx")
Children_Mortality=read_excel("children_mortality.xlsx")
Population=read_excel("population.xlsx")

#2
# Function to extract the column name with country names
my_func <- function(df, common_name = "Country") {
  # Assuming the column with country names is the first column
  country_column <- names(df)[1]
  
  # Assign a common name to the country column
  df <- rename(df, !!common_name := !!country_column)
  
  return(country_column)
}

my_func(GDP)
my_func(Fertility)
my_func(Life_Expectancy)
my_func(Children_Mortality)
my_func(Population)

#3
tidy_children_mortality <- gather(Children_Mortality, key = "Year", value = "ChildrenMortality", -Country)
tidy_life_expectancy <- gather(Life_Expectancy, key = "Year", value = "LifeExpectancy", -Country)
tidy_fertility <- gather(Fertility, key = "Year", value = "Fertility", -Country)
tidy_population <- gather(Population, key = "Year", value = "Population", -Country)
tidy_GDP <- gather(GDP, key = "Year", value = "GDP", -Country)

Dataset <- full_join(tidy_children_mortality, tidy_life_expectancy, by = c("Country", "Year")) %>%
  full_join(tidy_fertility, by = c("Country", "Year")) %>%
  full_join(tidy_population, by = c("Country", "Year")) %>%
  full_join(tidy_GDP, by = c("Country", "Year"))

Dataset$Year <- as.numeric(Dataset$Year)

#4
Continent <- read_tsv("continent-info.tsv", col_names = c("Country","Continent"))
Continent <- distinct(Continent, Country, .keep_all = TRUE)

# Left join final_tidy_dataset with continent_info based on the "Country" column
Dataset <- left_join(Dataset, Continent, by = "Country")

#5
Country_pairs <- list(
  c("Sri Lanka", "Turkey"),
  c("Poland", "South Korea"),
  c("Malaysia", "Russia"),
  c("Pakistan", "Vietnam"),
  c("Thailand", "South Africa")
)

Child_Mortality_2015 <- Dataset %>%
  filter(Year == 2015 & (Country %in% unlist(Country_pairs)))

Pairs_Dataset = Child_Mortality_2015 %>%
  select(Country, ChildrenMortality) %>%
  spread(Country, ChildrenMortality)

Pairs_Dataset %>%
  select("Sri Lanka", "Turkey", "Poland", "South Korea", "Malaysia", "Russia", "Pakistan", "Vietnam", "Thailand", "South Africa")


#6
Plot_Data <- Dataset %>%
  filter(Year == 1962) %>%
  select(Continent, LifeExpectancy, Fertility, Population)

ggplot(Plot_Data, aes(x = Fertility, y = LifeExpectancy, color = Continent, size = Population)) +
  geom_point() +
  scale_size_continuous(range = c(2, 10)) +  # Adjust the range of point sizes
  labs(title = "Life Expectancy vs Fertility (1962)",
       x = "Fertility",
       y = "Life Expectancy",
       color = "Continent",
       size = "Population") +
  theme_minimal()

#7
OECD <- c("Australia","Austria","Belgium","Canada","Chile",
          "Country","Czech Republic","Denmark","Estonia",
          "Finland","France","Germany","Greece","Hungary",
          "Iceland","Ireland","Israel","Italy","Japan",
          "Korea","Luxembourg","Mexico","Netherlands",
          "New Zealand","Norway","Poland","Portugal",
          "Slovak Republic","Slovenia","Spain","Sweden",
          "Switzerland","Turkey","United Kingdom","United States")

OPEC <- c("Algeria", "Angola", "Ecuador", "Iran", "Iraq",
          "Kuwait", "Libya","Nigeria", "Qatar", "Saudi Arabia",
          "United Arab Emirates", "Venezuela")

Dataset <- Dataset %>%
  mutate(IsOECD = Country %in% OECD,
         IsOPEC = Country %in% OPEC)

#8
Dataset <- Dataset %>%
  mutate(Organization = case_when(
    Country %in% OECD ~ "OECD",
    Country %in% OPEC ~ "OPEC",
    TRUE ~ Continent
  ))

ggplot(Dataset, aes(x = Fertility, y = LifeExpectancy, 
                               color = Organization, size = Population)) +
  geom_point() +
  scale_size_continuous(range = c(2, 10)) +
  scale_color_manual(name = "Organization", 
                     values = c("OECD" = "red", "OPEC" = "blue", "Asia" = "green", 
                                "Africa" = "orange", "Americas" = "purple", "Europe" = "brown")) +
  labs(title = "Life Expectancy vs Fertility",
       x = "Fertility",
       y = "Life Expectancy",
       color = "Organization",
       size = "Population") +
  theme_minimal()

#9
generate_plot <- function(year) {
  subset_data <- Dataset %>%
    filter(Year == year)
  
  subset_data <- subset_data %>%
    mutate(Organization = case_when(
      Country %in% OECD ~ "OECD",
      Country %in% OPEC ~ "OPEC",
      TRUE ~ Continent
    ))
  plot <- ggplot(subset_data, aes(x = Fertility, y = LifeExpectancy, 
                                  color = Organization, size = Population)) +
    geom_point() +
    scale_size_continuous(range = c(2, 10)) +
    scale_color_manual(name = "Organization", 
                       values = c("OECD" = "red", "OPEC" = "blue", "Asia" = "green", 
                                  "Africa" = "orange", "Americas" = "purple", "Europe" = "brown")) +
    labs(title = paste("Life Expectancy vs Fertility (Year", year, ")"),
         x = "Fertility",
         y = "Life Expectancy",
         color = "Organization",
         size = "Population") +
    theme_minimal()
  
  return(plot)
}


gridExtra::grid.arrange(
  generate_plot("1800.0"),
  generate_plot("1870.0"),
  generate_plot("1940.0"),
  generate_plot("2015.0"),
  ncol = 2
)

#10


France_Tunisa <- Dataset %>%
  filter(Country %in% c("France", "Tunisia"), Year >= (2022 - 60))

Fertility_Plot <- ggplot(France_Tunisa, aes(x = Year, y = Fertility, color = Country)) +
  geom_line() +
  labs(title = "Fertility Over Time (France vs Tunisia)",
       x = "Year",
       y = "Fertility",
       color = "Country") +
  theme_minimal()

Fertility_Plot


Life_Expectancy_Plot <- ggplot(France_Tunisa, aes(x = Year, y = LifeExpectancy, color = Country)) +
  geom_line() +
  labs(title = "Life Expectancy Over Time (France vs Tunisia)",
       x = "Year",
       y = "Life Expectancy",
       color = "Country") +
  theme_minimal()

Life_Expectancy_Plot






