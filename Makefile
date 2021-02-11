all: mpi-pi io iodebug

mpi-pi: mpi-pi.c Makefile
	mpicc -O2 mpi-pi.c -o mpi-pi

run:
	mpiexec -n 4 -f machinefile mpi-pi

clean: 
	rm mpi-pi iodebug io

iodebug: io.c
	gcc -D DEBUG io.c -o iodebug

io:     io.c
	gcc -o io io.c
