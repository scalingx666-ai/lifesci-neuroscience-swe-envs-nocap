# Issue

**Title:** [memory] keep the sources as cell array for as long a possible (reduce memory)

## Description

Hello, 


The goal of this PR is to start implementing the idea described in 


Since we gained a lot in memory usage by not storing the matrix plainly (nVertex x nTime) but as factors, it can be useful to not regenerate the entire matrix upon loading, but to only expand part of the matrix necessary for the task at hand. 

For example, to display a specific time point, the last matrix can be reduced before doing the multiplication,  greatly reducing the time spent and memory usage. 

This PR is critical when dealing with long nirs data (lets say whole night nirs) while impacting very little short-duration recording. 


Edit:  Maybe a better name could be found for bst_multiply_cells, but I don't have any idea right now.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `10ce973c3674`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.