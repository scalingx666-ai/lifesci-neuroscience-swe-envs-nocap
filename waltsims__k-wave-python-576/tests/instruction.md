# Issue

**Title:** add run-examples workflow

## Description

This pull request introduces a new GitHub Actions workflow to automate the running of K-Wave examples on a scheduled basis and via manual trigger. The most important changes include setting up the workflow configuration, specifying the environment, and defining the steps for running the examples.

New GitHub Actions workflow:

* [`.github/workflows/run-examples.yml`](diffhunk://#diff-91446d7314e1a0bb6533057d51fbfe57abe3adbf31e3177b1fa63a5799a95442R1-R32): Added a new workflow named "Run K-Wave Examples" that is scheduled to run every Monday at 00:00 UTC and can also be triggered manually. The workflow sets up the environment on `ubuntu-latest`, installs dependencies using Python 3.10, and runs the examples with a 6-hour timeout.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `93cb6b34b98c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.