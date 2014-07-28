package main

import (
	"fmt"
	"code.google.com/p/gcfg"
	"io/ioutil"
	"net/http"
	"net/url"
	"os"
	"path"
)

const Endpoint = "http://doneyo.herokuapp.com"
const ConfigFileName = ".yorc"


func data(user string) url.Values {
	return url.Values{"user": {user}}
}

func initialConfig(user string) string {
	return fmt.Sprintf("[user]\nname = %s", user)
}

func yo(user string) {
	response, error := http.PostForm(Endpoint, data(user))

	if error != nil { os.Exit(1) }

	message, _ := ioutil.ReadAll(response.Body)
	if response.StatusCode == 200 {
		fmt.Println(string(message))
	} else {
		fmt.Fprintln(os.Stderr, string(message))
		os.Exit(1)
	}
}

type Config struct {
	User struct {
		Name string
	}
}

func ConfigFile() string {
	return path.Join(os.Getenv("HOME"), ConfigFileName)
}

func username() string {
	if _, error := os.Stat(ConfigFile()); error != nil {
		askUser()
	}

	var config Config
	error := gcfg.ReadFileInto(&config, ConfigFile())
	if error != nil { panic(error) }

	return config.User.Name
}

func askUser() {
	var user string

	fmt.Printf("Your Yo username? : ")
	fmt.Scanf("%s", &user)
	createConfigFile(user)
}

func createConfigFile(user string) {
	error := ioutil.WriteFile(ConfigFile(), []byte(initialConfig(user)), 0644)
	if error != nil { panic(error) }
}


func main() {
	yo(username())
}
