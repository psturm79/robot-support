```markdown
# 🤖 Robot Support System  
### Automated Robot Simulation, Monitoring & API Control  
**By Pablo Sturm**

This repository contains a fully automated robot simulation environment, with:

- A **robot simulator** (Python)
- A **FastAPI backend**
- Automated logs
- A dedicated Linux service environment
- Startup scripts
- SSH/virtualenv integration
- Structured project layout

This project is designed as the foundation for a real robotic control system with remote API access and monitoring dashboards.

---

## 🚀 Features

### ✅ Robot Simulation  
Simulates real-time robot movement and operations.  
PIDs, telemetry and live loop execution.

### ✅ FastAPI REST API  
Exposes robot controller via `/status`, `/move`, `/telemetry`.

### ✅ Logging System  
Structured logging with rotation, stored separately.

### ✅ Virtual Environment  
Custom Python 3.12 venv (`robotenv/`).

### ✅ Startup Scripts  
- `start_robot_env.sh`  
- `start_robot_env_logs.sh`  

Easy reboot and startup automation.

---

## 🧱 Project Structure

```

robot-support/
│
├── robot.py                 # Robot simulator code
├── api.py                   # FastAPI backend
├── robot_support.service    # Example systemd unit
│
├── robotenv/                # Python virtual environment
│
├── logs/
│   ├── robot_sim.log
│   └── api_server.log
│
├── start_robot_env.sh       # Start robot + API
├── start_robot_env_logs.sh  # Start and tail logs
│
└── README.md

````

---

## ▶️ How to Run Locally

### 1. Activate venv
```bash
source robotenv/bin/activate
````

### 2. Start robot + API

```bash
./start_robot_env.sh
```

### 3. View logs

```bash
./start_robot_env_logs.sh
```

---

## 🌐 API Endpoints

### **GET** `/status`

Return robot status + telemetry.

### **POST** `/move`

Send new movement coordinates or parameters.

### **GET** `/logs`

Stream live logs.

---

## 🔧 Roadmap (Next Steps)

* Add websocket monitoring dashboard
* Add authentication (JWT)
* Add Grafana/Prometheus exporter
* Add Docker container
* Use Redis pub/sub for real-time telemetry
* Add CI/CD (GitHub Actions)

---

## 📜 License

MIT License.

---

## 🧔 Author

**Pablo Sturm**
Automation, DevOps & Robotics Enthusiast

GitHub: [https://github.com/psturm79](https://github.com/psturm79)

````

---

# ✔️ AHORA QUÉ HACER

1. En tu instance:

```bash
nano ~/robot-support/README.md
````

2. Pega TODO lo que te puse arriba.
3. Guarda (`CTRL+O`, ENTER, `CTRL+X`).
4. Luego:

```bash
git add README.md
git commit -m "Add professional README"
git push origin main
```

---
