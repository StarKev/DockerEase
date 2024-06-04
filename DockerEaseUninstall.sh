#!/bin/bash

BLUE='\033[0;34m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

while true; do
  # FR : Choix langue
  # ENG : Choose language
  echo "Choose your language / Choisissez votre langue:"
  echo "1. English"
  echo "2. Français"
  read -p "Enter your choice (1 or 2): " lang_choice

  if [ "$lang_choice" == "1" ]; then
    # ENG : Remove Docker GPG key
    sudo rm /etc/apt/keyrings/docker.asc
    if [ $? -eq 0 ]; then
      echo -e "${GREEN}Docker GPG key removed successfully${NC}"
    else
      echo -e "${RED}Error removing Docker GPG key${NC}"
      exit 1
    fi

    # ENG : Remove Docker Apt source
    sudo rm /etc/apt/sources.list.d/docker.list
    if [ $? -eq 0 ]; then
      echo -e "${GREEN}Docker Apt source removed successfully${NC}"
    else
      echo -e "${RED}Error removing Docker Apt source${NC}"
      exit 1
    fi

    # ENG : Update Apt to reflect changes
    sudo apt-get update
    if [ $? -eq 0 ]; then
      echo -e "${GREEN}Apt updated successfully${NC}"
    else
      echo -e "${RED}Error updating Apt${NC}"
      exit 1
    fi

    # ENG : Uninstall Docker and its components
    sudo apt-get remove -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose
    if [ $? -eq 0 ]; then
      echo -e "${GREEN}Docker and components removed successfully${NC}"
    else
      echo -e "${RED}Error removing Docker and components${NC}"
      exit 1
    fi

    # ENG : Remove residual Docker packages
    sudo apt-get autoremove -y
    if [ $? -eq 0 ]; then
      echo -e "${GREEN}Residual Docker packages removed successfully${NC}"
    else
      echo -e "${RED}Error removing residual Docker packages${NC}"
      exit 1
    fi

    sudo apt-get purge -y docker-ce containerd.io docker-compose
    if [ $? -eq 0 ]; then
      echo -e "${GREEN}Docker packages purged successfully${NC}"
    else
      echo -e "${RED}Error purging Docker packages${NC}"
      exit 1
    fi

    # ENG : Remove Docker data
    sudo rm -rf /var/lib/docker
    if [ $? -eq 0 ]; then
      echo -e "${GREEN}Docker data removed successfully${NC}"
    else
      echo -e "${RED}Error removing Docker data${NC}"
      exit 1
    fi

    sudo rm -rf /var/lib/containerd
    if [ $? -eq 0 ]; then
      echo -e "${GREEN}Containerd data removed successfully${NC}"
    else
      echo -e "${RED}Error removing containerd data${NC}"
      exit 1
    fi

    # ENG : Remove user from Docker group
    sudo deluser ${USER} docker
    if [ $? -eq 0 ]; then
      echo -e "${GREEN}User removed from Docker group successfully${NC}"
    else
      echo -e "${RED}Error removing user from Docker group${NC}"
      exit 1
    fi

    # ENG : Verify user's groups
    id -nG
    echo -e "${GREEN}All Docker actions have been successfully undone.${NC}"
    break

#-------------------------------------------------------------------------------------------------------------

  elif [ "$lang_choice" == "2" ]; then
    # FR : Supprimer la clé GPG de Docker
    sudo rm /etc/apt/keyrings/docker.asc
    if [ $? -eq 0 ]; then
      echo -e "${GREEN}Clé GPG de Docker supprimée avec succès${NC}"
    else
      echo -e "${RED}Erreur lors de la suppression de la clé GPG de Docker${NC}"
      exit 1
    fi

    # FR : Supprimer la source Apt pour Docker
    sudo rm /etc/apt/sources.list.d/docker.list
    if [ $? -eq 0 ]; then
      echo -e "${GREEN}Source Apt Docker supprimée avec succès${NC}"
    else
      echo -e "${RED}Erreur lors de la suppression de la source Apt Docker${NC}"
      exit 1
    fi

    # FR : Mettre à jour Apt pour refléter les changements
    sudo apt-get update
    if [ $? -eq 0 ]; then
      echo -e "${GREEN}Apt mis à jour avec succès${NC}"
    else
      echo -e "${RED}Erreur lors de la mise à jour de Apt${NC}"
      exit 1
    fi

    # FR : Désinstaller Docker et ses composants
    sudo apt-get remove -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose
    if [ $? -eq 0 ]; then
      echo -e "${GREEN}Docker et ses composants supprimés avec succès${NC}"
    else
      echo -e "${RED}Erreur lors de la suppression de Docker et de ses composants${NC}"
      exit 1
    fi

    # FR : Supprimer les résidus des paquets Docker
    sudo apt-get autoremove -y
    if [ $? -eq 0 ]; then
      echo -e "${GREEN}Paquets Docker résiduels supprimés avec succès${NC}"
    else
      echo -e "${RED}Erreur lors de la suppression des paquets Docker résiduels${NC}"
      exit 1
    fi

    sudo apt-get purge -y docker-ce containerd.io docker-compose
    if [ $? -eq 0 ]; then
      echo -e "${GREEN}Paquets Docker purgés avec succès${NC}"
    else
      echo -e "${RED}Erreur lors de la purge des paquets Docker${NC}"
      exit 1
    fi

    # FR : Supprimer les données Docker
    sudo rm -rf /var/lib/docker
    if [ $? -eq 0 ]; then
      echo -e "${GREEN}Données Docker supprimées avec succès${NC}"
    else
      echo -e "${RED}Erreur lors de la suppression des données Docker${NC}"
      exit 1
    fi

    sudo rm -rf /var/lib/containerd
    if [ $? -eq 0 ]; then
      echo -e "${GREEN}Données containerd supprimées avec succès${NC}"
    else
      echo -e "${RED}Erreur lors de la suppression des données containerd${NC}"
      exit 1
    fi

    # FR : Supprimer l'utilisateur du groupe Docker
    sudo deluser ${USER} docker
    if [ $? -eq 0 ]; then
      echo -e "${GREEN}Utilisateur supprimé du groupe Docker avec succès${NC}"
    else
      echo -e "${RED}Erreur lors de la suppression de l'utilisateur du groupe Docker${NC}"
      exit 1
    fi

    # FR : Vérification des groupes de l'utilisateur
    id -nG
    echo -e "${GREEN}Toutes les actions Docker ont été annulées avec succès.${NC}"
    break

  else
    echo -e "${RED}Invalid choice. Please try again.${NC}"
  fi
done
