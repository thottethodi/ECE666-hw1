# Assignment
This code repository is the companion code for your homework assignment.  It implements a basic sequential matrix multiplication algorithm along with utility functions to generate test data.

# Code structure
The program `mmwrapper.c` and `matmul.c` is a demonstration of the wrapper code that should be linked to your parallel matrix multiplication implementation. The file provides file I/O routines that allow saving/retrieving data to/from the filesystem. These routines will be used for grading.  

The example format is a binary format that holds an arbitrary number of double-precision numbers. The format will be used directly for the matrix-multiplication problem. 

1. `int read_from_file(char * filename, double *data, int num-elements)` populates a buffer (pointed to by `data`) of `num-elements` double precision numbers by reading the values from file `filename`. It is important that the data be pre-allocated using malloc. 
2. `int write_to_file(char * filename, double *data, int num-elements)` writes out the contents of a buffer (pointed to by `data`) that holds `num-elements` double precision numbers to file `filename` in binary format. 

Because it is flat format (a linear sequence of numbers), any richer structure must be imposed by convention. A matrix of `NxN` dimensions is stored as flat sequence of N^2 numbers in row-major order. 

### Error checking
Because double-precision arithmetic is not precise, there can be small errors arising from executing operations in a different order than the sequential implementation. The wrapper includes code to measure and report the error. If the error is small, your code does not need further debugging.

### Compiling the code
The makefile includes targets to compile the wrapper with a simple sequential implementation. Your implementation must entirely be in `matmul.c`. This includes all the pthreads code. 

### Data files
You are provided two sets of data files for testing in the directories `inputs` and `debuginputs` 
In each directory, the `a` and `b` files are the input matrices to be multiplied. the `golden` files contain the matrix product. The two sets correspond to 4x4 and 512x512 matrix sizes respectively. Use the 4x4 set for debugging.


### Running the program
After building with `make`, run the binaries without any command line parameters.
