#!/bin/bash

# Mon tout premier script shell
# Il va afficher un message et la date actuelle
DATE_ACTUELLE=$(date) # Stocke la sortie de la commande date

echo "------------------------------------"
echo "Bonjour depuis mon premier script !"
echo "Nous sommes le :"
echo $DATE_ACTUELLE # La commande 'date' affiche la date et l'heure
echo "------------------------------------"



# Script avec une variable

UTILISATEUR=$(whoami) # La commande 'whoami' renvoie votre nom d'utilisateur
MESSAGE="Script exécuté par $UTILISATEUR"

echo "------------------------------------"
echo "$MESSAGE"
echo "Date : $DATE_ACTUELLE"
echo "------------------------------------"


#!/bin/bash

# Script interactif

echo "Bonjour !"
read -p "Quel est votre nom ? " user_name
read -p "Dans quel dossier travaillez-vous aujourd'hui ? " working_dir

echo "------------------------------------"
echo "Bienvenue, $user_name !"
echo "Vous travaillez dans le dossier : $working_dir"
echo "Contenu de ce dossier :"
ls -la "$working_dir" # Utilise la variable pour lister le contenu du dossier spécifié
echo "------------------------------------"
