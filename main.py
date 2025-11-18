from fastapi import FastAPI
from robot_support.serial_tool import SerialTool
from robot_support.ssh_tool import SSHTool
from robot_support.diagnostics import Diagnostics
from robot_support.logger import logger

app = FastAPI(title="Robot Support API")

serial = SerialTool()
# ssh = SSHTool()   # descomenta si configuras SSH real
diag = Diagnostics()

@app.get("/")
def home():
    logger.info("API online")
    return {"status": "online", "message": "Robot Support System Running"}

@app.get("/serial/read")
def serial_read():
    return serial.read()

@app.get("/health")
def system_health():
    return diag.system_health()
