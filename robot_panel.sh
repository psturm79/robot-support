#!/bin/bash
# robot_panel.sh - Panel de control del robot simulado + API

# Activar virtualenv
source ~/robot-support/robotenv/bin/activate

# PTY donde se está enviando el STATUS del robot
ROBOT_PTY="/dev/pts/6"

# PID del robot simulado
ROBOT_PID=$(pgrep -f "bash -c while true; do echo 'STATUS OK'")

# PID de la API FastAPI
API_PID=$(pgrep -f "uvicorn main:app")

clear
echo "================ ROBOT PANEL ================="
echo "Robot simulado PID: $ROBOT_PID"
echo "API FastAPI PID:    $API_PID"
echo "Robot STATUS: (últimas 10 líneas)"
echo "----------------------------------------------"

# Mostrar STATUS del robot en tiempo real junto con logs de la API
tail -n 10 -f "$ROBOT_PTY" robot_support.log api.log
