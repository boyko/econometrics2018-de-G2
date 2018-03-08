
# install.packages('tidyr')
library(tidyr)
library(dplyr)

rohDaten <- read.csv('results.csv')
alterDaten <- gather(rohDaten, key = 'Person', value = 'alterGeschaetzt', person1:person12)
alterDaten
alterWahrVektor <- c()

alterDaten <- within(alterDaten, {
  alterWahr <- rep(alterWahrVektor, each = 4)
  fehler <- alterGeschaetzt - alterWahr
  absFehler <- abs(fehler)
})

alterDatenGruppiert <- group_by(alterDaten, Person)
alterDatenGruppiert

summarise(alterDatenGruppiert, 
          alterWahr = alterWahr[1], 
          schaetzungMittel = mean(alterGeschaetzt), 
          mittlererAbsFehler = mean(absFehler)
          )

