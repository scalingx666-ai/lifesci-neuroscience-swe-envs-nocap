# Issue

**Title:** Returns CircleCI config to before version matrics to fix codecov

## Description

.

Me and @eurunuela tried to do a lot of things to get codecov working againa fter #1190 changed `.circleci/config.yml` to use version matrices. After nothing worked we decided to go back to the config from before #1190 that did work. We can then separately try to figure out how to switch back to version matrics without (again) breaking codecov interactions.

Changes proposed in this pull request:

- Replaced `.circleci/config.yml` with the version that existed before #1190

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `08a822312381`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.