#!/bin/bash

# Script 03 - Hardening básico do SSH no Ubuntu

SSH_CONFIG="/etc/ssh/sshd_config"
BACKUP="/etc/ssh/sshd_config.bak_$(date +%F_%T)"

echo "Fazendo backup do arquivo sshd_config em $BACKUP"
cp $SSH_CONFIG $BACKUP

echo "Alterando porta padrão do SSH para 2222..."
sed -i 's/^#Port 22/Port 2222/' $SSH_CONFIG

echo "Desabilitando login root via SSH..."
sed -i 's/^#PermitRootLogin prohibit-password/PermitRootLogin no/' $SSH_CONFIG

echo "Habilitando autenticação por chave pública e desabilitando autenticação por senha..."
sed -i 's/^#PasswordAuthentication yes/PasswordAuthentication no/' $SSH_CONFIG
sed -i 's/^#PubkeyAuthentication yes/PubkeyAuthentication yes/' $SSH_CONFIG

echo "Reiniciando serviço SSH..."
systemctl restart ssh

echo "SSH hardening concluído. Lembre-se de configurar suas chaves públicas e usar a porta 2222 para se conectar."
