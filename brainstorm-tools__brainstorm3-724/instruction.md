# Issue

**Title:** change default color order  for nirs

## Description

By convention, we prefer to have HbO in red, HbR in blue, and HbT in green. This changes the order so the colors are good without modifying the figure. 

Before; 
![image](https://github.com/user-attachments/assets/83966344-3541-46dc-a902-bdd3aa4d4148)


After:

![image](https://github.com/user-attachments/assets/c4fe44fd-95e9-415c-a18c-205682a6a88d)


one small limitation with this fix is that displaying multiple HbO signals will make them all red.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `583876d9696d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.