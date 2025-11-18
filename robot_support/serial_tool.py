import serial
import yaml
from robot_support.logger import logger

class SerialTool:
    def __init__(self):
        with open("config.yaml") as f:
            cfg = yaml.safe_load(f)["robot"]
        self.port = cfg["serial_port"]
        self.baud = cfg["baudrate"]
        try:
            self.ser = serial.Serial(self.port, self.baud, timeout=1)
            logger.info(f"Serial opened {self.port} @ {self.baud}")
        except Exception as e:
            logger.error(f"Cannot open serial: {e}")
            self.ser = None

    def read(self):
        if not self.ser:
            return {"error": "serial not available"}
        try:
            line = self.ser.readline().decode(errors='ignore').strip()
            return {"data": line}
        except Exception as e:
            return {"error": str(e)}
