.PHONY: all fmt vet lint build

all: build 

fmt:
	go fmt ./...

lint: fmt
	golint ./...

vet: lint
	go vet ./...

build: vet
	mkdir -p bin
	go build -o bin/hello main.go
	GOOS=windows go build -o bin/hello.exe main.go

