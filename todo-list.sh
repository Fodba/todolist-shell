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
    IDs=$(wc -l <"taches.md" )
    # archives=$(cat "taches.md")
    # for item in "${archives[@]}"
    # do
    #     echo $IDs
    #     IDs=$((IDs+1))
    # done
    echo $IDs "tache(s) sont enregistrées"
    echo "------------------------------------"
}

ajouter_tache()
{
    read -p "Veuillez renseigner une nouvelle tâche : " tache_desc
    echo $tache_desc
    compte_taches
    # echo $IDs
    IDs=$((IDs+1))
    echo "------------------------------------"
    TACHES+=([$IDs,"$tache_desc",0])
    echo $TACHES >> "taches.md" | jq -R
    # echo $TACHES
    # echo $IDs
}

afficher_liste2()
{
    IDs=0
    compteur=0
    choix=0
    archives=$(cat "taches.md")
    for item in "${archives[@]}"
    do
        echo "$item"
        compteur=$((compteur+1))
        if [[ $1 != 0 ]]; then
            choix=$compteur
            echo $choix
        fi
        # IDs=$((IDs+1))
    done
    return $IDs
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
afficher_liste2 5
echo "------------------------------------"

if [[ $choix = 1 ]]; then

    compte_taches
    afficher_liste

elif [[ $choix = 2 ]]; then

    ajouter_tache
    afficher_liste

else 

    echo "------------------------------------"
    compte_taches
    afficher_liste

    # echo $archives
    # for item in "${archives[@]}\n"
    # do
    #     echo "$item \n"
    # done
    
    if [[ $choix = 3 ]]; then
        read -p "Indiquez le numéro de la tâche à modifier " tache_select
    elif [[ $choix = 4 ]]; then
        read -p "Indiquez le numéro de la tâche à valider " tache_select
    elif [[ $choix = 5 ]]; then
        read -p "Indiquez le numéro de la tâche à supprimer " tache_select
    fi
fi