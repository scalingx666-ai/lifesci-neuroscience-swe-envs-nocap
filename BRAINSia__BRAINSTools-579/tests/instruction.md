# Issue

**Title:** COMP: Remove dead Azure Pipelines CI; GitHub Actions is the replacement

## Description

## Summary

Removes `azure-pipelines.yml` and `.azure_BRAINSTools_common.cmake`, which have been dead cruft since PR #544 (merged 2025-06-23) added GitHub Actions as the replacement. Also updates `Documentation/AI/style.md` to reference the current GHA workflow instead.

**Net diff:** 3 files changed, +2/−674.

## Why Azure CI is dead

Six independent blockers, any one fatal:

| # | Blocker | Detail |
|---|---------|--------|
| 1 | Wrong trigger branch | `trigger.branches.include = [master]` — default branch is `main`, so the pipeline never fires on modern pushes or PRs. |
| 2 | Retired agent image | `imageName: 'ubuntu-18.04'` — Microsoft retired Ubuntu 18.04 hosted agents on **2023-04-01**. Jobs would fail with "image not found" before any build step runs. |
| 3 | Retired Python | `UsePythonVersion@0: '3.7'` — Python 3.7 EOL 2023-06-27. |
| 4 | Stale ITK tag | `ITKGitTag: v5.1rc02` — a 2020 release candidate incompatible with current BRAINSTools source. |
| 5 | Missing driver file | The ctest driver `include`s `.azure_BRAINSTools_common.cmake` after cloning the `dashboard` branch, but that file exists only on `main`, not on `dashboard` — the include would fail path resolution. |
| 6 | Removed CMake flags | Several `USE_*` flags in `dashboard_cache` (`BRAINSTools_BUILD_DICOM_SUPPORT`, `USE_BRAINSDWICleanup`) have not existed since the 2020 refactors. |

## Why remove instead of fix

PR #544 already installed GitHub Actions as the authoritative CI: `.github/workflows/build.yml` provides Ubuntu builds with ccache, ExternalData caching, and CDash submission. Once PR #578 lands, it also gets EP-level ccache propagation. Reviving Azure would require fixing six independent blockers for a pipeline with zero active users and full GHA coverage — negative ROI.

## Test plan

- [ ] Confirm GitHub Actions still runs on this PR (GHA workflow unchanged).
- [ ] Confirm no other file in the tree references \`azure-pipelines.yml\` or \`.azure_BRAINSTools_common.cmake\` (verified via \`rg\` before commit; only hit was \`Documentation/AI/style.md\`, which is updated in this PR).
- [ ] Confirm the Azure DevOps project (if still connected to this repo) can be disconnected post-merge — not in scope of this PR, but a housekeeping follow-up.

## AI disclosure

Drafted with Claude Code (Opus 4.6). I audited the pipeline configuration against the current repo state, verified each blocker independently, and wrote the commit message and PR description. I reviewed every line of the diff and am accountable for the change. Per BRAINSTools policy this PR is opened as a **Draft** until CI passes.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7b93e7af194a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.