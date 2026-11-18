# Issue

**Title:** Fix a small naming glitch for CSP in the report

## Description

E.g. in `main` we would produce:

```
CSP decodingresponse/incorrect vs. response/correct
```

With this PR, we produce:

```
CSP decoding: response/incorrect vs. response/correct
```

### Before merging …

- [x] Changelog has been updated (`docs/source/dev.md.inc`)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `df2edea5962a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.