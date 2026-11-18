# Issue

**Title:** Minor updates for fabrication

## Description

- 1.8k,47.7k and LED on the Python480 board now have the right part number.

- Capacitors with same value but different part numbers on the serializer board have been changed to the part numbers used in the rest of the board.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `71084115c59a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.