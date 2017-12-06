


#' Importer le lexique Morphalou 3.1
#'
#' Retourne un tibble contenant le lexique
#'
#' @param "..." parametres supplemantaires pour readr
#' @examples
#' \dontrun{
#' # pas de barre de progression
#' import_morphalou3(progress = F)
#' # test sur dix premières lignes
#' import_morphalou3(n_max 10)
#' }
#'
#' @importFrom readr read_csv
#' @export
import_morphalou3 <- function(...)
  {
  readr::read_csv(paste0(path.package("lemmatisr"),'/tidy_morphalou3.1.csv.gz'),
                                     col_types = readr::cols(
                                       forme_lemmatise = readr::col_character(),
                                       ID = readr::col_integer(),
                                       `CATÉGORIE` = readr::col_character(),
                                       `SOUS CATÉGORIE` = readr::col_character(),
                                       LOCUTION = readr::col_character(),
                                       GENRE = readr::col_character(),
                                       `AUTRES LEMMES LIÉS` = readr::col_character(),
                                       `PHONÉTIQUE` = readr::col_character(),
                                       ORIGINES = readr::col_character(),
                                       forme_flechie = readr::col_character(),
                                       ID_1 = readr::col_integer(),
                                       NOMBRE = readr::col_character(),
                                       MODE = readr::col_character(),
                                       GENRE_1 = readr::col_character(),
                                       TEMPS = readr::col_character(),
                                       PERSONNE = readr::col_character(),
                                       `PHONÉTIQUE_1` = readr::col_character(),
                                       ORIGINES_1 = readr::col_character(),
                                       dictionnaire = readr::col_character()
                                     ), ...)
}



#' Ouvrir la doc
#'
#' Retourne un tibble contenant le lexique
#'
#' N.B. : Les données statistiques et les conjugaisons de la documentation ont été omises dans le package
#' à cause de leur volume (200 Mo)
#' 
#' @examples
#' \dontrun{
#' lisez_moi()
#' }
#'
#' @export
lisez_moi <- function()
{
  browseURL(paste0(path.package("lemmatisr"),'/LISEZ-MOI.html'))
}

#' Lire la licence de Morphalou
#'
#' ouvrir le fichier licence de Morphalou (LGPLLR)
#'
#' @examples
#' \dontrun{
#' licence_Morphalou()
#' }
#'
#' @export
licence_Morphalou <- function()
{
  browseURL(paste0(path.package("lemmatisr"),'/licenceLGPLLR.txt'))
}
