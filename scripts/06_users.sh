#!/bin/bash

# Script 06 - Criação de usuários locais para FTP e sistema

# Defina aqui os usuários que quer criar
USUARIOS=("usuario1" "usuario2" "usuario3")

# Senha padrão para todos (pode alterar depois)
SENHA_PADRAO="Senha@123"

for usuario in "${USUARIOS[@]}"
do
    echo "Criando usuário: $usuario"
    
    # Cria o usuário com diretório home e sem senha inicialmente
    useradd -m -s /bin/bash "$usuario"
    
    # Define a senha para o usuário
    echo "$usuario:$SENHA_PADRAO" | chpasswd
    
    # Força o usuário a trocar a senha no primeiro login
    passwd --expire "$usuario"
    
    echo "Usuário $usuario criado com senha padrão. Será pedido para trocar senha no primeiro acesso."
done

echo "Criação de usuários finalizada."
