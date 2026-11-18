# Issue

**Title:** Set fixtures to `autouse`

## Description

Follow-up of

Pytest 9.1 changed how its config gets set, which depending on the setup can mean `config.addinivalue_line("usefixtures", fixture)` is essentially ignored.

The change didn't seem to have the same breaking effect here as it did it MNE-Connectivity, but just going to see what effects there might be.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `72363487bec1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.