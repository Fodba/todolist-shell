#!/bin/bash


TACHES=()
IDs=0
RUNNING=0


echo "------------------------------------"
echo $TACHES

echo "Liste des actions possibles : "
echo "1 : Voir la liste des tâches "
echo "2 : Ajouter une tâche "
echo "3 : Modifier une tache "
echo "4 : Terminer une tâche "
echo "5 : Supprimer une tache "
read -p "Choisissez une action : " choix

echo $choix

afficher_liste()
{
    IDs=0
    archives=$(cat "taches.md")
    for item in "${archives[@]}"
    do
        echo "$item"
        # IDs=$((IDs+1))
    done
    return $IDs
}

compte_taches()
{
    # IDs=1
    IDs=$(wc -l "taches.md" | jq -r)
    # archives=$(cat "taches.md")
    # for item in "${archives[@]}"
    # do
    #     echo $IDs
    #     IDs=$((IDs+1))
    # done
    echo $IDs
    echo "------------------------------------"
}

ajouter_tache()
{
    read -p "Veuillez renseigner une nouvelle tâche : " tache_desc
    echo $tache_desc
    echo $IDs
    IDs=$((IDs+1))
    echo "------------------------------------"
    TACHES+=([$IDs,"$tache_desc"])
    echo $TACHES >> "taches.md" | jq -R
    echo $TACHES
    echo $IDs
}

# modifier_tache()
# {

# }

# supprimer_tache()
# {

# }

# valider_tache()
# {

# }

compte_taches
afficher_liste
echo $IDs
echo "------------------------------------"
echo "------------------------------------"
echo "------------------------------------"

if [[ $choix = 1 ]]; then

    afficher_liste

elif [[ $choix = 2 ]]; then
    # read -p "Veuillez renseigner une nouvelle tâche : " tache_desc
    # echo $tache_desc
    # TACHES+=([$IDs,"$tache_desc"])
    # IDs=$((IDS+1))
    # echo $TACHES >> "taches.md" | jq -R
    # echo $TACHES
    # echo $IDs
    ajouter_tache
    afficher_liste
else 
    echo "------------------------------------"
    echo $archives
    for item in "${archives[@]}\n"
    do
        echo "$item \n"
    done
    
    if [[ $choix = 3 ]]; then
        read -p "Indiquez le numéro de la tâche à modifier " tache_select
    elif [[ $choix = 4 ]]; then
        read -p "Indiquez le numéro de la tâche à valider " tache_select
    elif [[ $choix = 5 ]]; then
        read -p "Indiquez le numéro de la tâche à supprimer " tache_select
    fi
fi