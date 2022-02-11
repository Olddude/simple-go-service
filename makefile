run:
	go get .
	rm -rf ./bin/simple-go-service ./bin/simple-go-service.db
	touch ./bin/simple-go-service.db
	go build -o ./bin/simple-go-service
	./bin/simple-go-service

deploy:
	helm uninstall simple-go-service
	docker image rm simple-go-service --force
	docker image prune --force
	docker container prune --force
	git clean -Xfd
	docker build -t simple-go-service .
	helm install simple-go-service .

proxy:
	echo serving on: http://localhost:8080
	kubectl port-forward service/simple-go-service 8080:http
