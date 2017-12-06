# lemmatisr

Package contenant le lexique Morphalou 3.1 pour un accès direct dans R

L'idée est de récupérer les correspondances lemmes - formes fléchies sous forme d'un tibble pour lemmatiser un texte avec tidytext et dplyr.


## Référence

Morphalou 3.1

https://www.ortolang.fr/market/lexicons/morphalou

## Licence et lisez-moi

Deux fonctions permettent d'accéder à la documentation et à la licence de Morphalou 3.1

```
library(lemmatisr)

# La doc s'ouvre dans votre navigateur
lisez_moi()
# Le fichier de licence s'ouvre
licence_Morphalou()
```

## Accéder au lexique

### Import dans R

```
library(lemmatisr)

# Importer le lexique sous forme de tibble
lexique <- import_morphalou3()

# 10 premières lignes
lexique_test <- import_morphalou3(n_max = 10)


# Ne pas afficher de barre de progression à la lecture du fichier importé
lexique_test <- import_morphalou3(progress = F)
```

### Information sur la table contenue dans le package

Une étape de "tidying" a été effectuée pour produire le fichier `csv.gz` présent dans le package, la voici:

```
# Mise en forme adéquate du fichier csv Morphalou3.1 pour des traitements de type tidytext (dplyr, etc.)
# Lecture du fichier csv d'origine
morphalou <- readr::read_csv2('sources/Morphalou3.1/Morphalou3.1_CSV.csv', skip = 15)

# sauvegarde en Rds
saveRDS(morphalou, 'sources/Morphalou3.1/morphalou3.1.Rds')

library(tidyr)
# remplir les champs à vide pour toutes les formes lemmatisées 
# (équivalent remplir cellules vides)
morphalou_ <- morphalou %>% 
  fill(GRAPHIE, ID, `CATÉGORIE`,
       LOCUTION, GENRE,
       `PHONÉTIQUE`) %>% 
  rename(forme_lemmatise = GRAPHIE, forme_flechie = GRAPHIE_1) %>% 
  mutate(dictionnaire = tolower(`CATÉGORIE`))

readr::write_csv(morphalou_, 'results/tidy_morphalou3.1.csv.gz')
```

