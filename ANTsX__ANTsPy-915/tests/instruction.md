# Issue

**Title:** CI: add Linux ARM64 wheel build support

## Description

Add Linux ARM64 (aarch64) wheel build support to CI workflows, enabling automatic delivery of `manylinux_aarch64` wheels.

This change addresses the growing adoption of the ARM64 architecture in server and cloud computing environments. By providing native wheels, we improve the deployment and user experience on these increasingly common platforms (e.g., AWS Graviton and other ARM-based servers).

The implementation utilizes GitHub's native ARM64 runners (`ubuntu-24.04-arm`).

**Changes**

*   **wheels.yml**: Added matrix entries for Python 3.10–3.13 on `ubuntu-24.04-arm` to build release wheels for the `manylinux_aarch64` platform.
*   **wheels_faster.yml**: Mirrored the change for Python 3.13 in the PR-triggered workflow to ensure ongoing compatibility.
*   Set `CIBW_ARCHS_LINUX: ${{ matrix.arch }}` in both workflows to instruct `cibuildwheel` to target the correct architecture on the native runner.

**Verification**

All CI jobs passed, and the produced wheels were successfully tested against the project's existing test suite. No compatibility issues were observed with underlying build dependencies during the CI run.

*   [CI run link](https://github.com/plasma-blue/ANTsPy/actions/runs/29682433126)

Each aarch64 job completed in approximately 27 minutes, a duration comparable to the existing x86_64 jobs.

**Impact**

*   **No increase in CI wall-clock time**: ARM64 builds run in parallel with other matrix entries, and the overall CI duration remains limited by the `macos` runner pool.
*   **No cost**: GitHub-hosted ARM runners are free for public repositories.
*   **No code changes**: This is a pure CI configuration update. The project's existing build scripts and source code required no modification.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0cf1e566019d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.