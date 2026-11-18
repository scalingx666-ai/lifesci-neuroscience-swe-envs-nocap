# Issue

**Title:** Cross-system transfer tutorial: masked-mean MDM with groups="device" (route metadata columns to pipelines)

## Description

Solve #1221 (as a tutorial, after review)

Cross-system transfer, where each system is an EEG device with its own montage and sampling rate, is handled by the existing API instead of a new evaluation class:

- the devices' datasets are pooled in a `CompoundDataset`;
- the paradigm keeps every trial with its device's channels and sampling rate (nested trials, #1327);
- `CrossSubjectEvaluation(cv_class=LeaveOneGroupOut, groups="device")` holds out one device at a time, using the `device` metadata column (#1328). A device is not a dataset: one dataset can use several devices, several datasets can share one.

**This PR now contains**
- the tutorial `examples/how_to_benchmark/plot_cross_system_transfer_maskedmean.py`: union of channels, mask matrices, minimum distance to masked Riemannian mean vs. zero-filled and channel-intersection MDM. The pipeline steps read the device of each training trial and infer the held-out device, so every device is the target in turn;
- generic metadata routing in `_evaluate_fold`: any metadata column of the training trials (`device`, `dataset`, `subject`...) is passed to the steps that request it with `set_fit_request(<column>=True)`, only when requested;
- a `device` argument for `FakeDataset`;
- a fix of `process()` returning results several times when datasets share a processing pipeline (found here, with its test).

`CrossSystemEvaluation` and its cross-system-only routing are removed.

**Tests**: metadata-column routing (requested / not requested), leave-one-device-out routing only the training devices, duplicated results; the tutorial runs end to end. `test_evaluations.py`, `test_paradigms.py` and `test_splits.py` pass locally.

@bruAristimunha @sylvchev @plcrodrigues

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `003f86c6dab6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.