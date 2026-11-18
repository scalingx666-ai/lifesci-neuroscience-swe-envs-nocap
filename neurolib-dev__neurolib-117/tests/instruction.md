# Issue

**Title:** Simplify `jitcdde` backend

## Description

Remove unused options for `jitcdde` backend:
* OpenMP support - `jitcdde` can use OpenMP for compiling symbolic equations into C. However, this comes with tremendous overhead and while I was testing this, OpenMP does not offer almost any speedup
* save / load compiled - there is an option to save compiled C code of the equations and then just load it on next run. In theory, this would significantly speed up computations of large networks where the compilation to C takes a lot of time. However, our code works in a way that parameter values are "hardcoded" into symbolic computation, hence on each parameter change (imagine exploration), we would need to compile again. And therefore I cannot see any use case of this as of now.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1d4ef094dbe0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.