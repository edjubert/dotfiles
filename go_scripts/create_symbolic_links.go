package main

import (
	"fmt"
	"io/ioutil"
	"os"
	"path/filepath"
)

const (
	src  = "/home/edjubert/Workspace/dotfiles"
	dest = "/home/edjubert/.config"
)

const (
	INFO    string = "\033[1;34m"
	WHITE          = "\033[1;37m"
	NOTICE         = "\033[0;36m"
	WARNING        = "\033[1;33m"
	RED            = "\033[1;31m"
	DEBUG          = "\033[0;36m"
	RESET          = "\033[0m"
)

func setColor(color string) {
	fmt.Printf("%s", color)
}

func contains(s []string, str string) bool {
	for _, v := range s {
		if v == str {
			return true
		}
	}

	return false
}

func askUserPermission() (bool, error) {
	var reply string
	fmt.Scanln(&reply)

	acceptedValues := []string{"y", "yes", "n", "no", ""}
	if !contains(acceptedValues, reply) {
		setColor(NOTICE)
		fmt.Printf("Please enter 'y', 'yes', 'n' or 'no': ")
		setColor(RESET)
		return askUserPermission()
	}

	return reply == "y" || reply == "yes", nil
}

func selectSrcPath() (string, error) {
	var reply string
	fmt.Scanln(&reply)

	return src, nil
}

func selectDestPath() (string, error) {
	var reply string
	fmt.Scanln(&reply)

	return dest, nil
}

func createFileSymlink(srcPath string, destPath string, file os.DirEntry) error {
	srcFullPath := filepath.Join(srcPath, file.Name())
	destFullPath := filepath.Join(destPath, file.Name())

	if _, err := ioutil.ReadFile(destFullPath); err == nil {
		if err := os.Remove(destFullPath); err != nil {
			return err
		}
		setColor(RED)
		fmt.Printf("Deleted ")
		setColor(NOTICE)
		fmt.Printf("%s ", file.Name())
		setColor(RESET)
		fmt.Printf("(%s)\n", destFullPath)
	}

	if err := os.Symlink(srcFullPath, destFullPath); err != nil {
		return err
	}

	setColor(INFO)
	fmt.Printf("New symlink: ")
	setColor(RESET)
	fmt.Printf("%s -> %s\n\n", srcFullPath, destFullPath)

	return nil
}

func createDirSymlink(srcPath string, destPath string, folder os.DirEntry) error {
	srcFullPath := filepath.Join(srcPath, folder.Name())
	destFullPath := filepath.Join(destPath, folder.Name())

	if _, err := ioutil.ReadDir(destFullPath); err == nil {
		if err := os.RemoveAll(destFullPath); err != nil {
			return err
		}

		setColor(RED)
		fmt.Printf("Deleted ")
		setColor(NOTICE)
		fmt.Printf("%s ", folder.Name())
		setColor(RESET)
		fmt.Printf("(%s)\n", destFullPath)
	}

	if err := os.Symlink(srcFullPath, destFullPath); err != nil {
		return err
	}

	setColor(INFO)
	fmt.Printf("New symlink: ")
	setColor(RESET)
	fmt.Printf("%s -> %s\n\n", srcFullPath, destFullPath)

	return nil
}

func createSymlinkAuto(srcPath string, destPath string) error {
	excluded := []string{".git", ".gitignore", "go_scripts", "scripts"}
	files, err := os.ReadDir(srcPath)
	if err != nil {
		return err
	}

	for _, file := range files {
		if contains(excluded, file.Name()) {
			continue
		}

		if file.IsDir() {
			createDirSymlink(srcPath, destPath, file)
		} else {
			createFileSymlink(srcPath, destPath, file)
		}
	}

	return nil
}

func main() {
	setColor(WARNING)
	fmt.Printf("[WARNING]: ")
	setColor(WHITE)
	fmt.Printf("This script will replace all content of your destination folder (default %s) by the source directory (default %s)\n", dest, src)
	setColor(INFO)
	fmt.Printf("Continue ? ")
	setColor(WHITE)
	fmt.Printf("y/N: ")

	granted, err := askUserPermission()
	if err != nil {
		panic(err)
	}
	setColor(RESET)

	if !granted {
		setColor(INFO)
		fmt.Println("It is wise to surrender")
		setColor(RESET)
		os.Exit(1)
	}

	setColor(NOTICE)
	fmt.Printf("Choose a source folder (default: %s): ", src)
	srcPath, err := selectSrcPath()
	setColor(RESET)

	setColor(NOTICE)
	fmt.Printf("Choose a destination folder (default: %s): ", dest)
	destPath, err := selectDestPath()
	setColor(RESET)

	createSymlinkAuto(srcPath, destPath)
}
