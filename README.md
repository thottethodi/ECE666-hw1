# Demo MPI code: Monte Carlo &pi; estimation example

This code is similar in functionality to the `pthreads` code used in the previous assignment; it performs 128M Monte Carlo trials to estimate the value of **&pi;**. The parallel implementation uses message passing as the programming model. As with the shared-memory example code, this code is provided with the accompanying Makefile. After you setup your environment to use MPI (described below), use `make` to compile the code and `make run` to launch a run with 4 processes. 

## MPI installation
You are welcome to download and install your own MPI implementation -- it's fairly straightforward and can be done with user permissions alone. However, one installation is made available to you at `/home/yara/mithuna2/mpich-install`. The installed version is the MPICH implementation (version 3.4.1) and it includes the MPI compiler (`mpicc`) and a utility to launch MPI programs (`mpi-exec`). To access these scripts, your environment variables must point to the relevant directories as follows.

* `$PATH` must include `/opt/gcc/6.1.0/bin:/home/yara/mithuna2/mpich-install/bin`.
* `$LD_LIBRARY_PATH` must include `/opt/gcc/6.1.0/lib64:/package/intel_alt/12.0.0/x86_64-Linux/composerxe-2011.0.084/compiler/lib/intel64:/home/yara/mithuna2/mpich-install/lib`.

## Launching MPI Execution
There are a few key differences in the MPI version (as compared to the shared memory programming model of `pthreads`). 

Under `pthreads,` the operating system (OS) works under the hood to take care of scheduling the threads on multiple cores on the same machine. In contrast, MPI orchestration requires the launching of multiple threads across _different_ machines, each running its own independent OS. Effectively, the MPI runtime performs the equivalent tasks by launching parallel processes on other machines; but this requires you to take some steps to ensure that the MPI runtime _can_ launch jobs on other machines. 

This entails three tasks.
1. You use a special command `mpiexec` to launch the binary (as opposed to directly running the binary at the command-line.)
2. The runtime must be given a list of machine names where the processes may be launched. This is straightforward; (1) you create a file with a list of machine names (one name per line), and (2) you pass the file name as a command-line argument when launching the MPI executable using `mpiexec`. 
```
mpiexec -n <num-threads> -f <path-to-machinefile> <executable-binary>
```
3. You must set-up passwordless ssh connections so that the MPI runtime can launch tasks on other machines without needing authentication for each machine. This involves SSH key generation and running an SSH agent. Please consult external resources on how to set this up. Here's one such resource to get you started: https://www.open-mpi.org/faq/?category=rsh 
