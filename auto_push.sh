#!/bin/bash

# Répertoire de ton projet
cd /c/xampp/htdocs/AMAZON

# Boucle infinie pour vérifier les changements toutes les 10 secondes
while true; do
    # Vérifie s'il y a des changements
    git status -s | grep -q .  # Si des fichiers sont modifiés, cette commande retourne un statut
    if [ $? -eq 0 ]; then
        echo "Des changements ont été détectés, commit et push en cours..."
        git add .
        git commit -m "Modifications automatiques"
        git push origin main
    else
        echo "Aucun changement détecté."
    fi
    # Attendre 10 secondes avant de recommencer
    sleep 10
done
