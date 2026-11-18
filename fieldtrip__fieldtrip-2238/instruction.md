# Issue

**Title:** Count channels for json based on channels_tsv instead of hdr

## Description

Adaptations:
- move the creation of channels.tsv before the creation of json files
- replace channel count in hdr by channel count in channels.tsv
Remark:
- should we move the creation of optodes_tsv also higher up so we can count optodes from this file?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1a532a966df7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.