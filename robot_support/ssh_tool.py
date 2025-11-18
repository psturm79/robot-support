import paramiko
import yaml

class SSHTool:
    def __init__(self):
        with open("config.yaml") as f:
            cfg = yaml.safe_load(f)["ssh"]
        self.host = cfg["host"]
        self.username = cfg["username"]
        self.key = cfg["key_path"]
        self.client = None

    def connect(self):
        self.client = paramiko.SSHClient()
        self.client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
        self.client.connect(self.host, username=self.username, key_filename=self.key)

    def run_command(self, cmd):
        if not self.client:
            self.connect()
        stdin, stdout, stderr = self.client.exec_command(cmd)
        return {"output": stdout.read().decode(), "error": stderr.read().decode()}
