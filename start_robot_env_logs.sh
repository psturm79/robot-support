#!/bin/bash

# ===============================
# START ROBOT SIMULATION ENVIRONMENT WITH LOGS
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

# 6️⃣ Crear archivos de log
ROBOT_LOG="robot_sim.log"
API_LOG="api.log"
: > $ROBOT_LOG
: > $API_LOG

# 7️⃣ Arrancar robot simulado en segundo plano con logs
nohup bash -c "while true; do echo \"STATUS OK \$(date +%T)\" > $PTYB; echo \"STATUS OK \$(date +%T)\" >> $ROBOT_LOG; sleep 1; done" >/dev/null 2>&1 &

# 8️⃣ Arrancar API FastAPI con logs
nohup uvicorn main:app --host 0.0.0.0 --port 8000 >> $API_LOG 2>&1 &

# 9️⃣ Mostrar logs en tiempo real en una sola terminal
echo "✅ Robot simulado y API arrancados. Mostrando logs en tiempo real:"
echo "Presiona Ctrl+C para detener la visualización (los procesos siguen corriendo en segundo plano)."

# Mostrar ambos logs en tiempo real
tail -f $ROBOT_LOG $API_LOG
