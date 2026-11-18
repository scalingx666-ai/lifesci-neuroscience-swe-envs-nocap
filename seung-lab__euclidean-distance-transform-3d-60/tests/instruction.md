# Issue

**Title:** fix: license configuration in setup.cfg

## Description

According to https://setuptools.pypa.io/en/latest/references/keywords.html#keyword-license, the keyword is `license`, not `licenses`. Also, `license_file` is deprecated in favor of `license_files`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `672a57cd0abf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.