### Script pour la fusion des données

library(tidyverse)

# Les données sur la vaccination sont sur une base quotidienne alors que les 
# autres données sont sur une base annuelle. Pour faciliter la fusion des 
# données, on ajoute une variable années (time) dans le jeu de données sur la
# vaccination

df_vaccination$time <- as.numeric(str_sub(df_vaccination$date, 1, 4))

# Fusion des données de vaccination et de population
df <- left_join(df_vaccination, df_pop)

# Ajout des données du PIB
df <- left_join(df, df_pib)

# Ajout des données de l'espérance de vie
df <- left_join(df, df_esperance)

# Conserver seulement les colonnes uniques
df <- select(df, )

# Renommer les colonnes pour avoir la même nomenclature
df <- rename(df, 
    population = `Population`,
    income_per_person = `Income per person`,
    gdp = `GDP total`,
    growth_gdp_per_capita = `GDP per capita growth (%)`,
    life_expectancy = `Life expectancy`
)
