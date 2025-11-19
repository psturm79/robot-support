---

````markdown
# 🤖 Robot Support System

[![Python Version](https://img.shields.io/badge/python-3.12-blue)](https://www.python.org/)
[![License](https://img.shields.io/badge/license-MIT-green)](LICENSE)
[![GitHub Repo Size](https://img.shields.io/github/repo-size/psturm79/robot-support)](https://github.com/psturm79/robot-support)
[![Last Commit](https://img.shields.io/github/last-commit/psturm79/robot-support)](https://github.com/psturm79/robot-support/commits/main)

Automated Robot Simulation, Monitoring & API Control  
**Author:** Pablo Sturm

This project demonstrates a modular robot simulation environment with:

- Python-based Robot Simulator  
- FastAPI backend for robot control & telemetry  
- Structured logging & async handling  
- Startup scripts & virtualenv integration  
- Ready for DevOps monitoring and CI/CD pipelines  

---

## 📂 Project Structure

```txt
robot-support/
├── main.py                  # Main robot orchestrator
├── robot.py                 # Robot simulator code
├── api.py                   # FastAPI backend
├── robot_support/           # Core support package
│   ├── __init__.py
│   ├── robot_diag.py
│   └── ...
├── robotenv/                # Python virtual environment (ignored)
├── logs/
│   ├── robot_sim.log
│   └── api_server.log
├── start_robot_env.sh       # Start robot + API
├── start_robot_env_logs.sh  # Start and tail logs
├── config.yaml              # Robot configuration
├── requirements.txt         # Dependencies
└── README.md
````

---

## 🚀 Quick Start

### 1️⃣ Activate venv

```bash
source robotenv/bin/activate
```

### 2️⃣ Start Robot Simulator

```bash
python robot.py
```

### 3️⃣ Start API

```bash
uvicorn api:app --host 0.0.0.0 --port 8000
```

### 4️⃣ Check Status

```bash
curl http://localhost:8000/status
```

---

## 🌐 API Endpoints

| Method | Endpoint  | Description              |
| ------ | --------- | ------------------------ |
| GET    | `/status` | Robot telemetry & status |
| POST   | `/move`   | Send movement commands   |
| GET    | `/logs`   | Stream logs in JSON      |

---

## 🛠 Tech Stack

* Python 3.12
* FastAPI + Uvicorn
* AsyncIO, structured logging
* Linux/Ubuntu compatible
* Ready for CI/CD pipelines

---

## 🧪 Roadmap

* Web dashboard (Grafana/Prometheus or custom FastAPI)
* Real-time telemetry & alerts
* Docker containerization
* Authentication & security enhancements
* CI/CD workflow integration (GitHub Actions)

---

## 🤝 Contributions

PRs welcome! Use feature branches and keep code clean.

---

## 🧔 Author

**Pablo Sturm**
Azure • DevOps • SRE • Automation Engineer
[GitHub](https://github.com/psturm79)

---

## ⭐ Support

Give it a **star** if you like the project!

````
