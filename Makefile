all: mpi-pi

mpi-pi: mpi-pi.c Makefile
	mpicc -O2 mpi-pi.c -o mpi-pi

run:
	mpiexec -n 4 -f machinefile mpi-pi

clean: 
	rm mpi-pi
