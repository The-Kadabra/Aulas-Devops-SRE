#!/bin/bash

curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins



#acesso a config do serviço com o comando: sudo systemctl edit jenkins e adicione as linhas s/ o "#" para executar o jenkins na porta 8081
#[Service]
#Environment="JENKINS_PORT=8081"

#após isso restart o serviço com systemctl restart jenkins


#Coletando a secret para usar na parte WEB
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
