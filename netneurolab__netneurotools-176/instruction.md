# Issue

**Title:** [ENH] Update workflows and documentation

## Description

- Upgraded Python setup action to v6 across multiple workflow files.
- Added installation of OSMesa and VTK dependencies in the docs workflow.
- Modified documentation references for subcortex plotting.
- Cleaned up requirements.txt by ensuring proper package references.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ddfda848efa8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.