# Issue

**Title:** fix logger when running in a for loop

## Description

Hi,

Right now if I run the function run_kilosort  in a for loop the logger will create a log file only in the first for loop. The logging.basicConfig() function only configures the logger once and subsequent calls to basicConfig() have no effect unless you explicitly force it to reconfigure. This is fixed by simply adding the arg force=True.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a2d745f1b384`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.