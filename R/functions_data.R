print('chargement fichier functions_data')

load_raw_data <- function(data_file) {
  read_delim(data_file, 
             delim = ";", escape_backslash = TRUE, 
             trim_ws = TRUE)
}

tidyfy_raw_data <- function(raw_data) {
  raw_data |> 
    rename(
      firstname = `First name`,
      number = Number
    ) |> 
    select(firstname, number)
}