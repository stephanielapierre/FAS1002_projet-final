### Script pour le téléchargement des données 

## Our world in data 
# Données sur la vaccination
data_URL <- read.csv("https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/vaccinations/vaccinations.csv")
write.csv(data_URL, file = paste0('data/raw/vaccination_', Sys.Date(), '.csv'))

## Gapminder
# Poupulation
download.file("https://docs.google.com/spreadsheets/d/14_suWY8fCPEXV0MH7ZQMZ-KndzMVsSsA5HdR-7WqAC0/export?format=xlsx", 
              destfile = paste0('data/raw/population_', Sys.Date(), '.xlsx'))

# Produit intérieur brut (PIB)
download.file("https://docs.google.com/spreadsheets/d/1h3z8u0ykcUum8P9FV8EHF9fszDYr7iPDZQ-fgE3ecls/export?format=xlsx", 
              destfile = paste0('data/raw/life-expectancy_', Sys.Date(), '.xlsx'))

# Espérance de vie
download.file("https://docs.google.com/spreadsheets/d/11mulzUH3_cueq-V9D5KIlo9oHE9YYZrUSeVyCin7_rM/export?format=xlsx", 
              destfile = paste0('data/raw/life-expectancy_', Sys.Date(), '.xlsx'))

filenames <- list.files("data/raw/", pattern ="vaccination")


x <- file.info(".gitignore")
x$ctime
