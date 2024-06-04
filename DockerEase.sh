#!/bin/bash

BLUE='\033[0;34m'
GREEN='\033[0;32m'
RED='\033[0;31m'
ORANGE='\033[0;33m'
NC='\033[0m'

while true; do
  # FR : Choix langue
  # ENG : Choose language
  echo -e "${BLUE}Choose your language / Choisissez votre langue:${NC}"
  echo "1. English"
  echo "2. Français"
  read -p "Enter your choice (1 or 2): " lang_choice

  if [ "$lang_choice" == "1" ]; then
    # ENG : Add Docker's official GPG key :
    sudo apt-get update && \
    sudo apt-get install -y ca-certificates curl && \
    sudo install -m 0755 -d /etc/apt/keyrings && \
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc && \
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    if [ $? -eq 0 ]; then
      echo -e "${GREEN}Docker GPG key added successfully${NC}"
    else
      echo -e "${RED}Error adding Docker GPG key${NC}"
      exit 1
    fi

    # ENG : Add the repository to Apt sources :
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
      $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null && \
    sudo apt-get update

    if [ $? -eq 0 ]; then
      echo -e "${GREEN}Docker repository added successfully${NC}"
    else
      echo -e "${RED}Error adding Docker repository${NC}"
      exit 1
    fi

    # ENG : Install Docker
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose

    if [ $? -eq 0 ]; then
      echo -e "${GREEN}Docker installation successful${NC}"
    else
      echo -e "${RED}Error during Docker installation${NC}"
      exit 1
    fi

    # ENG : Run a test container
    sudo docker run hello-world

    if [ $? -eq 0 ]; then
      echo -e "${GREEN}Docker test container ran successfully${NC}"
    else
      echo -e "${RED}Error running Docker test container${NC}"
      exit 1
    fi

    # ENG : Add user to docker group
    sudo groupadd -f docker && \
    sudo usermod -aG docker $USER && \
    sudo systemctl restart docker

    if [ $? -eq 0 ]; then
      echo -e "${GREEN}User added to Docker group and Docker service restarted successfully${NC}"
    else
      echo -e "${RED}Error adding user to Docker group or restarting Docker service${NC}"
      exit 1
    fi

    # ENG : Check if the user is added to the docker group
    id -nG

    # ENG : Inform the user to reconnect
    echo -e "${ORANGE}Please restart the machine to apply group changes.${NC}"

    break
  
#-------------------------------------------------------------------------------------------------------------

  elif [ "$lang_choice" == "2" ]; then
    # FR : Ajoute la clé GPG officielle de Docker :
    sudo apt-get update && \
    sudo apt-get install -y ca-certificates curl && \
    sudo install -m 0755 -d /etc/apt/keyrings && \
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc && \
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    if [ $? -eq 0 ]; then
      echo -e "${GREEN}Clé GPG de Docker ajoutée avec succès${NC}"
    else
      echo -e "${RED}Erreur lors de l'ajout de la clé GPG de Docker${NC}"
      exit 1
    fi

    # FR : Ajoute le dépôt aux sources d'Apt :
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
      $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null && \
    sudo apt-get update

    if [ $? -eq 0 ]; then
      echo -e "${GREEN}Dépôt Docker ajouté avec succès${NC}"
    else
      echo -e "${RED}Erreur lors de l'ajout du dépôt Docker${NC}"
      exit 1
    fi

    # FR : Installe Docker
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose

    if [ $? -eq 0 ]; then
      echo -e "${GREEN}Installation de Docker réussie${NC}"
    else
      echo -e "${RED}Erreur lors de l'installation de Docker${NC}"
      exit 1
    fi

    # FR : Exécute un conteneur de test
    sudo docker run hello-world

    if [ $? -eq 0 ]; then
      echo -e "${GREEN}Conteneur de test Docker exécuté avec succès${NC}"
    else
      echo -e "${RED}Erreur lors de l'exécution du conteneur de test Docker${NC}"
      exit 1
    fi

    # FR : Ajoute l'utilisateur au groupe docker
    sudo groupadd -f docker && \
    sudo usermod -aG docker $USER && \
    sudo systemctl restart docker

    if [ $? -eq 0 ]; then
      echo -e "${GREEN}Utilisateur ajouté au groupe Docker et service Docker redémarré avec succès${NC}"
    else
      echo -e "${RED}Erreur lors de l'ajout de l'utilisateur au groupe Docker ou du redémarrage du service Docker${NC}"
      exit 1
    fi

    # FR : Vérifie si l'utilisateur a été ajouté au groupe docker
    id -nG

    # FR : Informe l'utilisateur de se reconnecter
    echo -e "${ORANGE}Veuillez redémarrer la machine pour appliquer les modifications de groupe.${NC}"

    break

  else
    echo "Invalid choice. Please try again."
  fi
done
