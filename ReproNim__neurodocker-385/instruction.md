# Issue

**Title:** generate to/from JSON

## Description

- Adds a `--json`flag to `neurodocker generate` subcommands that outputs a JSON representation of the instructions.
- Adds a `neurodocker genfromjson` subcommand that generates a Dockerfile or Singularity file from JSON representation.

Need to add tests before merge

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c2b1e242c9e9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.