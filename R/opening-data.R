### Script pour l'ouverture des données et le traitement du type de variables

library(tidyverse)
library(readxl)
library(dplyr)
library(gapminder)


# Ouverture des données sur la vaccination
vac_file <- list.files("data/raw/", pattern ="vaccination")
df_vaccination <- read.csv(paste0("data/raw/", vac_file))
df_vaccination <- as_tibble(df_vaccination)
rm(vac_file)

# Traitement des variables sur la vaccination
df_vaccination$location <- as.factor(df_vaccination$location)

df_vaccination$date <- as.Date(df_vaccination$date)

# La variable `location` contient autant des pays que des régions. 
# Afin de pouvoir distinguer les pays des régions, il faut ajouter une nouvelle variable. 
df_vaccination$region <- str_detect(df_vaccination$iso_code, "OWID_")
df_vaccination$region <- str_replace(df_vaccination$region, "TRUE", "continent")
df_vaccination$region <- str_replace(df_vaccination$region, "FALSE", "pays")
df_vaccination$region <- as.factor(df_vaccination$region)

# On renomme la variable iso_code pour faciliter la fusion entre les jeux de données
names(df_vaccination)[names(df_vaccination) == "iso_code"] <- "geo"
df_vaccination$geo <- str_to_lower(df_vaccination$geo)
df_vaccination$geo <- as.factor(df_vaccination$geo)

# Correction des codes de géographies
df_vaccination$geo <- str_replace(df_vaccination$geo, "owid_afr", "africa")
df_vaccination$geo <- str_replace(df_vaccination$geo, "owid_asi", "asia")
df_vaccination$geo <- str_replace(df_vaccination$geo, "owid_eur", "europe")
df_vaccination$geo <- str_replace(df_vaccination$geo, "owid_nam", "north america")
# the americas?
df_vaccination$geo <- str_replace(df_vaccination$geo, "owid_oce", "oceania")
df_vaccination$geo <- str_replace(df_vaccination$geo, "owid_sam", "south america")
df_vaccination$geo <- str_replace(df_vaccination$geo, "owid_wrl", "world")

# Enlever des observations non pertinentes
df_vaccination <- filter(df_vaccination, df_vaccination$geo != "owid_hic")      #owid_hic High income
df_vaccination <- filter(df_vaccination, df_vaccination$geo != "owid_lic")      #owid_lic Low income
df_vaccination <- filter(df_vaccination, df_vaccination$geo != "owid_lmc")      #owid_lmc Low middle income
df_vaccination <- filter(df_vaccination, df_vaccination$geo != "owid_umc")      #owid_umc Upper middle income
df_vaccination <- filter(df_vaccination, df_vaccination$geo != "owid_eng")      #owid_eng England
df_vaccination <- filter(df_vaccination, df_vaccination$geo != "owid_nir")      #owid_nir Northern Ireland
df_vaccination <- filter(df_vaccination, df_vaccination$geo != "owid_sct")      #owid_sct Scotland
df_vaccination <- filter(df_vaccination, df_vaccination$geo != "owid_wls")      #owid_wls Wales
df_vaccination <- filter(df_vaccination, df_vaccination$geo != "owid_eun")      #owid_eun Union européenne
df_vaccination <- filter(df_vaccination, df_vaccination$geo != "owid_kos")      #owid_kos Kosovo
df_vaccination <- filter(df_vaccination, df_vaccination$geo != "owid_cyn")      #owid_cyn North Cyprus

# Traitement facteur de la variable geo
df_vaccination$geo <- as.factor(df_vaccination$geo)

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



# Extraction d'une liste des pays par continent à partir des données du package Gapminder

gapminder <- gapminder::gapminder
gapminder <- filter(gapminder, gapminder$year == 2007)
gapminder <- select(gapminder, c("country", "continent"))
