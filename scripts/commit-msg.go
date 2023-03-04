///usr/bin/go run $0 $@; exit $?

package main

import (
	"fmt"
	"io/ioutil"
	"regexp"

	"os"
)

func isValid(input []byte) bool {
	valid, err := regexp.Match(`(:.*?:)\s(.*)\s(.*)`, input)
	if err != nil {
		panic(err)
	}

	return valid
}

func isIgnored(input []byte) bool {
	ignored, err := regexp.Match(`^WIP\:|^Merge(:?|\sbranch)|^Revert|^chore\(ci\)\:`, input)
	if err != nil {
		panic(err)
	}

	return ignored
}

func getMatches(input []byte) map[string]string {
	exp := regexp.MustCompile(`^(?P<emoji>[a-z]*)(?:\((?P<scope>[a-zA-Z\-\_\.\/\d]*?)\))?:\s(?P<commit>.*)`)
	match := exp.FindStringSubmatch(string(input))
	results := map[string]string{}
	for i, name := range match {
		results[exp.SubexpNames()[i]] = name
	}

	return results
}

var reference = map[string]string{
	"feat":    ":sparkles:",
	"fix":     ":bug:",
	"docs":    ":memo:",
	"perf":    ":rocket:",
	"test":    ":white_check_mark:",
	"chore":   ":arrows_clockwise:",
	"hotfix":  ":ambulance:",
	"improve": ":zap:",
}

func main() {
	filePath := os.Args[1]
	file, err := ioutil.ReadFile(filePath)
	if err != nil {
		panic(err)
	}

	if isIgnored(file) {
		fmt.Println("Commit message ignored")
		os.Exit(1)
	}

	if isValid(file) {
		fmt.Println("Commit message valid")
		os.Exit(1)
	}

	matches := getMatches(file)
	emoji := matches["emoji"]
	scope := matches["scope"]
	commit := matches["commit"]

	if reference[emoji] == "" {
		fmt.Printf("'%s' is not a valid type\n", matches["emoji"])
		fmt.Printf("Valid types are:\n")
		for key := range reference {
			fmt.Println("- ", key)
		}
		os.Exit(1)
	}

	formatted := ""
	if scope != "" {
		formatted = fmt.Sprintf("%s(%s): %s", reference[emoji], scope, commit)
	} else {
		formatted = fmt.Sprintf("%s: %s", reference[emoji], commit)
	}

	if err := ioutil.WriteFile(filePath, []byte(formatted), 0644); err != nil {
		panic(err)
	}
}
