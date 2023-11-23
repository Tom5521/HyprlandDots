package main

import (
	"fmt"
	"log"
	"os/exec"
	"strings"
)

func fmtCmd(cmd string) *exec.Cmd {
	ret := exec.Command("bash", "-c", cmd)
	return ret
}

func main() {
	cmd := fmtCmd("systemctl is-active bluetooth")
	out, _ := cmd.Output()
	fmt.Println(string(out))
	if strings.Contains(string(out), "inactive") {
		fmt.Println("Starting bluetooth")
		cmd := fmtCmd("systemctl start bluetooth")
		err := cmd.Run()
		if err != nil {
			return
		}
		cmd = fmtCmd("blueman-manager")
		cmd.Start()
	} else {
		fmt.Println("Stopping bluetooth")
		cmd := fmtCmd("systemctl stop bluetooth")
		err := cmd.Run()
		if err != nil {
			log.Println(err)
		}
	}
}
