# Projeto: Setup Completo de Serviços em Ubuntu Server

Este projeto contém scripts para instalação e configuração automática de serviços em um servidor Ubuntu. Os scripts são organizados na pasta `scripts` e executados em sequência pelo script mestre `setup.sh`.

---

## Estrutura dos scripts

- `scripts/01_setup.sh` — Configuração inicial do sistema
- `scripts/02_mariadb.sh` — Instalação e configuração do MariaDB
- `scripts/03_ssh_hardening.sh` — Segurança e hardening do SSH
- `scripts/04_ufw_firewall.sh` — Configuração do firewall UFW
- `scripts/05_vsftpd.sh` — Instalação e configuração do servidor FTP (vsftpd)
- `scripts/06_users.sh` — Criação de usuários locais
- `scripts/07_monitoramento.sh` — Instalação e configuração do agente Zabbix

---

## Como usar

1. Clone ou baixe o projeto para seu servidor Ubuntu.

2. Certifique-se que os scripts estejam na pasta `scripts/`.

3. Dê permissão de execução para o script mestre:

   ```bash
   chmod +x setup.sh
   ```

4. Execute o script mestre para instalar e configurar tudo automaticamente:

   ```bash
   ./setup.sh
   ```

5. Os logs de execução serão criados na pasta `logs/`, um arquivo para cada script, para facilitar análise em caso de erro.

---

## Requisitos

- Sistema operacional: Ubuntu Server (versão recomendada: 20.04 LTS ou superior)
- Acesso root ou sudo para executar o script mestre e os scripts individuais

---

## Observações

- O script mestre executa os scripts em ordem para garantir a sequência correta.
- O SSH será configurado para usar a porta 2222, lembre-se de ajustar seu cliente SSH.
- Usuários criados terão senha padrão e serão obrigados a trocar no primeiro login.
- Ajuste o IP do servidor Zabbix no script `07_monitoramento.sh` para o endereço correto do seu servidor Zabbix.

---
