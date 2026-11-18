# Issue

**Title:** Added new module neurokernel.mpi_run

## Description

Added new module neurokernel.mpi_run. Includes mpi_run, which consumes a function, writes it to a temporary file, and executes it with mpiexec. Also includes mpi_run_manager, which consumes a neurokernel.{core,core_gpu}.Manager and the number of steps to run it, serializes the manager, sends it to a temporary file, writes a function that loads and runs the manager, and feeds the function to mpi_run. The module is primarily for use in notebooks, which cannot run neurokernel.mpi_relaunch.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9dab2275011f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.