VERSION=`git rev-parse --short HEAD`
flags=-ldflags="-s -w -X main.version=${VERSION}"

all: build

build:
	go clean; rm -rf pkg; go build ${flags}

build_debug:
	go clean; rm -rf pkg; go build ${flags} -gcflags="-m -m"

build_all: build_osx build_linux build

build_osx:
	go clean; rm -rf pkg messanger_osx; GOOS=darwin go build ${flags}
	mv messanger messanger_osx

build_linux:
	go clean; rm -rf pkg messanger_linux; GOOS=linux go build ${flags}
	mv messanger messanger_linux

build_power8:
	go clean; rm -rf pkg messanger_power8; GOARCH=ppc64le GOOS=linux go build ${flags}
	mv messanger messanger_power8

build_arm64:
	go clean; rm -rf pkg messanger_arm64; GOARCH=arm64 GOOS=linux go build ${flags}
	mv messanger messanger_arm64

build_windows:
	go clean; rm -rf pkg messanger.exe; GOARCH=amd64 GOOS=windows go build ${flags}

install:
	go install

clean:
	go clean; rm -rf pkg

test : test1

test1:
	cd test; go test
