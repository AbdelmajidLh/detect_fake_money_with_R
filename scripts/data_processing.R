# Charger les packages nécessaires
packages_file_path =  paste0(config$scripts_folder_path, "load_packages.R")
print(packages_file_path)
source(packages_file_path)

packages <- c("tidyverse", "naniar", "car")

# Fonction pour convertir les colonnes en numeric et ajouter une colonne ID
prepare_data <- function(df) {
  df <- df %>% mutate(across(where(is.character), as.numeric), .except = "is_genuine")
  df <- tibble::rowid_to_column(df, "ID")
  return(df)
}

# Fonction pour générer un graphique sur les valeurs manquantes
plot_missing_values <- function(df) {
  plot <- vis_miss(df) + theme(axis.text.x =  element_text(angle = 90))
  ggsave(filename = "res/missing_values.png", plot = plot)
}

# Fonction pour construire le modèle
build_model <- function(df) {
  df2 <- df %>% filter(!is.na(margin_low))
  model <- lm(margin_low ~ diagonal + height_left + height_right + margin_up + length, data = df2)
  return(model)
}

# Fonction pour utiliser le modèle pour prédire la valeur de margin_low
predict_values <- function(df, model) {
  df <- df %>% 
    mutate(pred = predict(model, .)) %>%
    mutate(margin_low = ifelse(is.na(margin_low), pred, margin_low))
  df <- df %>% select(ID, is_genuine, diagonal, height_left, height_right, margin_low, margin_up, length) %>% as.data.frame()
  return(df)
}

# Fonction principale pour préparer et traiter les données
process_data <- function(df) {
  df <- prepare_data(df)
  plot_missing_values(df)
  #model <- build_model(df)
  #df <- predict_values(df, model)
  #plot_missing_values(df)
  return(df)
}
