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
df_vaccination$region <- str_detect(df_vaccination$iso_code, "OWID_")
df_vaccination$region <- str_replace(df_vaccination$region, "TRUE", "continent")
df_vaccination$region <- str_replace(df_vaccination$region, "FALSE", "pays")
df_vaccination$region <- as.factor(df_vaccination$region)



# Ouverture des données sur la population
pop_file <- list.files("data/raw/", pattern ="population")
df_pop_regions <- read_excel(paste0("data/raw/", pop_file), sheet = "data-for-regions-by-year")
df_pop_country <- read_excel(paste0("data/raw/", pop_file), sheet = "data-for-countries-etc-by-year")
rm(pop_file)

# Ajout de la variable région (continent ou pays)
df_pop_country$region <- "pays"
df_pop_regions$region <- "continent"

# Fusion des dataframe Pays et Continent
df_pop <- bind_rows(df_pop_country, df_pop_regions)
df_pop <- as_tibble(df_pop)

# Traitement des variables sur la population
df_pop$geo <- as.factor(df_pop$geo)
df_pop$name <- as.factor(df_pop$name)
df_pop$region <- as.factor(df_pop$region)

# Drop les dataframe Pays et Continent
rm(df_pop_country, df_pop_regions)


# Ouverture des données sur le PIB
pib_file <- list.files("data/raw/", pattern ="pib")
df_pib_regions <- read_excel(paste0("data/raw/", pib_file), sheet = "data-for-regions-by-year")
df_pib_country <- read_excel(paste0("data/raw/", pib_file), 
                             sheet = "data-for-countries-etc-by-year",
                             skip = 1,
                             col_names = c("geo", "name", "time", "Income per person", "GDP total", "GDP per capita growth (%)"))
rm(pib_file)

# Ajout de la variable région (continent ou pays)
df_pib_country$region <- "pays"
df_pib_regions$region <- "continent"

# Fusion des dataframe Pays et Continent
df_pib <- bind_rows(df_pib_country, df_pib_regions)
df_pib <- as_tibble(df_pib)

# Traitement des variables sur le PIB
df_pib$geo <- as.factor(df_pib$geo)
df_pib$name <- as.factor(df_pib$name)
df_pib$region <- as.factor(df_pib$region)

# Drop les dataframe Pays et Continent
rm(df_pib_country, df_pib_regions)



# Ouverture des données sur l'espérance de vie
life_file <- list.files("data/raw/", pattern ="life-expectancy")
df_life.exp_regions <- read_excel(paste0("data/raw/", life_file), sheet = "data-for-regions-by-year")
df_life.exp_country <- read_excel(paste0("data/raw/", life_file), sheet = "data-for-countries-etc-by-year")
rm(life_file)

# Ajout de la variable région (continent ou pays)
df_life.exp_country$region <- "pays"
df_life.exp_regions$region <- "continent"

# Fusion des dataframe Pays et Continent
df_esperance <- bind_rows(df_life.exp_country, df_life.exp_regions)
df_esperance <- as_tibble(df_esperance)

# Traitement des variables sur le PIB
df_esperance$geo <- as.factor(df_esperance$geo)
df_esperance$name <- as.factor(df_esperance$name)
df_esperance$region <- as.factor(df_esperance$region)

# Drop les dataframe Pays et Continent
rm(df_life.exp_country, df_life.exp_regions)

