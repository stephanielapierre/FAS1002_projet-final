### Script pour le téléchargement des données 

library(tidyverse)
library(lubridate)

### Our world in data ###
## Données sur la vaccination ##
# Les données relatives à la vaccination sont téléchargées quotidiennement.

# Extraction de la date du téléchargement des données
vac_file <- list.files("data/raw/", pattern ="vaccination")
date_vac_file <- str_sub(vac_file, 13, 22)

# Conditionnel pour vérifier les données doivent être téléchargées
if (date_vac_file < Sys.Date()){
    download.file("https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/vaccinations/vaccinations.csv", 
                  destfile = paste0('data/raw/vaccination_', Sys.Date(), '.csv'))
    file.remove(paste0('data/raw/vaccination_', date_vac_file, '.csv'))         # On enleve les données old
}

# Nettoyage de l'environnement
rm(vac_file, date_vac_file)



### Gapminder ###
# Les données relatives de Gapminder sont téléchargées une fois par mois.

## Poupulation ##
download.file("https://docs.google.com/spreadsheets/d/14_suWY8fCPEXV0MH7ZQMZ-KndzMVsSsA5HdR-7WqAC0/export?format=xlsx", 
              destfile = paste0('data/raw/population_', Sys.Date(), '.xlsx'))

download.file("https://docs.google.com/spreadsheets/d/14_suWY8fCPEXV0MH7ZQMZ-KndzMVsSsA5HdR-7WqAC0/export?format=xlsx", 
              destfile = paste0('data/raw/population_2021-11-01.xlsx'))

# Extraction de la date du téléchargement des données
pop_file <- list.files("data/raw/", pattern ="population")
date_pop_file <- as.Date(str_sub(pop_file, 12, 21)) 
pop_mois <- date_pop_file %m+% months(1)               # Ajout d'un mois à la date

# Conditionnel pour vérifier les données doivent être téléchargées
if (pop_mois < Sys.Date()){
    download.file("https://docs.google.com/spreadsheets/d/14_suWY8fCPEXV0MH7ZQMZ-KndzMVsSsA5HdR-7WqAC0/export?format=xlsx", 
                  destfile = paste0('data/raw/population_', Sys.Date(), '.xlsx'))
    file.remove(paste0('data/raw/population_', date_pop_file, '.xlsx'))         # On enleve les données old
}

# Nettoyage de l'environnement
rm(pop_file, date_pop_file, pop_mois)



## Produit intérieur brut (PIB) ##
download.file("https://docs.google.com/spreadsheets/d/1h3z8u0ykcUum8P9FV8EHF9fszDYr7iPDZQ-fgE3ecls/export?format=xlsx", 
              destfile = paste0('data/raw/pib_', Sys.Date(), '.xlsx'))

download.file("https://docs.google.com/spreadsheets/d/1h3z8u0ykcUum8P9FV8EHF9fszDYr7iPDZQ-fgE3ecls/export?format=xlsx", 
              destfile = paste0('data/raw/pib_2021-11-01.xlsx'))

# Extraction de la date du téléchargement des données
pib_file <- list.files("data/raw/", pattern ="pib")
date_pib_file <- as.Date(str_sub(pib_file, 5, 14)) 
pib_mois <- date_pib_file %m+% months(1)               # Ajout d'un mois à la date

# Conditionnel pour vérifier les données doivent être téléchargées
if (pib_mois < Sys.Date()){
    download.file("https://docs.google.com/spreadsheets/d/1h3z8u0ykcUum8P9FV8EHF9fszDYr7iPDZQ-fgE3ecls/export?format=xlsx", 
                  destfile = paste0('data/raw/pib_', Sys.Date(), '.xlsx'))
    file.remove(paste0('data/raw/pib_', date_pib_file, '.xlsx'))         # On enleve les données old
}

# Nettoyage de l'environnement
rm(pib_file, date_pib_file, pib_mois)


## Espérance de vie ##

download.file("https://docs.google.com/spreadsheets/d/11mulzUH3_cueq-V9D5KIlo9oHE9YYZrUSeVyCin7_rM/export?format=xlsx", 
              destfile = paste0('data/raw/life-expectancy_', Sys.Date(), '.xlsx'))

download.file("https://docs.google.com/spreadsheets/d/11mulzUH3_cueq-V9D5KIlo9oHE9YYZrUSeVyCin7_rM/export?format=xlsx", 
              destfile = paste0('data/raw/life-expectancy_2021-11-01.xlsx'))

# Extraction de la date du téléchargement des données
life_file <- list.files("data/raw/", pattern ="life-expectancy")
date_life_file <- as.Date(str_sub(life_file, 17, 26)) 
life_mois <- date_life_file %m+% months(1)               # Ajout d'un mois à la date

# Conditionnel pour vérifier les données doivent être téléchargées
if (life_mois < Sys.Date()){
    download.file("https://docs.google.com/spreadsheets/d/11mulzUH3_cueq-V9D5KIlo9oHE9YYZrUSeVyCin7_rM/export?format=xlsx", 
                  destfile = paste0('data/raw/life-expectancy_', Sys.Date(), '.xlsx'))
    file.remove(paste0('data/raw/life-expectancy_', date_life_file, '.xlsx'))         # On enleve les données old
}

# Nettoyage de l'environnement
rm(life_file, date_life_file, life_mois)
