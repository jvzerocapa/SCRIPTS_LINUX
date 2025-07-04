#COMO EXECUTAR
#chmod +x instalar_zabbix_agent.sh
#sudo ./instalar_zabbix_agent.sh



#!/bin/bash

# Verifica se está sendo executado como root
if [ "$EUID" -ne 0 ]; then
  echo "Por favor, execute como root (sudo ./instalar_zabbix_agent.sh)"
  exit 1
fi

# Defina o IP do seu servidor Zabbix aqui
ZABBIX_SERVER_IP="SEU_IP_AQUI"

echo "Instalando o Zabbix Agent no Ubuntu..."

# Atualiza os repositórios
apt update -y

# Instala o Zabbix Agent
apt install -y zabbix-agent

# Altera o arquivo de configuração para apontar para o servidor Zabbix
sed -i "s/^Server=127.0.0.1/Server=$ZABBIX_SERVER_IP/" /etc/zabbix/zabbix_agentd.conf
sed -i "s/^ServerActive=127.0.0.1/ServerActive=$ZABBIX_SERVER_IP/" /etc/zabbix/zabbix_agentd.conf

# Usa o hostname do sistema atual
HOSTNAME=$(hostname)
sed -i "s/^Hostname=Zabbix server/Hostname=$HOSTNAME/" /etc/zabbix/zabbix_agentd.conf

# Habilita e inicia o serviço
systemctl enable zabbix-agent
systemctl restart zabbix-agent

echo "Zabbix Agent instalado e configurado com sucesso!"
echo "Apontando para o servidor Zabbix: $ZABBIX_SERVER_IP"
