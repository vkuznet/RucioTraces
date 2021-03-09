all: build

build:
	cd messanger; make; cd -
	cd server; make; cd -

clean:
	cd messanger; make clean; cd -
	cd server; make clean; cd -
