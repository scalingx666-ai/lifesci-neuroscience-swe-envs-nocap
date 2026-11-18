# Issue

**Title:** ENH: Annotate mris_expand with thread usage

## Description

This one's a little weird, due to the multiple inheritance and also the inefficiency of multithreading in `mris_expand`. 

I noticed `midthickness` taking a long time while running tests, and I was pretty sure I'd seen that it could be parallelized. 

From watching `htop` and running `mris_expand` with a set of `OMP_NUM_THREADS` values, I see that generally you get about 65-75% core utilization, generally a bit under. We therefore overallocate threads by about 50% to make the core usage match the desired number of threads, occasionally peaking over but mostly sitting a bit under. This works pretty well for 2-12 desired threads (3-18 `OMP_NUM_THREADS`), but seems almost completely limited after that, with 24 threads utilizing maybe 13 cores at best. Therefore, I set this to max out at 12 for scheduling purposes.

The memory usage of this tool is low and does not seem to increase noticeably with number of threads.

If `n_procs == 1`, `str(1 * 3 // 2) == '1'`, so this does not interfere with people attempting to run things single-threaded.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b5e86631b875`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.