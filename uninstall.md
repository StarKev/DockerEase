<h1 align="center">
<br>
<a href="https://github.com/StarKev"><img src="sources/DockerEase.png"></a>
<br>
DockerEase
<br>
</h1>

[English](#english) | [Français](#français)

# English

## Script Description
The purpose of this script is to automatically and simply uninstall Docker and all its components, as well as revert any changes made during installation.

## Functions
- Remove Docker's GPG key.
- Remove Docker's Apt source.
- Update Apt to reflect the changes.
- Uninstall Docker and its components.
- Remove Docker package residues.
- Remove Docker data.
- Remove the user from the Docker group.
- Reset permissions and ownership of the Docker directory in the user's home folder.

## Script Execution
1. Download the script to your machine.
2. Open a terminal and navigate to the directory where the script is located.
3. Make the script executable with the command: `sudo chmod u+x DockerEaseUninstall.sh`
4. Run the script with the command: `./DockerEaseUninstall.sh`

## Example Script Output
When you run the script, you should see a message confirming that all Docker actions have been successfully undone.
#

# Français

## Description du script
Le but de ce script est de désinstaller automatiquement et simplement Docker et tous ses composants, ainsi que de revenir sur les modifications apportées lors de l'installation.

## Fonctions
- Supprimer la clé GPG de Docker.
- Supprimer la source Apt de Docker.
- Mettre à jour Apt pour refléter les changements.
- Désinstaller Docker et ses composants.
- Supprimer les résidus des paquets Docker.
- Supprimer les données Docker.
- Supprimer l'utilisateur du groupe Docker.
- Réinitialiser les autorisations et la propriété du répertoire Docker dans le dossier personnel de l'utilisateur.

## Exécution du script
1. Téléchargez le script sur votre machine.
2. Ouvrez un terminal et accédez au répertoire où se trouve le script.
3. Rendez le script exécutable avec la commande : `sudo chmod u+x DockerEaseUninstall.sh`
4. Exécutez le script avec la commande : `./DockerEaseUninstall.sh`

## Exemple de sortie du script
Lorsque vous exécutez le script, vous devriez voir un message confirmant que toutes les actions Docker ont été annulées avec succès.
