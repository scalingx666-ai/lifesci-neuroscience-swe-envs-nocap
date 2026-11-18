# Issue

**Title:** Configure Dependabot for grouped Python updates

## Description

## Summary

`master` has no `.github/dependabot.yml`. The open Dependabot pull requests are security updates, currently paused, and they edit `ci/requirements.txt` one package at a time. CI installs that hashed lock. The `<=` ceilings from #3338 stay. They are what keep a new PyPI release from turning `master` red.

This adds the config and the procedure in `docs/dev/python/dependencies.md`:

- Version updates are one monthly grouped pull request against the direct requirement files and `pyproject.toml`, with `versioning-strategy: increase-if-necessary` and `open-pull-requests-limit: 1`.
- `/ci` has `open-pull-requests-limit: 0`, so the lock does not get version-update pull requests. A security-update group is declared for `/ci`, and another for the direct manifests, so that after security updates are unpaused those land as groups.
- The note says how to review the monthly diff, regenerate `ci/requirements.txt` with the `uv pip compile` command in its header, and which Dependabot pull requests to close (`oldest_numpy_requirements.txt`, or a lock-only edit).

Merging starts an immediate version-update check. The acceptance test is the Dependabot job log on the dependency graph: the direct manifests only, no pull request that edits the lock alone, and at most one version-update pull request.

Related to #3874. This pull request does not close that issue. The issue stays open until the job log has been read and the existing security-update pull requests have been closed.

## Test plan

- [x] CI YAML validation passes
- [x] Reviewer confirms the directories, limits, and groups match `docs/dev/python/dependencies.md`
- [x] After merge, read the Dependabot job log the same day

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `701f1cb88bf8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.