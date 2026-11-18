# Issue

**Title:** Add Conda packaging

## Description

Create Conda packages and test in Travis. A few outstanding issues

- [ ] Update documentation (README, website, docs)
- [ ] Understand why Linux build is hanging on ```test_brsa.py``` for Travis, but not anywhere else [link](https://travis-ci.org/danielsuo/brainiak/jobs/336390600)
- [ ] Confirm whether users need ```apt install build-essential``` or ```xcode-select install```
- [ ] Upload to anaconda.org

Unrelated issues: code coverage ( and #326).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0af9c5eecb5b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.