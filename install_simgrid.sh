#!/bin/bash

# Establecer la variable de entorno
export DEBIAN_FRONTEND=noninteractive

# Actualizar los paquetes del sistema
sudo apt update -y

# Instalar las dependencias necesarias
sudo apt install -y \
    g++ python3 cmake libboost-dev libboost-context-dev \
    libboost-stacktrace-dev libevent-dev nlohmann-json3-dev \
    graphviz graphviz-dev

# Asegúrate de que el directorio /source/simgrid.git existe
# Si no existe, clona el repositorio con el siguiente comando (descomenta la línea siguiente):
git clone https://framagit.org/simgrid/simgrid simgrid

# Cambiar al directorio /source/simgrid.git
cd simgrid

# Ejecutar cmake, make y make install
cmake -DCMAKE_INSTALL_PREFIX=/opt/simgrid .
make -j$(nproc)
sudo make install