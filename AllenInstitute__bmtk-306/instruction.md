# Issue

**Title:** Exposing OpenMP multithreading capability of NEST to users

## Description

The default number of thread is 1.
This can be used together with MPI.
The number could be given as an argument to PointSimulator.from_config() or PointSimulator.__init__().
If 'n_thread' is set in 'run' section of the run config file, it overrides the setting by the argument. (For better reproducibility with config files.)

With my network with ~60k neurons on a 8-core Xeon workstation, using mpirun -np 4 with n_thread=2 was tiny bit faster than mpirun -np 8 with n_thread=1. Other configs (np 2 & n_thread=4, np 1 & n_thread=8) were similar or slower. Extensive tests will be needed to see the performance gain.

Kael, I wasn't sure if there is any docstrings that I should change for this. If you could let me know where to change, I can take care of them.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5f213cdc077b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.