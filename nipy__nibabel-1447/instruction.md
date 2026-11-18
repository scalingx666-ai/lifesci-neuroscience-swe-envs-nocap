# Issue

**Title:** chore(tox): Use lock runners for more tests

## Description

While releasing 5.3.3, various checks had stopped passing because the dependencies had been updated. This expands the use of lockfiles to more environments to reduce the scope for dependency rot in maintenance branches.

In the main branch, this sets dependabot to update the uv lockfile, which lets us address changes in dependencies in the PR that updates them, rather than when CI starts spontaneously failing. For maintenance branches, we don't need to update lockfiles, we just need the environment to keep working.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2c7fa7ced1a1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.