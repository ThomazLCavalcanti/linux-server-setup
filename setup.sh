#!/bin/bash

LOG_DIR="logs"
SCRIPT_DIR="scripts"

mkdir -p "$LOG_DIR"

echo "Iniciando configuração completa do servidor..."

# Ordena os scripts por nome para garantir a execução na ordem correta
for script in $(ls "$SCRIPT_DIR"/*.sh | sort); do
    script_name=$(basename "$script")
    log_file="$LOG_DIR/${script_name%.sh}.log"

    echo "Executando: $script_name"
    
    # Garante permissão de execução
    chmod +x "$script"
    
    # Executa com sudo e salva log
    sudo bash "$script" &> "$log_file"

    if [ $? -eq 0 ]; then
        echo "✔️  $script_name concluído com sucesso."
    else
        echo "❌  Erro ao executar $script_name. Verifique $log_file"
        exit 1
    fi
done

echo "✅ Todos os serviços foram configurados com sucesso!"
