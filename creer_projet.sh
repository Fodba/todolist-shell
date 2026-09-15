#!/bin/bash


echo "------------------------------------"
echo "Bonjour !"
read -p "Quel est le nom de votre projet ? " project_name
echo "------------------------------------"

cd /home/fef/Documents/Programmations
mkdir $project_name
cd $project_name
mkdir data scripts results
echo "Votre projet " $project_name " a bien été créé avec l'architecture. Le projet contient les dossiers data, scripts et results."



