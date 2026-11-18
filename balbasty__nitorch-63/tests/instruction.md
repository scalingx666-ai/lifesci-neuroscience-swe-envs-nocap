# Issue

**Title:** Fix atlas align

## Description

Regarding the two fixes, this is the error relating to giving int16 to the cutoff function:

![image](https://user-images.githubusercontent.com/6413806/146353713-c7e9865f-c8fa-4937-a105-d57a7fc2c662.png)

and this is the error relating to having a CPU device when adding noise:

![image](https://user-images.githubusercontent.com/6413806/146353819-c5a86143-5d17-40c5-a330-f41622fe2f65.png)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `55239f5870e7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.