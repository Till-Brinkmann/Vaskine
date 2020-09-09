haskellinterfacing : lib
	stack build

haskellinterfacing-install : lib
	stack install

lib : build/HaskellInterface.o
	ar rcs build/libHaskellInterface.a build/HaskellInterface.o

build/HaskellInterface.o : csrc/HaskellInterface.cpp
	gcc -c -o build/HaskellInterface.o csrc/HaskellInterface.cpp
