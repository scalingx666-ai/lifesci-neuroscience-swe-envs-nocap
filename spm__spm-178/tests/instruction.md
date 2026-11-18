# Issue

**Title:** Test: run the container test suite as the calling user

## Description

Companion to spm/spm-docker#11, which makes the MATLAB container run as an ordinary user so that figures work.

- The whole-suite step of the container test mounts the test data, and the tests write to it. With the container no longer root, it has to run as the user who owns that folder.
- The step now passes `--user "$(id -u):$(id -g)"` when the image defines a default user. A recipe without one, as on spm-docker main today, keeps running as root, so this can merge in either order.
- The per-test step already gets this from `matlab/run_tests.sh` in spm-docker.

## Test plan

- [x] Whole suite in one session with the new recipe and the calling user: finishes in 3 minutes with no hangs (run 37756350479, before the check for a default user was added)
- [ ] Weekly container test green once spm/spm-docker#11 and #176 are merged

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `370be871606b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.