library(futile.logger)

load_packages <- function(packages) {
  # Vérifie si les packages sont installés
  flog.info("Début chargement des packages")
  for (package in packages) {
    if (!requireNamespace(package, quietly = TRUE)) {
      # Installe le package s'il n'est pas installé
      flog.info("Installation du package", package)
      install.packages(package)
    }
  }
  
  # Charge les packages
  lapply(packages, require, character.only = TRUE)
  flog.info("Fin chargement des packages")
}
