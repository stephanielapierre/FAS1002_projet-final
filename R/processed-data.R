### Script pour enregistrer les données traitées ###


## Jeu de données 2021, une ligne par pays/continent ##

# Si on fait des corrections dans les données et qu'on veut enregister
# write.csv(df2021, paste0('data/processed/data_year_', Sys.Date(), '.csv'))

# Extraction de la date dernier enregistrement des données
processed_file <- list.files("data/processed/", pattern ="data_year")
date_processed_file <- str_sub(processed_file, 11, 20)

# Conditionnel pour vérifier les données doivent être enregistrées
if (date_processed_file < Sys.Date()){
    write.csv(df2021, paste0('data/processed/data_year_', Sys.Date(), '.csv'))
    file.remove(paste0('data/processed/data_year_', date_processed_file, '.csv'))         # On enleve les données old
}


## Jeu de données basé sur la vaccination, données quotidienne ##

# Si on fait des corrections dans les données et qu'on veut enregister
# write.csv(df, paste0('data/processed/df_', Sys.Date(), '.csv'))


# Extraction de la date dernier enregistrement des données
processed_file <- list.files("data/processed/", pattern ="df")
date_processed_file <- str_sub(processed_file, 4, 13)

# Conditionnel pour vérifier les données doivent être enregistrées
if (date_processed_file < Sys.Date()){
    write.csv(df, paste0('data/processed/df_', Sys.Date(), '.csv'))
    file.remove(paste0('data/processed/df_', date_processed_file, '.csv'))         # On enleve les données old
}
