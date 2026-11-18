# Issue

**Title:** Enable Qt backend for image rendering

## Description

Supersedes #136 (kept open for history; will be closed on merge).

This is @RicardoRyn's fix from #136 with the review feedback applied:

- **`base.py:94`** — `ipython.magic('gui qt')` → `ipython.run_line_magic('gui', 'qt')` (deprecated since IPython 7.0).
- **`base.py:195-197`** — delete the `try_qt` warn-and-disable shim entirely (was commented out in #136).
- **`base.py:339-345`** — add `self.app.exec_()` after `self.app_window.show()`. Without it the Qt event loop never spins, so closing the window doesn't terminate `show()`.
- **New test** `test_try_qt_no_longer_warns_unsupported` asserts the old \"Qt rendering is not supported\" warning is gone. Uses `offscreen=True` so no real window is built (constructing a Qt window without a display segfaults on headless macOS).

Note: `app.exec_()` is **blocking**. When `try_qt=True`, `Plotter.show()` now spins the Qt event loop until the user closes the window. That's the intended fix but a behavioral change — added an inline comment explaining it.

## Test plan
- [x] `pytest brainspace/tests/` → 143 passed, 1 xfailed (excluding the existing plotting tests that need a display).
- [x] New \`test_try_qt_no_longer_warns_unsupported\` passes.
- [ ] Manual verification on a desktop with PyQt5 that closing the window now exits cleanly.

.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4b35490eb131`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.