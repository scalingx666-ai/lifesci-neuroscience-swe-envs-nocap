# Issue

**Title:** [fix] add yaml config file to fix failed readthedocs build

## Description

readthedocs builds were failing (see explanation below). This adds a `.readthedocs.yaml` file to the project root that fixes this issue.

From the readthedocs website:

> We are announcing a new requirement for all builds to use our configuration file version 2. This announcement deprecates builds without a configuration file, as well as version 1 of our configuration file.
>
> Read the Docs will start requiring a `.readthedocs.yaml` configuration file for all projects in order to build documentation successfully. We will stop supporting builds without explicit configuration, because this creates implicit dependencies that users aren’t aware of. We plan to start failing builds not using configuration file version 2 on September 25, 2023.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `97f95f75ef10`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.