#!/bin/bash

# Script 02 - Instalação básica do MariaDB no Ubuntu (configuração manual recomendada)

echo "Atualizando pacotes..."
apt update -y && apt upgrade -y

echo "Instalando MariaDB Server..."
apt install mariadb-server -y

echo "Ativando e iniciando o serviço do MariaDB..."
systemctl enable mariadb
systemctl start mariadb

echo "MariaDB instalado e iniciado."
echo "Recomenda-se rodar 'sudo mysql_secure_installation' manualmente para segurança adicional."

echo "Status do MariaDB:"
systemctl status mariadb | grep Active
