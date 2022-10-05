package main

import (
	"fmt"
	"io/ioutil"
	"os"
	"path/filepath"
)

const (
	INFO    string = "\033[1;34m"
	NOTICE         = "\033[1;36m"
	WARNING        = "\033[1;33m"
	RED            = "\033[1;31m"
	DEBUG          = "\033[0;36m"
	RESET          = "\033[0m"
)

func setColor(color string) {
	fmt.Printf("%s", color)
}

func main() {
	folders := []string{
		"alacritty",
		"bspwm",
		"deadd",
		"dwm",
		"fish",
		"fontconfig",
		"gtk-2.0",
		"gtk-3.0",
		"gtk-4.0",
		"i3",
		"Kvantum",
		"lvim",
		"mpv",
		"omf",
		"picom",
		"polybar",
		"rofi",
		"st",
		"sxhkd",
		"systemd",
		"tilda",
		"xfce4",
	}
	files := []string{
		"breezerc",
		"dolphinrc",
		"gtkrc",
		"gtkrc-2.0",
	}
	srcPath := "/home/edjubert/Workspace/dotfiles"
	destPath := "/home/edjubert/.config"

	for _, folder := range folders {
		srcFullPath := filepath.Join(srcPath, folder)
		destFullPath := filepath.Join(destPath, folder)

		if _, err := ioutil.ReadDir(srcFullPath); err != nil {
			continue
		}

		if _, err := ioutil.ReadDir(destFullPath); err == nil {
			if err := os.RemoveAll(destFullPath); err != nil {
				panic(err)
			}
			setColor(RED)
			fmt.Printf("Deleted ")
			setColor(NOTICE)
			fmt.Printf("%s ", folder)
			setColor(RESET)
			fmt.Printf("(%s)\n", destFullPath)
		}

		if err := os.Symlink(srcFullPath, destFullPath); err != nil {
			panic(err)
		}

		setColor(INFO)
		fmt.Printf("New symlink: ")
		setColor(RESET)
		fmt.Printf("%s -> %s\n\n", srcFullPath, destFullPath)
	}

	for _, file := range files {
		srcFullPath := filepath.Join(srcPath, file)
		destFullPath := filepath.Join(destPath, file)

		if _, err := ioutil.ReadFile(srcFullPath); err != nil {
			continue
		}

		if _, err := ioutil.ReadFile(destFullPath); err == nil {
			if err := os.Remove(destFullPath); err != nil {
				panic(err)
			}
			setColor(RED)
			fmt.Printf("Deleted ")
			setColor(NOTICE)
			fmt.Printf("%s ", file)
			setColor(RESET)
			fmt.Printf("(%s)\n", destFullPath)
		}

		if err := os.Symlink(srcFullPath, destFullPath); err != nil {
			panic(err)
		}

		setColor(INFO)
		fmt.Printf("New symlink: ")
		setColor(RESET)
		fmt.Printf("%s -> %s\n\n", srcFullPath, destFullPath)
	}
}
