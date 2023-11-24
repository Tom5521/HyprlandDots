#!/bin/python

import subprocess
import psutil

def is_process_running(pid):
    try:
        process = psutil.Process(pid)
        return process.is_running()
    except psutil.NoSuchProcess:
        return False

def get_pid_by_name(process_name):
    try:
        pid = subprocess.check_output(['pgrep', process_name]).decode('utf-8').strip()
        return int(pid)
    except subprocess.CalledProcessError:
        print(f"No process found with the name: {process_name}")
        return None


def execute_process(command):
    try:
        process = subprocess.Popen(command, shell=True)
        process.wait()
        print(f"Process executed successfully with return code: {process.returncode}")
    except Exception as e:
        print(f"Error executing the process: {e}")

def kill_process(pid):
    try:
        subprocess.run(["kill", str(pid)])
        print(f"Process with PID {pid} terminated successfully.")
    except Exception as e:
        print(f"Error attempting to terminate the process: {e}")

if __name__ == "__main__":
    pid = get_pid_by_name("waybar")
    if pid == None:
        execute_process("waybar -c ~/.config/hypr/waybar/config.jsonc -s ~/.config/hypr/waybar/style.css")
    else:
        kill_process(pid)
    
    

