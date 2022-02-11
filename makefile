run:
	go run .

build:
	docker build -t simple-go-service .

install:
	helm install simple-go-service .

clean:
	helm uninstall simple-go-service
	docker image rm simple-go-service --force
	docker image prune --force
	docker container prune --force
	git clean --force
