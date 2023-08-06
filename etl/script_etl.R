library(targets)
library(tarchetypes)

tar_option_set(
  packages = c("dplyr", "readr") 
)

# chargement des fonctions
lapply(list.files("R", full.names = TRUE), source)

# plan de construction
list(
  # cette target verifie que le fichier recherché existe bien à l'emplacement spécifié
  # format FILE signifie que cette target sera relancée si le fichier est modifié
  tar_target(raw_data_file, "data/male-first-names-2013.csv", format = "file" ),
  
  # cette target enregistre les données brutes dans le store "etl"
  tar_target(raw_data, load_raw_data(tar_read(raw_data_file))),
  
  # cette target enregistre les données raffinées dans le store "etl"
  tar_target(tidy_data, tidyfy_raw_data(raw_data))
)