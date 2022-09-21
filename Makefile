build: main.go
	CGO_ENABLED=0 GOARCH=amd64 GOOS=linux go build -o . ./...

run:
	./go-hello

all: build run
