package main

import (
	"fmt"

	"github.com/spf13/viper"
)

func main() {
	viper.SetConfigFile("config.yaml")
	viper.ReadInConfig()

	fmt.Println("port is: ", viper.Get("PORT"))
	fmt.Println("url is: ", viper.Get("URL"))
}
