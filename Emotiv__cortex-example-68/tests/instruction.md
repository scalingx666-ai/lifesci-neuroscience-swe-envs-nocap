# Issue

**Title:** update csharp example to distinguish data subscribe with license and not

## Description

The PR include:

- user need put license when subscribe eeg and pm to distinguish when subscribe motion, power, training ... which do not need license instead of put the license info in Config.cs as before

- add help command for training and record data example

- support connect with EPOCFLEX with mappings

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `026435b3f3e0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.