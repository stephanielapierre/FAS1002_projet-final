### Script pour l'ouverture des données traitées

library(tidyverse)

# Ouverture des données sur la vaccination
vac_file <- list.files("data/processed/", pattern ="df")
df <- read.csv(paste0("data/processed/", vac_file))
df <- as_tibble(df)
rm(vac_file)

# Traitement des variables
df$name <- as.factor(df$name)
df$geo <- as.factor(df$geo)
df$region <- as.factor(df$region)
df$continent <- as.factor(df$continent)
df$date <- as.Date(df$date)


# Ouverture des données 2021, une ligne par pays/continent
vac_file <- list.files("data/processed/", pattern ="data_year")
df2021 <- read.csv(paste0("data/processed/", vac_file))
df2021 <- as_tibble(df2021)
rm(vac_file)

# Traitement des variables
df2021$name <- as.factor(df2021$name)
df2021$geo <- as.factor(df2021$geo)
df2021$region <- as.factor(df2021$region)
df2021$continent <- as.factor(df2021$continent)
df2021$date <- as.Date(df2021$date)
