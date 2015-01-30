.PHONY: vendor clean

THRIFT_PATH := github.com/antonlindstrom/union-thrift/vendor/thrift

build: binpath vendor deps compile

format:
	go fmt ./...

compile:
	go build -o bin/write main.go

binpath:
	mkdir -p bin/

deps:
	go get -d .


clean:
	rm -rf bin vendor/thrift

vendor: 
	mkdir -p vendor/thrift/
	thrift --out vendor/thrift --gen go:package_prefix=${THRIFT_PATH}/ example.thrift
	patch vendor/thrift/example/ttypes.go < vendor/ttypes.go.patch
