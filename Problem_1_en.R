# Install required packages (packages only need to be installed once)
# install.packages(c('tidyr', 'dplyr', 'ggplot2'))

library(tidyr)
library(dplyr)
library(ggplot2)

# Read the results file (NB! results.csv needs to be in the project directory)
# In case of errors, check your working directory by running getwd()

ageGuessesRaw <- read.csv('results.csv')

# Print the first few rows of the data frame.
head(ageGuessesRaw)

# Compute the number of student groups that have completed the survey

nGroups <-

# The gather function transforms the raw dataset from wide to long format
ageGuesses <- gather(ageGuessesRaw, key = 'person', value = 'estAge', person1:person12)
ageGuesses$person
# Create a vector with the true ages of the persons
trueAgesVector <- c(51, 56, 61, 29, 71, 37, 31, 42, 56, 34, 45, 23)

ageGuesses <- within(ageGuesses, {
  # Create a new column in the ageGuesses data.frame with the true ages.
  # We repeat each age nGroups times in order to match the number of rows in the 
  # long format data frame
  
  trueAge <- 
  
  # Compute the difference between the estimates and the true ages.
  error <- 
  
  # Compue the absolute error
  absError <- 
  
  # For convenience, create a factor to represent 
  # the person number.
  personNr <- 
})

# Visulalise the distribution of errors
ggplot(data = ageGuesses, aes(x = personNr, y = error)) + 
  geom_point() +
  geom_boxplot() + 
  geom_hline(yintercept = 0, linetype=2, color=2) + 
  coord_flip()

# Visualise the overall error distribution
ggplot(data = ageGuesses, aes(x = 'all', y = error)) + 
  geom_point() +
  geom_boxplot() + 
  geom_hline(yintercept = 0, linetype=2, color=2) + 
  coord_flip()

# Group the data frame by Person
ageGuessesGrouped <- group_by(ageGuesses, person)
ageGuessesGrouped

summarise(ageGuessesGrouped, 
          trueAge = trueAge[1],
          estAgeMean = mean(estAge), 
          estAgeStd = sd(estAge)
          )

# H_0: Expected bias equals zero for Person 1 
# H_1: Expected bias does not equal zero for Person 1

person1Errors <- 
person1Errors

t.test(person1Errors, mu=0, conf.level = 0.95)


# H_0: Expected bias equals zero for Person 11
# H_1: Expected bias does not equal zero for Person 11

ageGuesses
person11Errors <- 
person11Errors

t.test(person11Errors, mu=0, conf.level = 0.95)
