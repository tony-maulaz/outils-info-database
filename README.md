# GIT
## Description
![works with two origins](images/github.png)

## Récupération des sources pour avoir deux dépôts distants
- naviguer dans un répertoire de travail
- cloner les fichiers : 
  - SSH : `git clone -o tmz git@github.com:tony-maulaz/outils-info-database.git`
  - HTTPS : `git clone -o tmz https://github.com/tony-maulaz/outils-info-database.git`
- créer un `repository` dans **votre** compte **Github**
- copier le lien du `repository`
- ajouter une nouvelle `remote` dans le répertoire local : `git remote add origin <repo link>`
- pousser les fichiers dans **votre** `repository` : `git push -u origin master`

## Récupérer les modifications du repo TMZ
- `git pull tmz`

## Pousser les modifications dans votre repo
- `git commit -am "<message>`
- `git push`

## Ajouter de nouveaux fichiers
- `git add .`
- `git commit -am "<message>`
- `git push`

## Exécution de la base de données
- avec une console, aller dans le répertoire local.
- `docker-compose up -d`

# Datagrip
### Ouverture des fichiers sql
- ouvrir Datagrip
- `File -> Attach directory to project`
- ouvrir un fichier `SQL`
- exécuter le code dans les fichiers avec `Ctrl + Entrée`

### Exécution des scripts
Pour tester des requêtes, utiliser la console.
Pour du code final, utiliser les fichiers sql (vous pouvez en créer des nouveaux).