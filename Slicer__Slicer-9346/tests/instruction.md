# Issue

**Title:** ENH: Note the extra Rosetta first-launch cost during macOS prewarm

## Description

## Problem

On Apple Silicon, an x86_64 (Intel) Slicer package runs under Rosetta. The first launch pays **two** separate one-time costs:

1. the macOS security scan that `SlicerPrewarm.py` already warms and covers with a progress splash, and
2. Rosetta translating each Intel library the first time its code actually runs.

The prewarm deliberately never executes code (it only `mmap`s each Mach-O `PROT_EXEC` to trigger the security scan), so it does **not** cover the Rosetta translation. In practice the app can spend ~30s in Rosetta *after* the progress bar has completed, with no explanation, which reads as a hang.

## Change

Detect the translated case via `sysctl.proc_translated` (`running_under_rosetta()`) and set expectations accordingly:

- the prewarm splash's second explanation line becomes *"Under Rosetta the first launch is slower; later launches are fast."*
- a matching console line is printed for headless/log runs.

Native arm64 builds are unaffected (the flag is 0, text is unchanged). This is a deliberately small stopgap for the window before native arm64 packages ship; a follow-up could actually parallelize/pre-translate under the same splash if the Rosetta window persists.

## Testing

- `running_under_rosetta()` returns `False` in a native arm64 process and `True` under an x86_64 process (verified via the bundled x86 `PythonSlicer`: `proc_translated=1`).
- Syntax/`ruff` clean.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dd9f99824082`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.