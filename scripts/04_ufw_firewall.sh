#!/bin/bash

# Script 04 - Configuração básica do firewall UFW no Ubuntu

echo "Ativando UFW (firewall)..."
ufw enable

echo "Permitindo SSH na porta 2222 (porta alterada no hardening SSH)..."
ufw allow 2222/tcp

echo "Permitindo HTTP (porta 80)..."
ufw allow 80/tcp

echo "Permitindo HTTPS (porta 443)..."
ufw allow 443/tcp

echo "Negando outras conexões por padrão (UFW já tem regra padrão deny incoming)..."
ufw default deny incoming
ufw default allow outgoing

echo "Status atual do UFW:"
ufw status verbose
