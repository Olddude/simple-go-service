run:
	go run .

install:
	docker build -t simple-go-service .
	helm install simple-go-service .

uninstall:
	helm uninstall simple-go-service
	docker image rm simple-go-service --force
	docker image prune --force
	docker container prune --force
	git clean -Xfd
