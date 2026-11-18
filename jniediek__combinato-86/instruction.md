# Issue

**Title:** Logic to set Random seed and log it.

## Description

Keeps one constant (randomly generated) seed throughout the clustering session. The seed is also logged.

# Modified files:
- cluster.py 
       (modified to receive a random seed. By default it generates one random seed from handle_random_seed.py)

- cluster_features.py 
       (modified to accept the random seed passed down from cluster.py)

# Added file:
- handle_random_seed.py (holds logic for logging as well)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `190251cc09ee`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.