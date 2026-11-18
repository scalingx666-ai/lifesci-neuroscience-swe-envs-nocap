# Issue

**Title:** Mac wheels: pin static readline 7.0 (restore nrniv/nrngui tty input)

## Description

## Summary

Mac `neuron` / `neuron-nightly` wheels built after #3809 ignore keyboard input in `nrniv` / `nrngui` when `DISPLAY` is set. `-nogui` and no-`DISPLAY` still work.

#3809 upgraded the **macOS** static readline from **7.0 → 8.3**. Linux wheels were never upgraded (`packaging/python/Dockerfile` is still 7.0). GNU readline 8.3 breaks tty input when InterViews multiplexes stdin with X11.

This restores the 7.0 pin for GH Actions Mac wheels and updates `ci/deps/MANIFEST.yml` so 7.0 is the documented consumer.

## Local verification

Same source (`master` @ d71477fd8), system X11 (not delocate), isolated prefixes:

| Wheel | readline | `nrniv`/`nrngui` + `DISPLAY` | `-nogui` |
|---|---|---|---|
| local 8.3 | 8.3 | keyboard ignored | works |
| this PR | 7.0 | `print 1+2` → `3` | works |

Matches PyPI: `neuron==9.0.1` (7.0) works; `neuron-nightly` / 9.0.2 Mac wheels (8.3) do not. The 9.0.2 pkg installer is unaffected (different readline recipe).

## Test plan

- [x] Local arm64 wheel vs readline 8.3 reproduces dead stdin
- [x] Local arm64 wheel vs readline 7.0 restores stdin
- [ ] CI Mac wheel job
- [ ] After merge: install nightly/PR wheel and type at `oc>` in `nrngui`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d71477fd84a1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.