#!/bin/bash

# Script 07 - Instalação e configuração do Zabbix Agent no Ubuntu

ZABBIX_SERVER_IP="192.168.0.100"  # Altere para o IP do seu servidor Zabbix

echo "Atualizando pacotes..."
apt update -y && apt upgrade -y

echo "Instalando Zabbix Agent..."
apt install zabbix-agent -y

echo "Configurando Zabbix Agent para apontar para o servidor $ZABBIX_SERVER_IP..."
sed -i "s/^Server=127.0.0.1/Server=$ZABBIX_SERVER_IP/" /etc/zabbix/zabbix_agentd.conf
sed -i "s/^ServerActive=127.0.0.1/ServerActive=$ZABBIX_SERVER_IP/" /etc/zabbix/zabbix_agentd.conf
sed -i "s/^Hostname=Zabbix server/Hostname=$(hostname)/" /etc/zabbix/zabbix_agentd.conf

echo "Ativando e iniciando o serviço do Zabbix Agent..."
systemctl enable zabbix-agent
systemctl start zabbix-agent

echo "Status do Zabbix Agent:"
systemctl status zabbix-agent | grep Active

echo "Zabbix Agent instalado e configurado."
