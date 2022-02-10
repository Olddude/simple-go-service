FROM golang as build
COPY go.mod ./
COPY go.sum ./
RUN go mod download
COPY *.go ./
RUN go build -o /simple-go-service

FROM golang:1.16-alpine as final
COPY --from=build /simple-go-service /simple-go-service
CMD [ "/simple-go-service"]