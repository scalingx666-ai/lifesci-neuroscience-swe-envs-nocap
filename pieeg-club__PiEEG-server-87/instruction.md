# Issue

**Title:** feat: add native acquisition support with command-line options for sample rate

## Description

Adds an optional “native” acquisition path backed by pieeg-core (when built with the hardware feature) to support higher sample rates, and wires new CLI flags for configuring native acquisition in the record subcommand.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f332ba18267f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.