#!/bin/bash

# ===============================
# START ROBOT SIMULATION ENVIRONMENT
# ===============================

# 1️⃣ Activar virtualenv
if [ ! -d "robotenv" ]; then
    echo "Creando virtualenv..."
    python3 -m venv robotenv
fi
source robotenv/bin/activate

# 2️⃣ Instalar dependencias
pip install --upgrade pip
pip install pyserial psutil requests numpy pyyaml paramiko fastapi uvicorn loguru python-dateutil pytz

# 3️⃣ Instalar socat si no está
if ! command -v socat &> /dev/null; then
    sudo apt update && sudo apt install -y socat
fi

# 4️⃣ Crear par de pseudo-terminal conectados
echo "Creando PTYs para robot simulado..."
PTYS=$(socat -d -d pty,raw,echo=0 pty,raw,echo=0 2>&1 | tee /tmp/socat.log | grep 'PTY is' | awk '{print $NF}')
PTYA=$(echo $PTYS | awk '{print $1}')
PTYB=$(echo $PTYS | awk '{print $2}')

echo "PTY para script: $PTYA"
echo "PTY para robot simulado: $PTYB"

# 5️⃣ Actualizar config.yaml
sed -i "s|serial_port:.*|serial_port: \"$PTYA\"|" config.yaml

# 6️⃣ Arrancar robot simulado en segundo plano
nohup bash -c "while true; do echo \"STATUS OK \$(date +%T)\" > $PTYB; sleep 1; done" >/dev/null 2>&1 &

echo "Robot simulado arrancado en $PTYB"

# 7️⃣ Arrancar API FastAPI
echo "Arrancando API..."
nohup uvicorn main:app --host 0.0.0.0 --port 8000 >/dev/null 2>&1 &

echo "✅ Todo listo!"
echo "Tu API está corriendo en http://127.0.0.1:8000"
echo "Los datos del robot se envían al script vía $PTYA"
