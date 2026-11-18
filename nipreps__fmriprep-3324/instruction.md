# Issue

**Title:** DOC: Read html_baseurl from RTD environment, if available

## Description

Following the advice of https://about.readthedocs.com/blog/2024/07/addons-by-default/.

Starting on the LTS, since there's still a chance a new release would come out.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7e1535c7f451`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.