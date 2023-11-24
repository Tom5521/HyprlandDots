package main

import (
	"os"
	"os/exec"
	"strings"

	"github.com/ncruces/zenity"
)

func main() {
	dir, err := zenity.SelectFile(zenity.Directory())
	if err != nil {
		os.Exit(0)
	}
	os.Chdir(dir)
	StrCommand := "kitty -T Neovim --class Neovim --hold sh -c nvim"
	command := strings.Fields(StrCommand)
	cmd := exec.Command(command[0], command[1:]...)
	cmd.Run()
}
