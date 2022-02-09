.PHONY: all test clean

all: ./zig-out/bin/flipcase ./src/Flipcase.class

./zig-out/bin/flipcase: ./src/flipcase.zig
	zig build

./src/Flipcase.class: ./src/Flipcase.java
	javac ./src/Flipcase.java

test: all
	./test.sh

clean:
	rm -rf ./zig-cache
	rm -rf ./zig-out
	rm -f ./src/Flipcase.class
