#!/bin/bash

# Script 01 - Instalação e ativação do servidor Nginx no Ubuntu

echo "Atualizando pacotes..."
apt update -y && apt upgrade -y

echo "Instalando Nginx..."
apt install nginx -y

echo "Ativando e iniciando o serviço do Nginx..."
systemctl enable nginx
systemctl start nginx

echo "Status do Nginx:"
systemctl status nginx | grep Active
