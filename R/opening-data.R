### Script pour l'ouverture des données et le traitement du type de variables

library(tidyverse)
library(readxl)
library(dplyr)


# Ouverture des données sur la vaccination
vac_file <- list.files("data/raw/", pattern ="vaccination")
df_vaccination <- read.csv(paste0("data/raw/", vac_file))
df_vaccination <- as_tibble(df_vaccination)
rm(vac_file)

# Traitement des variables sur la vaccination
df_vaccination$location <- as.factor(df_vaccination$location)
df_vaccination$iso_code <- as.factor(df_vaccination$iso_code)
df_vaccination$date <- as.Date(df_vaccination$date)

# La variable `location` contient autant des pays que des régions. 
# Afin de pouvoir distinguer les pays des régions, il faut ajouter une nouvelle variable. 
df_vaccination$type_location <- str_detect(df_vaccination$iso_code, "OWID_")
df_vaccination$type_location <- str_replace(df_vaccination$type_location, "TRUE", "region")
df_vaccination$type_location <- str_replace(df_vaccination$type_location, "FALSE", "country")
df_vaccination$type_location <- as.factor(df_vaccination$type_location)



# Ouverture des données sur la population
pop_file <- list.files("data/raw/", pattern ="population")
df_pop_regions <- read_excel(paste0("data/raw/", pop_file), sheet = "data-for-regions-by-year")
df_pop_country <- read_excel(paste0("data/raw/", pop_file), sheet = "data-for-countries-etc-by-year")
df_pop_regions <- as_tibble(df_pop_regions)
df_pop_country <- as_tibble(df_pop_country)
rm(pop_file)

# Traitement des variables sur la population
df_pop_country$geo <- as.factor(df_pop_country$geo)
df_pop_country$name <- as.factor(df_pop_country$name)
df_pop_regions$geo <- as.factor(df_pop_regions$geo)
df_pop_regions$name <- as.factor(df_pop_regions$name)



# Ouverture des données sur le PIB
pib_file <- list.files("data/raw/", pattern ="pib")
df_pib_regions <- read_excel(paste0("data/raw/", pib_file), sheet = "data-for-regions-by-year")
df_pib_country <- read_excel(paste0("data/raw/", pib_file), sheet = "data-for-countries-etc-by-year")
df_pib_regions <- as_tibble(df_pib_regions)
df_pib_country <- as_tibble(df_pib_country)
rm(pib_file)

# Traitement des variables sur le PIB
df_pib_country$geo <- as.factor(df_pib_country$geo)
df_pib_country$name <- as.factor(df_pib_country$name)
df_pib_regions$geo <- as.factor(df_pib_regions$geo)
df_pib_regions$name <- as.factor(df_pib_regions$name)



# Ouverture des données sur l'espérance de vie
life_file <- list.files("data/raw/", pattern ="life-expectancy")
df_life.exp_regions <- read_excel(paste0("data/raw/", life_file), sheet = "data-for-regions-by-year")
df_life.exp_country <- read_excel(paste0("data/raw/", life_file), sheet = "data-for-countries-etc-by-year")
df_life.exp_regions <- as_tibble(df_life.exp_regions)
df_life.exp_country <- as_tibble(df_life.exp_country)
rm(life_file)

# Traitement des variables sur l'espérance de vie
df_life.exp_country$geo <- as.factor(df_life.exp_country$geo)
df_life.exp_country$name <- as.factor(df_life.exp_country$name)
df_life.exp_regions$geo <- as.factor(df_life.exp_regions$geo)
df_life.exp_regions$name <- as.factor(df_life.exp_regions$name)

