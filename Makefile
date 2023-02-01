all: mm mm-debug 

clean: 
	rm mm mm-debug 

mm:
	gcc mmwrapper.c matmul.c -o mm

mm-debug:
	gcc -D DEBUG mmwrapper.c matmul.c -o mm-debug

