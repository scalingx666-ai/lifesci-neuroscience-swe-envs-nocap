# Issue

**Title:** fix(spikesorting v2): project probe to 2D in build_analyzer so unit_locations / GUI work

## Description

Targets the Spike Sorting v2 branch (#1609).

While driving the v2 single-session pipeline into a manual-curation pass in `spikeinterface-gui`, I hit this: the `SortingAnalyzer` that `build_analyzer` creates — and that `Sorting.get_analyzer` returns — carries a **3D probe**, because Spyglass stores electrode geometry with a z coordinate (typically 0). The build succeeds, but computing `unit_locations` on it, or opening it in `spikeinterface-gui`, raises:

```
ValueError: could not broadcast input array from shape (3,) into shape (2,)
```

The localization estimators (`monopolar_triangulation` / `center_of_mass`) and the GUI probe view assume 2D contact positions.

**Fix:** project the probe to 2D (`axes="xy"`) before `create_sorting_analyzer` when it is 3D. In-plane x/y are unchanged, so sparsity/templates/waveforms are unaffected — only the all-zero z axis is dropped. Confined to the analyzer build, so the sort still sees the untouched recording. Adds a DB-free regression test driving `build_analyzer` with a synthetic 3D-probe recording.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bdbabea53af6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.