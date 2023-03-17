//usr/bin/env go  run "$0" "$@"; exit $?
package main

import (
	"fmt"
	"os"
	"os/exec"
	"strings"
)

func main() {
	prg := "eww"
	arg1 := "windows"
	cmd := exec.Command(prg, arg1)

	stdout, err := cmd.Output()
	if err != nil {
		panic(err)
	}

	splitted := strings.Split(string(stdout), "\n")
	for _, s := range splitted {
		if strings.Contains(s, "*") {
			closeCmd := exec.Command(prg, "close-all")
			if err := closeCmd.Run(); err != nil {
				panic(err)
			}
			os.Exit(1)
		}
	}

	toOpen := []string{
		"open-many",
		"background",
		"poweroff",
		"profile",
		"folders",
		"sleep",
		"system",
		"logout",
		"clock",
		"uptime",
		"reboot",
		"lock",
	}
	openAllCmd := exec.Command(prg, toOpen...)
	if err := openAllCmd.Run(); err != nil {
		fmt.Println(err)
		panic(err)
	}
}
