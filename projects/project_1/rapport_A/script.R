library(targets)
library(tarchetypes)

tar_option_set(
  packages = c("dplyr") 
)

# chargement des fonctions
lapply(list.files("R", full.names = TRUE), source)

# plan de construction
list(
  
  # chargement des données depuis le store ETL
  # tar_target(file_data, "etl/store_etl/objects/tidy_data", format = "file"),
  
  tar_target(data, tar_read(tidy_data, store = 'etl/store_etl')),
  
  # production du plot
  tar_target(plot, plot_names(data)),
  
  # production du rapport
  # "projects/project_1/rapport_A/rapport.qmd"
  tar_quarto(report, path = getwd())
)
