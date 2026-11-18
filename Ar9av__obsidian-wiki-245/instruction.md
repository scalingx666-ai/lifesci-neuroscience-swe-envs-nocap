# Issue

**Title:** fix(hooks): make WIKI_RECAP_DEBUG explain the recap hook's silent exits

## Description

#232 documented WIKI_RECAP_DEBUG in docs/cli.md, docs/memory.md and
docs/configuration.md, but the hook change never landed, so main's
test_documented_env_vars_are_the_ones_the_code_reads has been red.
Route every silent exit through quiet_exit, which says why on stderr
when WIKI_RECAP_DEBUG=1. Output unchanged otherwise.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `df3dc2d53e11`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.