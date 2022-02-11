FROM golang as build
WORKDIR /app
RUN env
RUN ls -al
COPY go.mod ./
COPY go.sum ./
RUN go mod download
COPY *.go ./
RUN go build -o ./bin/simple-go-service

FROM golang:1.16-alpine as final
WORKDIR /
COPY --from=build /app/bin/simple-go-service ./
ENTRYPOINT [ "/simple-go-service"]
