### Script pour enregistrer les données traitées ###


## Jeu de données plus plus récentes, une ligne par pays/continent ##

# Si on fait des corrections dans les données et qu'on veut enregister
# write.csv(df_update, paste0('data/processed/data_update_', Sys.Date(), '.csv'), row.names = FALSE)

# Extraction de la date dernier enregistrement des données
processed_file <- list.files("data/processed/", pattern ="data_update")
date_processed_file <- str_sub(processed_file, 13, 22)

# Conditionnel pour vérifier les données doivent être enregistrées
if (date_processed_file < Sys.Date()){
    write.csv(df_update, paste0('data/processed/data_update_', Sys.Date(), '.csv'), row.names = FALSE)
    file.remove(paste0('data/processed/data_update_', date_processed_file, '.csv'))         # On enleve les données old
}


## Jeu de données basé sur la vaccination, données quotidienne ##

# Si on fait des corrections dans les données et qu'on veut enregister
# write.csv(df, paste0('data/processed/df_', Sys.Date(), '.csv'), row.names = FALSE)


# Extraction de la date dernier enregistrement des données
processed_file <- list.files("data/processed/", pattern ="df")
date_processed_file <- str_sub(processed_file, 4, 13)

# Conditionnel pour vérifier les données doivent être enregistrées
if (date_processed_file < Sys.Date()){
    write.csv(df, paste0('data/processed/df_', Sys.Date(), '.csv'), row.names = FALSE)
    file.remove(paste0('data/processed/df_', date_processed_file, '.csv'))         # On enleve les données old
}

rm(date_processed_file, month, processed_file)
