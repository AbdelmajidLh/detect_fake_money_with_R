# Charger les packages
source("scripts/load_packages.R")
packages <- c("futile.logger", "jsonlite", "ggplot2", "tidyr", "dplyr", "stats", "kableExtra", "glmnet", "shiny")
load_packages(packages)


# Charger la configuration
tryCatch({
  flog.info("Charger la configuration")
  config <- jsonlite::fromJSON("config/config.json")
  flog.info("Fin Chargement de la configuration")
}, error = function(e) {
  flog.error(paste("Erreur lors du chargement de la configuration :", e$message))
  config <- NULL  # Ou toute autre action que vous souhaitez prendre en cas d'erreur
})

# Configurer le logger
source("scripts/logger.R")

# charger les données
source("scripts/data_load.R")
data_file_path <- config$data_file_path
df <- load_data(data_file_path)

# Préparer les données
source("scripts/data_processing.R")
df <- process_data(df)




















# Chargement des fonctions et scripts

#source("R/functions.R")


#source("R/exploratory_analysis.R")
#source("R/model_kmeans.R")
#source("R/model_logistic_regression.R")
#source("R/shiny_deployment.R")

# Chemin vers le fichier de données
data_file_path <- "data/billets_production.csv"

# Importation et nettoyage des données
data <- importer_donnees(data_file_path)
#data_cleaned <- nettoyer_donnees(data)

# Analyse exploratoire des données
#description_donnees(data_cleaned)
#distribution_variables(data_cleaned)

# Modèle de classification automatique avec kmeans
#modele_kmeans <- entrainer_modele_kmeans(data_cleaned)
#nombre_groupes <- determiner_nombre_groupes(data_cleaned)
#afficher_resultats_kmeans(modele_kmeans, nombre_groupes)

# Modèle de régression logistique
#modele_regression_logistique <- entrainer_modele_regression_logistique(data_cleaned)
#resultats_regression_logistique <- evaluer_modele_regression_logistique(modele_regression_logistique, data_cleaned)
#afficher_resultats_regression_logistique(resultats_regression_logistique)

# Déploiement avec Shiny
#lancer_deployment_shiny()
