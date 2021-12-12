### Script pour enregistrer les données traitées

# Si on fait des corrections dans les données et qu'on veut enregister
# write.csv(df2021, paste0('data/processed/data_', Sys.Date(), '.csv'))

# Extraction de la date dernier enregistrement des données
processed_file <- list.files("data/processed/", pattern ="data")
date_processed_file <- str_sub(processed_file, 6, 15)

# Conditionnel pour vérifier les données doivent être enregistrées
if (date_processed_file < Sys.Date()){
    write.csv(df2021, paste0('data/processed/data_', Sys.Date(), '.csv'))
    file.remove(paste0('data/processed/data_', date_processed_file, '.csv'))         # On enleve les données old
}
