package configuration

import (
	"os"
)

type (
	Configuration struct {
		Name string
		User string
		Pass string
	}
)

func Database() Configuration {
	return Configuration{
		Name: os.Getenv("DATABASE_NAME"),
		User: os.Getenv("DATABASE_USER"),
		Pass: os.Getenv("DATABASE_PASS"),
	}
}
