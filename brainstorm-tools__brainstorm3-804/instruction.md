# Issue

**Title:** improve progress bar performance

## Description

This PR implements some ideas from #803 to improve the performance of the progress bar.

After this update, the benchmark proposed in #803 : 

+ Main runs in 2s instead of 50s: 

<img width="1430" alt="image" src="https://github.com/user-attachments/assets/0f609319-b31f-4dbf-b437-f31dc1599d88" />

+ Main3 runs in 5s instead of 70s: 
<img width="1430" alt="image" src="https://github.com/user-attachments/assets/70706aa2-9466-4693-9e63-92c5244fe782" />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2a1996bc9083`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.