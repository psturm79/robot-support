import psutil
import platform
import serial.tools.list_ports
import socket


def banner():
    print("====================================")
    print("     ROBOTIC SUPPORT DIAGNOSTIC     ")
    print("====================================\n")


def system_info():
    print("[SYSTEM INFO]")
    print("OS:", platform.system(), platform.release())
    print("CPU Usage:", psutil.cpu_percent(interval=1), "%")
    print("RAM Usage:", psutil.virtual_memory().percent, "%")
    print("Disk Usage:", psutil.disk_usage('/').percent, "%")
    print()


def network_info():
    print("[NETWORK INTERFACES]")
    addrs = psutil.net_if_addrs()
    for iface, details in addrs.items():
        for addr in details:
            if addr.family == socket.AF_INET:
                print(f"- {iface}: {addr.address}")
    print()


def serial_info():
    print("[SERIAL / USB PORTS]")
    ports = serial.tools.list_ports.comports()
    if not ports:
        print("No serial or USB devices detected.")
    else:
        for p in ports:
            print(f"- {p.device} ({p.description})")
    print()


def main():
    banner()
    system_info()
    network_info()
    serial_info()


if __name__ == "__main__":
    main()
