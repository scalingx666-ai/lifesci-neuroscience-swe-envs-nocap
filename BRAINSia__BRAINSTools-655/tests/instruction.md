# Issue

**Title:** COMP: Build main weekly and key ccache by runner image and compiler

## Description

Build `main` on a weekly schedule (and on demand) so the ccache stays inside GitHub's 7-day eviction window, and key the ccache by runner image and compiler major version so an image upgrade starts a fresh cache instead of restoring one that misses on every lookup.

<details>
<summary>Why</summary>

CI ran only on pushes to `main` and on pull requests. After a quiet week every ccache entry was evicted and the next PR rebuilt ITK, VTK, and ANTs from scratch (PR #643 lost its runner 10 minutes into a cold VTK build). Runner images also change without a commit: `ubuntu-latest` moved to 26.04 (GCC 13 to 15) on 2026-10-19, and the first build to notice was an unrelated PR. The ccache key carried neither the image nor the compiler version, so a 24.04/GCC 13 cache restored onto 26.04/GCC 15, missed everywhere (ccache hashes the compiler), and still occupied quota.

Changes to `build.yml`:
- `schedule: '0 8 * * 1'` (Mondays, after the 06:00 UTC cache sweep) and `workflow_dispatch`.
- A "Record runner image and compiler" step that logs `ImageOS`/`ImageVersion` and the compiler version, and exports the image and compiler major for the key.
- ccache key `ccache-v2-<OS>-<image>-<compiler><major>-<sha>` for restore, restore-keys, and save.

`PruneSupersededCiCaches.py` groups by the key prefix before the SHA, so it works unchanged; its docstring is updated. The nightly sweep only purges `refs/pull/*` caches, so the weekly `main` cache survives it.

Not done here: pinning `ubuntu-24.04`/`macos-15` in the matrix, and a drift warning comparing the fingerprint with the previous run.

</details>

<details>
<summary>Testing and AI disclosure</summary>

Workflow YAML validated by the pre-commit `Validate GitHub Workflows` hook. The schedule and key change can only be exercised on GitHub: after merge, `gh workflow run build.yml --ref main` and check `gh cache list` for a `ccache-v2-...` entry scoped to `refs/heads/main`.

Claude Code (claude-fable-5-1) made the edits from the diagnosis recorded with PR #644; the author reviewed every line.

</details>

<!--
provenance: claude-code session 2026-10-28
hint: .devlocal/hints/ci-weekly-main-build-cache-and-os-drift.md
post_merge_action: run the workflow by hand once and confirm the main-scoped ccache-v2 entry; then remove the weekly-CI Future item from .devlocal/todo.md
-->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bbda558f29c7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.