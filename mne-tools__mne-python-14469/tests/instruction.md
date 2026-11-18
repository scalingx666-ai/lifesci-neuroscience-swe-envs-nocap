# Issue

**Title:** Fix active figure check and Azure

## Description

Full docs build is failing when checking whether some pyvista figures are active, e.g.: https://app.circleci.com/pipelines/gh/mne-tools/mne-python/35013/details?useNewPipelines=true&workflowId=764768bd-2170-42a9-8a22-39fc5d8fc4ee&job=07a47ab9-e4f0-4fea-a714-d7bb09d2fcc9&buildNumber=89422&jobType=build&tab=tests#test-row-_..%2Fexamples%2Finverse%2Fresolution_metrics_eegmeg.py_resolution_metrics_eegmeg_Compute%20spatial%20resolution%20metrics%20to%20compare%20MEG%20with%20EEG%2BMEG

Seems to be a knock-on of the fixes for `ty` in #14443. Didn't show up before due to the partial docs build there, and then the failure was obscured in the daily full build due to the data timeout that was fixed in #14467.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0265fc9a575f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.