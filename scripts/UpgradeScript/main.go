package main

import (
	"fmt"
	"os"
	"strings"

	"github.com/Tom5521/CmdRunTools/command"
)

var (
	flatkpakUpgradesTxt string = `
--------------------------------------------------------------------
----------------------FLATPAK UPGRADES------------------------------
--------------------------------------------------------------------
`
	sysUpgradesTxt string = `
--------------------------------------------------------------------
----------------------SYSTEM UPGRADES-------------------------------
--------------------------------------------------------------------
`
	printversion string = `
----------------------Upgrade Tool V2.1-----------------------------`
)

var sh = command.Cmd{}
var args string = strings.Join(os.Args, " ")

var (
	noconfirm string
	assumeyes string
)

func UpdateFlatpak() {
	if strings.Contains(args, "system") {
		return
	}
	sh.CustomStd(true, true, true)
	sh.SetInput("flatpak upgrade " + assumeyes)
	err := sh.Run()
	if err != nil {
		fmt.Println(err.Error())
		UpdateFlatpak()
	}
}

func UpdateSystem() {
	if strings.Contains(args, "flatpak") {
		return
	}

	var mode string = "yay"

	if strings.Contains(args, "no-yay") {
		mode = "sudo pacman -Syu"
	}

	sh.CustomStd(true, true, true)
	cmd := fmt.Sprintf("%v %v", mode, noconfirm)
	err := sh.SetAndRun(cmd)
	if err != nil {
		fmt.Println(err.Error())
		UpdateSystem()
	}
}

func main() {
	if strings.Contains(args, "noconfirm") {
		noconfirm = "--noconfirm"
		assumeyes = "--assumeyes"
	}
	fmt.Print(printversion)
	fmt.Print(sysUpgradesTxt)
	UpdateSystem()
	fmt.Print(flatkpakUpgradesTxt)
	UpdateFlatpak()

}
