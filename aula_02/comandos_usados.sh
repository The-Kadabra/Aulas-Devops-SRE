#!/bin/bash

##################################
#INSTAÇÃO E VALIDAÇÕES DO APACHE2#
##################################

sudo apt install apache2

systemctl status apache2

firefox localhost:80

sudo netstat -anlp | grep apache

#############################
#CONFIGURANDO SERVIDOR HTTPS#
#############################


#Criando um .cert e .key no OPENSSL
sudo openssl req -x509 -nodes -days 300 -newkey rsa:2048 -keyout /etc/ssl/private/apache_ssl.key -out /etc/ssl/certs/apache_ssl.crt 

#Aperte enter em todas as opções apenas na opção: "Common Name (e.g. server FQDN or YOUR name) []:" adicione o seu ip publico
#www.meuip.com

#########################
#ATIVANDO OS MODULOS SSL#
#########################

sudo a2enmod ssl 

sudo a2ensite default-ssl.conf

sudo apache2ctl configtest 

systemctt restart apache2

sudo netstat -anlp | grep apache

firefox localhost:443


######################
#CONFIGURANDO O NGROK#
######################

#www.ngrok.com

#Faça login na plataforma

wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz

chmod + x ngrok-v3-stable-linux-amd64.tgz

unzip /path/to/ngrok.zip

ngrok help

#Dentro da plataforma no menu "Setup & Installation" vá ao menu 2.

#copie no seu terminal o código por exemplo esse foi o meu:

ngrok config add-authtoken 2HxQAP8Xnw8kUwy9hUv5RT18mLl_3p4yQSwMDjf87PEwpRCT9

ngrok http 80

#Copie a URL do Forwarding, é a penultima linha por exemplo esse foi o meu:

https://8ef5-2804-14c-d080-8f22-22e2-fdf7-2891-f5e3.sa.ngrok.io

#Todos com esse link vão conseguir acessar o seu site do apache2