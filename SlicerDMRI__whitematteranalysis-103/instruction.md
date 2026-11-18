# Issue

**Title:** Slicer module

## Description

Slicer can be built standalone or downloaded. The current `wm_apply_ORG_atlas_to_subject.sh` script is compatible for a built Slicer that does not require various paths adjustment during execution. But it is not compatible with path adjusted Slicer commands. The incompatibility arises with the values accepted by `-s` and `-m` arguments.

* The `-s` accepted by `wm_apply_ORG_atlas_to_subject.sh` may not be just `Slicer`. For a shared `Slicer`, it can be `"AdditionalPaths=/path/to/SlicerDMRI /path/to/etc Slicer"`.

* Again, for a downloaded (not built) Slicer the `-m` argument can be `"Slicer --launch /path/to/Slicer-4.10/cli-modules/FiberTractMeasurements"`.

To support all such values of `-s` and `-m`, [`$SlicerPath`](https://github.com/SlicerDMRI/whitematteranalysis/blob/master/bin/wm_apply_ORG_atlas_to_subject.sh#L298) and [`$FiberTractMeasurementsCLI`](https://github.com/SlicerDMRI/whitematteranalysis/blob/master/bin/wm_apply_ORG_atlas_to_subject.sh#L393) must be enclosed in double-quotes.

For the same multiple choices available to `-s`, it is safest to check the existence of the last element of `-s` i.e. `args.Slicer.split()[-1]`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2f69e4550652`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.