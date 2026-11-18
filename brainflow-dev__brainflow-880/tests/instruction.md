# Issue

**Title:** Fix AlmaLinux metadata failures in C++ deployment builds

## Description

The Linux Release job in [Deploy Cpp libs run 42703349344](https://github.com/brainflow-dev/brainflow/actions/runs/42703349344/job/129453590356) fails before compilation because an AlmaLinux mirror returns invalid `repomd.xml`. Re-running the job reproduced the same failure.

Retry dependency installation up to three times, switching from mirrorlist selection to AlmaLinux's supplied official HTTPS base URLs and clearing cached metadata after a failure. Keep package signature checks enabled and stop the job if installation still fails. Expand the Docker command into a fail-fast shell script while preserving the pinned image, CMake version, build options, and artifact locations.

Validation: YAML parsing, Bash syntax checks, `git diff --check`, and 10 shell execution scenarios covering Release/Debug, zero to three installation failures, and downstream build failure all passed. [Deploy Cpp libs run 42715881133](https://github.com/brainflow-dev/brainflow/actions/runs/42715881133) passed all 12 jobs, including Linux Release and Debug, and uploaded all 12 artifact sets. Both Linux jobs installed dependencies on their first attempt in this run; the retry/fallback and failure-exit paths were verified locally using injected failures.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fc06ca34d30f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.