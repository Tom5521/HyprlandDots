package main

import (
	"fmt"
	"os/exec"
)

func FmtCmd(c string) *exec.Cmd {
	cmd := exec.Command("bash", "-c", c)
	return cmd
}

func CheckIfIsOn() bool {
	if FmtCmd("pidof waybar").Run() != nil {
		return false
	}
	return true

}

func StartWaybar() {
	cmd := FmtCmd("waybar -c ~/.config/hypr/waybar/config.jsonc -s ~/.config/hypr/waybar/style.css")
	err := cmd.Start()
	if err != nil {
		fmt.Println(err)
	}
}
func KillWaybar() {
	pre_pid, err := FmtCmd("pidof waybar").Output()
	if err != nil {
		fmt.Println(err)
	}
	pid := string(pre_pid)
	if FmtCmd("kill "+pid).Run() != nil {
		fmt.Println("error killing waybar...")
	}
}

func main() {
	if CheckIfIsOn() {
		KillWaybar()
	} else {
		StartWaybar()
	}
}
