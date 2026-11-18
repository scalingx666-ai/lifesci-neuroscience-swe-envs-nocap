# Issue

**Title:** TVB-2027 & TVB-2380 - Problems to launch TVB web server and DB connection in case of non-ascii characters in path

## Description

- [x] [TVB-2380](https://req.thevirtualbrain.org/browse/TVB-2380) SQLite refuses DB path with Greek letters
- [ ] [TVB-2027](https://req.thevirtualbrain.org/browse/TVB-2027) Fail to start tvb-web with accents in path

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8205e4cca609`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.