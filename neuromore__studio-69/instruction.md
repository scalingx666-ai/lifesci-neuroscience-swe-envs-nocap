# Issue

**Title:** Birthday in User Model, User Selection/Create

## Description

* Adds a birthday field to the internal user model
* Parses it from the JSON backend response
* Uses it instead of the Email field in the User Selection Table
* Adds birthday input to create user window
* Adds birthday value to create user backend request

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1fcfeec421c3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.