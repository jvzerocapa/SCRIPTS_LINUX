#!/bin/bash

# Atualiza os pacotes
echo "Atualizando pacotes do sistema..."
sudo apt update -y && sudo apt upgrade -y

# Instala o Apache
echo "Instalando o Apache..."
sudo apt install apache2 -y

# Inicia o serviço Apache
echo "Iniciando o serviço Apache..."
sudo systemctl start apache2

# Habilita o Apache para iniciar com o sistema
echo "Habilitando Apache no boot..."
sudo systemctl enable apache2

# Exibe o status
echo "Verificando status do Apache..."
sudo systemctl status apache2 | grep Active

# Mensagem de sucesso
echo "✅ Servidor web Apache instalado e em execução!"
echo "Acesse pelo navegador: http://<IP-DA-MAQUINA>"
