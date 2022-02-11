run:
	go run .

clean:
	git clean .

build:
	docker build -t simple-go-service .

install:
	helm install simple-go-service .

uninstall:
	helm uninstall simple-go-service
