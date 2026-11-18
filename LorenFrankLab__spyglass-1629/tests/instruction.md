# Issue

**Title:** fix(install): prevent silent stall during conda environment creation

## Description

## Problem

Users reported `scripts/install.py` **stalling with no output during environment creation**. They could create the conda env manually with `conda env create` without issue.

## Root cause

`CondaManager.create()` ran `conda env create` while capturing its stdout/stderr into a pipe (printing only `.` for keyword-matching lines) and passing **no `-y` flag**. In conda 26.x, `conda env create` prompts `Proceed ([y]/n)?` by default:

1. The prompt was written into the **invisible** captured pipe (the keyword filter never matched it, and with no trailing newline the read loop never yielded it).
2. conda then **blocked reading the inherited terminal stdin**, waiting for a `y` the user couldn't see they needed to type.
3. The parent **blocked reading stdout**.

→ permanent stall, no report. Running conda manually worked because it inherits the TTY and shows the prompt. I reproduced the deadlock with a minimal harness (a fake child that prompts without a newline then reads stdin → confirmed hang).

## Fix

- **`create()`**: stream `conda env create` output directly to the terminal (so progress, prompts, and errors stay visible) and pass `-y` to run non-interactively. Mirrors the sibling `remove()`, which already used `-y`.
- **`install_package()` (follow-up)**: the editable `pip install -e` ran via `conda run`, which **buffers child output by default**, so a multi-minute install looked like a stall too. Stream it by dropping `capture_output` *and* passing `conda run --no-capture-output` (the flag is required — not capturing at the subprocess layer alone is not enough). Verified on conda 26.5.2 that the inner exit code still propagates, so `check=True` stays reliable. The error handler now points at the now-visible pip output instead of parsing captured stderr.

## Tests

`create()` and `install_package()` previously had **zero** coverage. Added `TestCondaManagerCreate` and `TestCondaManagerInstallPackage`:
- `create()` passes `-y`, does not capture output, raises a helpful `RuntimeError` on failure, and — for the destructive overwrite path — does **not** run `conda env remove`/create when the user declines, and removes-before-create under `--force`.
- `install_package()` streams (`--no-capture-output`, no capture), runs `pip install -e` in the env, appends extras, and raises a helpful `RuntimeError` on failure.

**157/157** install tests pass; black-clean (line-length 80); `--dry-run` verified.

## Review

Reviewed with the pr-review-toolkit agents (code / errors / comments / tests). The `conda run --no-capture-output` gap and the missing destructive-path coverage were review findings, now addressed; the loss of stderr-based error classification was evaluated and accepted (the real error now streams live).

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `395aa1a80afa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.