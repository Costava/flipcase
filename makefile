.PHONY: build test

build:
	zig build

test: build
	./test.sh
