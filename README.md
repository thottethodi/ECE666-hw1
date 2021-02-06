# Demo MPI code: Monte Carlo Pi estimation example

## Launching MPI Execution
There are a few key differences that arise due to the shared memory programming model of `pthreads` and the message passing model of `MPI`. 

Under `pthreads,` the operating system (OS) works under the hood to take care of scheduling the threads on multiple cores on the same machine. In contrast, MPI orchestration requires the launching of multiple threads across _different_ machines, each running their own independent OS. Effectively, the MPI runtime performs the equivalent tasks by launching parallel processes on other machines; but this requires you to take some steps to ensure that the MPI runtime can launch jobs on other machines. 

This entails three tasks.
1. You use a special command `mpi-exec` to launch the binary (as opposed to directly running the binary at the command-line.)
2. The runtime must be given a list of machine names where the processes may be launched. This is straightforward; (1) you create a file with a list of machine names (one name per line), and (2) you pass the file name as a command-line argument when launching the MPI executable using `mpi-exec`. 
```
mpiexec -n <num-threads> -f <path-to-machinefile> <executable-binary>
```
3. You must set-up passwordless ssh connections so that the MPI runtime can launch tasks on other machines without needing authentication for each machine. This involves SSH key generation and running an SSH agent. Please consult external resources on how to set this up. Here's one such resource to get you started: https://www.open-mpi.org/faq/?category=rsh 
