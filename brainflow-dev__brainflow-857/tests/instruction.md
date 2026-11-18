# Issue

**Title:** Harden Linux analysis workflows against APT mirror stalls

## Description

## Summary

- keep the Linux analysis workflows on the current stable `ubuntu-latest` image
- remove the unreliable first-priority Azure Ubuntu mirror before refreshing APT metadata
- tolerate runner images that do not provide `/etc/apt/apt-mirrors.txt`
- bound the CppCheck and Valgrind jobs and their package-install steps
- consolidate Valgrind's three APT setup passes into one
- update `actions/checkout` and `actions/setup-python` to v7
- run the Windows PSD Welch regression test with `cmd` so `%GITHUB_WORKSPACE%` expands correctly

## Motivation

The CppCheck and Valgrind checks for #847 both stalled in `apt-get update` against `azure.archive.ubuntu.com` and were cancelled at GitHub's six-hour hosted-job limit:

- https://github.com/brainflow-dev/brainflow/actions/runs/30890111327
- https://github.com/brainflow-dev/brainflow/actions/runs/30890111514

Both runs already used Ubuntu 24.04.4, image `20260810.271.1`. Identical workflows subsequently passed on the same image for other PRs, so changing or downgrading the runner image would not address the root cause.

GitHub's runner configuration provides `archive.ubuntu.com` and `security.ubuntu.com` as fallback mirrors. Removing only the flaky Azure entry keeps those official fallbacks available while preventing another six-hour stall. The file guard keeps the workflow compatible if a future hosted image changes its APT layout.

The first PR run also exposed a separate deterministic Windows failure: the PSD Welch test used `cmd`-style environment expansion under the default PowerShell shell. Explicitly selecting `cmd` makes it consistent with the adjacent Windows tests.

## Validation

- CppCheck completed successfully using `archive.ubuntu.com`
- Valgrind completed successfully, including all build and test steps
- parsed all three modified workflow files as YAML
- `git diff --check`
- verified the mirror rewrite removes Azure while preserving the official fallback entries
- verified the guarded rewrite succeeds both with and without the mirror-list file
- all 11 GitHub Actions workflows passed on commit `233fe60`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9097190cc70f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.