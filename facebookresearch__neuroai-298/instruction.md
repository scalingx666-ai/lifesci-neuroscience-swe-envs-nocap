# Issue

**Title:** Feat/per subject regression metrics

## Description

### What this changes
This PR adds per-subject regression reporting for the EMG-to-pose task and wires it into the existing evaluation flow.
- Adds `GroupedMetric` support in `BrainModule` metric logging for grouped regression metrics.
- Logs per-subject aggregate keys at test/val epoch end:
  - `..._subject_mean`
  - `..._subject_std` (sample SD, `ddof=1`)
  - `..._n_subjects`
- Persists raw grouped/per-subject metric values to JSON under the run directory (`per_subject_metrics/`) for cached analysis.
- Enables per-subject MAE for `emg/pose` by adding:
  - `mae_per_subject` (`GroupedMetric` with `MeanAbsoluteError` backend) in task config.
- Updates docs/tutorial text to reflect:
  - EMG scaling from volts to microvolts (`scale_factor: 1e6`)
  - new per-subject metric keys.
### Why
`test/mae` alone is pooled and can hide cross-subject variability.  
These aggregates make subject-level performance distribution visible while keeping logs compact and reproducible.
### Expected new metric keys (EMG pose)
- `test/mae_per_subject_subject_mean`
- `test/mae_per_subject_subject_std`
- `test/mae_per_subject_n_subjects`
(and equivalent `val/...` when applicable)
### Files changed
- `neuralbench-repo/neuralbench/pl_module.py`
- `neuralbench-repo/neuralbench/tasks/emg/pose/config.yaml`
- `neuralbench-repo/neuralbench/test_main.py`
- `neuraltrain-repo/neuraltrain/metrics/metrics.py`
- `neuraltrain-repo/neuraltrain/metrics/test_config.py`
- `docs/neuralbench/tasks/emg/pose.rst`
- `docs/neuralbench/tutorials/07_biosignal_challenge_2026/plot_track4_emg_to_pose.py`
### Notes
- Grouped metric aggregates are currently rank-local in distributed mode (warning emitted), and logged with `sync_dist=False`.
- No task behavior change to target/loss definition; this is additional reporting plus docs alignment.
## Checklist
- [x] Tests added or updated
- [x] Docstrings updated for any changed public APIs
- [ ] `pytest` and `mypy` pass locally

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d646eb2a1ad7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.