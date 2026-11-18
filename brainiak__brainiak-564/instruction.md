# Issue

**Title:** Fix CI failures: numpy 2.3 compat, Windows file handle leak, Linux MPI EFA abort

## Description

Three independent CI failures exposed after `fail-fast: false` was added to the matrix. macOS and Windows now pass; this PR fixes the remaining failures across all platforms.

## `fastsrm.py`: numpy 2.3 removed `_read_array_header`

`np.lib.format._read_array_header` was a private API removed in numpy 2.3. Replaced with the versioned public API and added a `with` context manager (the bare `open()` was also causing `PermissionError: [WinError 32]` on Windows when the file stayed open during temp-dir cleanup):

```python
# Before
f = open(path, "rb")
version = np.lib.format.read_magic(f)
shape, fortran_order, dtype = np.lib.format._read_array_header(f, version)
f.close()

# After
with open(path, "rb") as f:
    version = np.lib.format.read_magic(f)
    if version == (1, 0):
        shape, fortran_order, dtype = np.lib.format.read_array_header_1_0(f)
    elif version == (2, 0):
        shape, fortran_order, dtype = np.lib.format.read_array_header_2_0(f)
    ...
```

## CI: MPI platform split — MPICH on Linux

OpenMPI on Ubuntu GitHub Actions runners hangs when `mpiexec` spawns subprocesses. Split the `mpi4py/setup-mpi` step into OS-specific variants: `mpich` on Linux, default (OpenMPI) on macOS, `msmpi` on Windows (unchanged).

## `tests/conftest.py`: `pool_size` fixture logic bug causing EFA abort + mpiexec hang

The `pool_size` fixture was supposed to return `1` inside MPI subprocesses to prevent `fork()`-after-`MPI_Init`. The guard was:

```python
if (multiprocessing.get_start_method() != "fork" and   # always False on Linux
        MPI.COMM_WORLD.Get_attr(MPI.APPNUM) is not None):
    return 1
```

On Linux, `get_start_method()` returns `"fork"` by default, so the `APPNUM` check was never reached. With MPICH, `pool_size=2` was returned, `multiprocessing.Pool(2)` forked inside MPI ranks, which triggered the **libfabric EFA provider** on AWS runners to emit `"Your job will now abort."` + SIGABRT. `mpiexec` then hung indefinitely → every affected test hit the 120 s timeout.

Fix: drop the start-method guard so `APPNUM is not None` alone gates the MPI-subprocess path:

```python
# Whenever inside an mpiexec subprocess, avoid fork() regardless of start method
if MPI.COMM_WORLD.Get_attr(MPI.APPNUM) is not None:
    return 1
```

Also removes the now-unused `import multiprocessing`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `be703acbf862`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.