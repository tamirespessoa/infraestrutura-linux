#!/bin/bash

# Verifica se o script está sendo executado como root
if [ "$(id -u)" -ne 0 ]; then
  echo "Este script precisa ser executado como root"
  exit 1
fi

# Criação de grupos
echo "Criando grupos..."
groupadd grupo_dev
groupadd grupo_admin

# Criação de usuários e adição aos grupos
echo "Criando usuários..."
useradd -m -g grupo_dev -s /bin/bash usuario_dev
useradd -m -g grupo_admin -s /bin/bash usuario_admin

# Criação de diretórios para os usuários
echo "Criando diretórios..."
mkdir -p /home/usuario_dev/projeto
mkdir -p /home/usuario_admin/admin

# Definindo permissões
echo "Definindo permissões..."
chown usuario_dev:grupo_dev /home/usuario_dev/projeto
chown usuario_admin:grupo_admin /home/usuario_admin/admin

chmod 700 /home/usuario_dev/projeto
chmod 700 /home/usuario_admin/admin

echo "Infraestrutura criada com sucesso!"
