library(futile.logger)

load_data <- function(file_path) {
  tryCatch({
    # Ecrire dans le log
    flog.info("Début du chargement des données depuis %s", file_path)
    
    # Charger les données
    df <- read.csv2(file_path, sep = ";", stringsAsFactors = FALSE)
    
    # Ecrire dans le log
    flog.info("Fin du chargement des données")
    
    return(df)
  }, error = function(e) {
    # Ecrire l'erreur dans le log
    flog.error("Une erreur s'est produite lors du chargement des données : %s", e)
  })
}
