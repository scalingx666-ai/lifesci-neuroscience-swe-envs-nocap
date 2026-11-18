# Issue

**Title:** ci: for macosx wheels, try to use system clang.

## Description

This allows minimization of MACOSX_DEPLOYMENT_TARGET Otherwise linkage to libunwind requires a deployment target of 14

This explores the https://grok.com/share/bGVnYWN5LWNvcHk_9c6351ad-5ff0-4728-81d4-b47767c8848a (search for ZZZ)
'Best' Practical way to avoid bundling libunwind on the macosx intel runner.

Additionally we ensure the brew versions of flex and bison are used.

This supercedes #3728

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cfd6f24f7602`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.