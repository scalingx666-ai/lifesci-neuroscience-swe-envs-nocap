# Issue

**Title:** don't use subj+session for fs_subj unnecessarily

## Description

In analyzing a dataset that is *not* longitudinal I hit a bug introduced in #987 where the pipeline tries to use a fs_subject of `subj_sess` in cases where it's not warranted.

WIP for now as I don't have time to add proper tests before heading on holiday, just wanted to make sure this change didn't get lost.

### Before merging …

- [ ] Changelog has been updated (`docs/source/dev.md.inc`)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fb748a3e8bc4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.