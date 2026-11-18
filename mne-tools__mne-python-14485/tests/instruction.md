# Issue

**Title:** FIX: Allow plotting into matplotlib subfigures

## Description

#### what does this implement/fix?

 (cannot plot into matplotlib subfigure).

when passing an `Axes` residing within a `matplotlib.figure.SubFigure` to mne plotting functions like `evoked.plot(axes=ax)`, mne raised:

```text
TypeError: fig must be an instance of Figure, Brain, or EvokedField, got <class 'matplotlib.figure.SubFigure'>
instead.
```

in matplotlib (>= 3.4), both `Figure` and `SubFigure` inherit from `matplotlib.figure.FigureBase`. this pr:

1. updates `_validate_type` and `isinstance` checks in `mne/viz/ui_events.py` to allow `matplotlib.figure.FigureBase`.
2. connects close-event callbacks through `subfig.canvas` (which references the parent figure canvas), maintaining automatic channel cleanup on close.
3. updates `_BlitManager` in `mne/viz/utils.py` to call `self._fig.figure.draw_artist(artist)`, ensuring interactive time-scrubbing renders correctly on subfigures.
4. adds regression tests covering subfigure ui events and `evoked.plot(axes=ax)`.

#### verification

- `pytest mne/viz/tests/test_ui_events.py` passes (9/9).
- `pytest mne/viz/tests/test_evoked.py -k test_plot_evoked` passes.
- `ruff check`, `ruff format --check`, and `codespell` pass with no warnings.

#### additional information

assisted by google antigravity for traceback reproduction and linters; implementation, blitting fix, tests, and commit were authored and verified locally.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `357a25258080`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.