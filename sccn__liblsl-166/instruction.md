# Issue

**Title:** Add build for upcoming Ubuntu LTS 22.04

## Description

Ubuntu 22.04 will be released next month. It is unclear when github actions will add an ubuntu-22.04 runner.

This is just a suggestion how you could already now build and test your future 1.16 release for Ubuntu 22.04.

BTW you have random failures in one of your unit tests: 
```
install/bin/lsl_test_exported --order rand --wait-for-keypress never --durations yes
5892 Segmentation fault      (core dumped) install/bin/lsl_test_exported --order rand --wait-for-keypress never --durations yes
```
I had this once affect the 18.04 build while the 20.04 build succeeded and once the other way round. I mention this here because this may also fail randomly in the builds triggered by this pull request.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e6c8b6c6e085`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.