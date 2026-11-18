# Issue

**Title:** Add repr to MNEFigure

## Description

A little QoL improvement... our `repr` for browsers are currently just:
```
<mne_qt_browser._pg_figure.MNEQtBrowser object at 0x7f7ff69b7ed0>
```
Let's replace it by something nicer:
```
<MNEQtBrowser | ICA of RawEDF, browsing 2 components, 1.0 s>  # qt RawEDF

<MNEBrowseFigure | Epochs, browsing 19 channels, 1 epoch>     # matplotlib ICA
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f872b775540a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.