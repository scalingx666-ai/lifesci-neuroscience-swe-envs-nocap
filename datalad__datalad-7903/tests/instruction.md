# Issue

**Title:** run/rerun: add --on-cmd-failure option

## Description

Using `--on-failure ignore` to save after a failed command conflates command exit-code handling with all other failure types (input retrieval, output prep, etc.) and provides no way to save *and* still propagate the original exit code.

## Changes

- **`datalad/core/local/run.py`**
  - Add `on_cmd_failure_opt` shared `Parameter` (choices: `error`, `save`, `all`)
  - Add `on_cmd_failure` to `Run._params_`, `Run.__call__`, and `run_command()`
  - New logic in `run_command()`: when `save`/`all` is requested, the `Save` call is hoisted *before* yielding the run result so it executes regardless of the caller's `on_failure` handling

- **`datalad/local/rerun.py`**
  - Import `on_cmd_failure_opt`; add to `Rerun._params_`, `Rerun.__call__`, and `_rerun()` signature
  - Pass through to `run_command()`

## Semantics

| `--on-cmd-failure` | save on failure | exit code |
|---|---|---|
| *(unset)* | no (unchanged default) | error (1) |
| `error` | no | original cmd exit code |
| `save` | yes | 0 |
| `all` | yes | original cmd exit code |

```python
# Save outputs even when the command fails, datalad exits 0
ds.run("./might-fail.sh", outputs=["result.csv"], on_cmd_failure="save")

# Save outputs AND propagate the original non-zero exit code
ds.run("./might-fail.sh", outputs=["result.csv"], on_cmd_failure="all")
```

Unlike `--on-failure ignore`, `--on-cmd-failure` only affects how the command's exit code is handled; other failure types still respect the global `--on-failure` setting.

<!-- START COPILOT CODING AGENT SUFFIX -->

-

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2bc08a64f984`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.