#!/bin/bash

# Script de criação de estrutura de usuários, diretórios e permissões
# Autor: Seu Nome
# Data: 2025-06-07

echo "Iniciando criação de estrutura..."

# =========================
# Criando Grupos
# =========================
echo "Criando grupos..."
groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

# =========================
# Criando Diretórios
# =========================
echo "Criando diretórios..."
mkdir /publico
mkdir /adm
mkdir /ven
mkdir /sec

# =========================
# Definindo permissões dos diretórios
# =========================
echo "Definindo permissões dos diretórios..."
chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 770 /adm
chmod 770 /ven
chmod 770 /sec
chmod 777 /publico

# =========================
# Criando Usuários
# =========================
echo "Criando usuários..."

# Usuários do grupo ADM
useradd carlos -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM
useradd maria  -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM
useradd joao   -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM

# Usuários do grupo VEN
useradd debora -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN
useradd sebastiana -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN
useradd roberto -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN

# Usuários do grupo SEC
useradd josefina -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC
useradd amanda   -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC
useradd rogerio  -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC

# =========================
# Finalização
# =========================
echo "Estrutura criada com sucesso!"
