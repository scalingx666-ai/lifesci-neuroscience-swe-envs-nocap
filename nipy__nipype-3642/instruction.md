# Issue

**Title:** support for gpu queue

## Description

I wrote a simpler implementation of  old pull request to handle a queue of threads to be executed on GPU.
The user can specify the maximum number of parallel threads with the plugin option n_gpu_procs
The multiprocplugin will raise exception if a node require more threads than allowed in a similar way as classic CPU threads.
Note that in this implementation any GPU node will also allocate a CPU slot (is that necessary? We can change that behavior ).
Moreover the plugin doesn't check that the system actually has a cuda capable GPU (we can add such check if you think we need it)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0c67bb385bec`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.