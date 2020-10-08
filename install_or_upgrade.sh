#!/bin/bash

echo "Node.js including npm"
echo "Use the following command lines:"
echo "Add PPAs etc:"
echo " $ curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -"
echo "   (the above will also run apt update)"
echo " $ sudo apt-get install -y nodejs"
echo "Fix npm so that you can install packages without sudo:"
echo " $ mkdir ~/.nvm"
echo " $ npm config set prefix '~/.nvm'"
echo " update your .profile or .bashrc so that \$HOME/.nvm/bin comes early in your PATH"
echo
echo "Angular CLI"
echo " $ npm install -g @angular/cli"
echo
echo "OpenJDK 11"
echo " $ sudo apt-get install openjdk-11-jdk"
echo
echo "Set up SSH keys on bitbucket."
echo "Generating keys (skip this step if you have keys already)"
echo " $ ssh-keygen"
echo "Add your public key to your bitbucket account"
echo " $ cat ~/.ssh/id_rsa.pub"
echo " Copy the key text"
echo " On bitbucket, click you account avatar, choose Personal settings"
echo " On Personal settings, navigate to SSH Keys"
echo " Click 'Add key', choose a name for your key and paste the key."
echo "Test ssh to bitbucket"
echo " $ ssh -T git@bitbucket.org"
echo " If you get \"logged in as <yourusername>\", you are set to go."
echo
echo "Maven"
echo " $ sudo apt-get update && sudo apt install maven"
echo
echo "Docker engine"
echo "Add apt key for docker apt repository:"
echo " $ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -"
echo " you should get OK as output from the above. Otherwise, ask for help."
echo " Set up the \"stable\" repository for apt:"
echo " $ sudo add-apt-repository \\
   \"deb [arch=amd64] https://download.docker.com/linux/ubuntu \\
   \$(lsb_release -cs) \\
   stable\""
echo " $ sudo apt-get update && sudo apt-get install docker-ce docker-ce-cli containerd.io"
echo "Make sure you can run docker and docker-compose without sudo:"
echo " $ sudo groupadd docker"
echo " (the group might already exist, in which case you just continue)"
echo " $ sudo usermod -aG docker $USER"
echo " (this will take effect when you log out and in again)"
echo " If you don't want to log out and in again, run:"
echo " $ newgrp docker"
echo "If you want the Docker daemon to start at boot:"
echo " $  sudo systemctl enable docker"
echo
echo "SonarQube"
echo " $ docker pull sonarqube:latest"
echo " Make sure you have  ~/.m2/settings.xml so that maven knows where to find SonarQube"
echo " Ask for the settings required for that file or take the contents from this page (under the section SonarQube):"
echo " https://jiragu.atlassian.net/wiki/spaces/SCAP/pages/1287225370/Utvecklingsmilj"


