# Issue

**Title:** ENH: Sync pre-commit config with ITK; add Python commit-msg validator

## Description

## Summary

Aligns BRAINSTools `.pre-commit-config.yaml` with ITK's pre-commit best
practices and adds a portable Python commit-message validator modeled on
ITK's `kw-commit-msg.py`.

### Changes

- **`fail_fast: true`** — stops the hook chain on the first failure.
  If a commit message is malformed there is no point running clang-format
  or black; failing fast saves 5–30 s per rejected commit.

- **`default_stages: [pre-commit]`** — hooks without an explicit `stages:`
  list now run only at `git commit` time, not during `git push` or
  `git merge`, preventing unexpected slowdowns in those workflows.

- **`Utilities/Hooks/kw-commit-msg.py`** — a new, cross-platform Python
  validator that enforces the BRAINSTools/ITK commit-message convention:

  | Check | Detail |
  |-------|--------|
  | Valid prefix | `BUG: COMP: DOC: ENH: PERF: STYLE: WIP:` (+ `Merge`/`Revert`) |
  | Subject length | ≤ 78 characters |
  | Space after colon | `ENH: foo` not `ENH:foo` |
  | Blank second line | body must be separated from subject by a blank line |

  Comment lines and `diff --git` sections (from `git commit -v`) are
  stripped before validation.

- **Local hooks in `.pre-commit-config.yaml`**:
  - `brainstools-prepare-commit-msg` — injects the prefix legend into the
    commit-message editor template (runs at `prepare-commit-msg` stage).
  - `brainstools-commit-msg` — runs `kw-commit-msg.py` to validate the
    final message (runs at `commit-msg` stage).

  Developers who run:
  ```bash
  pre-commit install --hook-type commit-msg --hook-type prepare-commit-msg
  ```
  now get the same enforcement as the manually installed `.git/hooks/` scripts.

### Why Python instead of bash?

The existing `Utilities/Hooks/commit-msg` bash script works but is not
easily discoverable via `pre-commit`.  A Python entry point is cross-platform
(works on Windows without WSL), can be unit-tested, and matches ITK's approach.
The bash script is retained and still works for developers who install hooks
manually via `SetupForDevelopment`.

### Testing

- `pre-commit run --all-files` passes on this branch.
- `kw-commit-msg.py` manually tested with valid and invalid messages.
- No existing hook behavior is changed for developers using the legacy
  `.git/hooks/` install path.

## AI Assistance Disclosure

This PR was generated with Claude Sonnet 4.6 assistance:
- Reviewed ITK's `.pre-commit-config.yaml` and `Utilities/Hooks/` scripts
- Adapted the ITK `kw-commit-msg.py` pattern for BRAINSTools prefixes
- Wrote `.pre-commit-config.yaml` structural changes (`fail_fast`, `default_stages`, local hooks)
- All code was reviewed and verified locally before this PR was opened.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9c60ee1cae29`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.