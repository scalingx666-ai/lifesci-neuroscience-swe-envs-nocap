# Issue

**Title:** DEP: bump minimum Git version 2.25.0 -> 2.31.0

## Description

PR #7858's `-c key=value` config-override propagation uses Git's `GIT_CONFIG_COUNT`/`GIT_CONFIG_KEY_<n>`/`GIT_CONFIG_VALUE_<n>` env mechanism, introduced in Git 2.31.0.  On Git < 2.31 the CLI override was silently a no-op.  Make the requirement explicit at startup rather than manifesting as feature loss.

tools/ci/install-minimum-git.sh already extracts the value from GIT_MIN_VERSION, so the `cron-only` minimum-git leg (which has been failing `test_cfg_override` + `test_cli_configoverrides` every day since 2026-05-14) automatically retargets to 2.31.0 without further CI changes.

Distro impact is narrow: among currently-supported LTSes, only Debian bullseye (oldoldstable, git 1:2.30.2-1+deb11u5) sits below the new floor, and its LTS support window closes soon (2026-08).  Every other supported distro (bookworm 2.39, Ubuntu 22.04 2.34, Ubuntu 24.04 2.43, RHEL 9 2.39) is well above 2.31.

git-annex's own Git floor is unchanged and independent (`git >= 2.22` in both our declared minimum annex 10.20230126 and the latest 10.20260624), so this bump is strictly stricter than what our annex requires.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `93f980fdaceb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.