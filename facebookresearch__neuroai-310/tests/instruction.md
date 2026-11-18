# Issue

**Title:** neuralbench: handcrafted baselines for unvalidated tasks; on_filter_too_long defaults to raise

## Description

- `registry.feature_based_baseline(task_name)` returns a task's handcrafted
  sklearn pipeline, and gives unvalidated (`_`-prefixed) tasks the same pipeline
  as their validated name. `_task_aware_baseline` and the plots' "Handcrafted"
  row use it, so unvalidated tasks no longer lose that baseline.
- MEG task names in the registry and plots: `auditory_stimulus` is renamed
  `sustain_proc_negativity` (displayed "SPN"), and `motor_preparation` is added.
  `action_recognition` uses `xdawn_ts_lr` as its handcrafted baseline, and
  `motor_preparation` uses `cov_ts_lr`.
- `MneRaw.on_filter_too_long` defaults to `"raise"` again. The EEG
  `clinical_event` task and the `p3` `sosulski2019` and `cattan2019vr` variants,
  whose recordings are too short for the 0.1 Hz high-pass, set `"drop"`; their
  cache and experiment UIDs change.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ab5a478b3e8a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.