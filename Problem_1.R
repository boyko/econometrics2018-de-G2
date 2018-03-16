# Installieren von R Packeten, die in diesem Programm benutzt werden.
# install.packages(c('tidyr', 'dplyr', 'ggplot2'))

library(tidyr)
library(dplyr)
library(ggplot2)

# Ergebnisse einlesen (muessen vorher heruntergeladen werden)
# Falls Fehler eintreten, checken Sie ihren aktuellen Arbeitsordner von R,
# indem Sie die getwd Funktion aufrufen.

ageGuessesRaw <- read.csv('results.csv')

# Ausdruck der ersten Zeilen des Datensatzes.
head(ageGuessesRaw)

# Anzahl von Studentengruppen bestimmen.

nGroups <-

# Die gather Funktion aus dem tidyr Packet formt den Datensatz von breitem Format in langen Format um.
ageGuesses <- gather(ageGuessesRaw, key = 'person', value = 'estAge', person1:person12)
ageGuesses$person
# Vektor mit dem wahren Alter der Personen definieren.
trueAgesVector <- c(51, 56, 61, 29, 71, 37, 31, 42, 56, 34, 45, 23)

ageGuesses <- within(ageGuesses, {
  # Neue Spalte im Datensatz definieren, die das wahren Alter enthaelt.
  
  trueAge <- 
  
  # Differenz zwischen wahrem Alter und geschaetzem Alter ausrechnen
  error <- 
  
  # Absoluten Felher ausrechnen
  absError <- 
  
  # Faktorvariable erstellen, die die Personen (aus dem jeweiligen Photo) im Datensatz identifizier
  # wird fuer die graphische Darstellung der Daten benutzt.
  personNr <- 
})

# Verteilung der Fehler darstellen je Person (Photo)
ggplot(data = ageGuesses, aes(x = personNr, y = error)) + 
  geom_point() +
  geom_boxplot() + 
  geom_hline(yintercept = 0, linetype=2, color=2) + 
  coord_flip()

# Verteilung der Fehler ohne Differenzierung nach Person (Photo)
ggplot(data = ageGuesses, aes(x = 'all', y = error)) + 
  geom_point() +
  geom_boxplot() + 
  geom_hline(yintercept = 0, linetype=2, color=2) + 
  coord_flip()

# Datenzatz nach Person gruppieren.
ageGuessesGrouped <- group_by(ageGuesses, person)
ageGuessesGrouped

# Mittelwerte, Standardabweichungen der Schaetzungen je Person
summarise(ageGuessesGrouped, 
          trueAge = trueAge[1],
          estAgeMean = mean(estAge), 
          estAgeStd = sd(estAge)
          )

# Hypothesentest: 
# Der erwartete Bias der Schaetzungen fuer Person 1 ist gleich 0
# vs. Alternative: Erwarteter Bias ist ungleich null.

person1Errors <- 
person1Errors

t.test(person1Errors, mu=0, conf.level = 0.95)


# Hypothesentest: 
# Der erwartete Bias der Schaetzungen fuer Person 11 ist gleich 0
# vs. Alternative: Erwarteter Bias ist ungleich null.

ageGuesses
person11Errors <- ageGuesses[ageGuesses$personNr == "11", 'error']
person11Errors

t.test(person11Errors, mu=0, conf.level = 0.95)
