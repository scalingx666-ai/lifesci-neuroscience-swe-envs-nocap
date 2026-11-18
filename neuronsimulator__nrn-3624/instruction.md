# Issue

**Title:** Add CI for validating YAML

## Description

Yes, I know, yet another CI, for yet another markup language. This is mostly to avoid YAML syntax errors, it doesn't actually do anything else.

To run locally:

```plantext
./ci/validate_yaml.sh
```

Should work from any dir inside the repo, and on any POSIX platform.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a91d2468bbb8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.