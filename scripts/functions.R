# Fonction pour importer le fichier de configuration
importer_configuration <- function(chemin_fichier) {
  configuration <- fromJSON(chemin_fichier)
  return(configuration)
}