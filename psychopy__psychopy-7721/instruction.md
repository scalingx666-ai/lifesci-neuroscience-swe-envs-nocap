# Issue

**Title:** BF: fix undefined names in triggerbox parallel port module (backport of #7635)

## Description

Backport of #7635, which merged to `dev` on 2026-05-29. The bugs are still live on `release`, so released users have never had the fix.

Cherry-pick of 10c5cb2b7 — applies cleanly, and `psychopy/hardware/triggerbox/parallel.py` is now byte-identical to the version on `dev`.

### What was broken

`psychopy/hardware/triggerbox/parallel.py` used `sys` and `logging` without importing them, and `setPortAddress()` referenced an undefined local `address`.

On `release` today, `ParallelPortTrigger` cannot be constructed at all:

```
__init__()  ->  open()  ->  _setupPort()  ->  sys.platform    # NameError
```

and `setPortAddress()` raises for **every** input, not only the hex-string case the original PR described — `isinstance(address, str)` is evaluated before any branch is taken:

```python
>>> t.setPortAddress("0x0378")
UnboundLocalError: local variable 'address' referenced before assignment
>>> t.setPortAddress(0x0278)
UnboundLocalError: local variable 'address' referenced before assignment
```

(`UnboundLocalError` rather than `NameError` because `address` is assigned further down, which makes it a local. It is a `NameError` subclass, so the static-analysis report was accurate.)

The fix adds `import sys` and `from psychopy import logging` — matching the convention in `psychopy.parallel` — and uses the `portAddress` parameter consistently.

### Verification

Reproduced the failure against pristine `release`, then confirmed it is resolved on this branch:

```
setPortAddress('0x0378') -> 0x378  (int)
setPortAddress(0x0278)   -> 0x278
module resolves sys/logging: True True
```

There is no test file covering `triggerbox`, so this was verified by exercising the code path directly rather than through the suite. `psychopy/tests/test_hardware/` has pre-existing segfaults (`test_device_manager`, `test_photodiode`) and failures (`test_emulator`) on my machine, which has no attached hardware; I confirmed those are identical with and without this change. `test_keyboard.py`, `test_keyboard_events.py`, `test_gammasci.py` and `test_ports.py` pass (38 tests).

---

Co-authored by Claude Opus 5.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `994523dd0917`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.