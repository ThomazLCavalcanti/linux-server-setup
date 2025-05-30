#!/bin/bash

# Script 05 - Instalação e configuração básica do servidor FTP vsftpd no Ubuntu

echo "Atualizando pacotes..."
apt update -y && apt upgrade -y

echo "Instalando vsftpd..."
apt install vsftpd -y

echo "Fazendo backup do arquivo de configuração original..."
cp /etc/vsftpd.conf /etc/vsftpd.conf.bak_$(date +%F_%T)

echo "Configurando vsftpd para permitir login local e acesso anônimo desabilitado..."
sed -i 's/^#write_enable=YES/write_enable=YES/' /etc/vsftpd.conf
sed -i 's/^anonymous_enable=YES/anonymous_enable=NO/' /etc/vsftpd.conf
sed -i 's/^#chroot_local_user=YES/chroot_local_user=YES/' /etc/vsftpd.conf

echo "Reiniciando serviço vsftpd..."
systemctl restart vsftpd

echo "Habilitando vsftpd para iniciar junto com o sistema..."
systemctl enable vsftpd

echo "Servidor FTP configurado com sucesso."
echo "Usuários locais poderão acessar via FTP."
