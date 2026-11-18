# Issue

**Title:** Accept BIDS names for epochs FIF files

## Description

#### Reference issue (if any)

See  


#### What does this implement/fix?

<!-- Explain your changes. -->

BIDS names an epoched recording like a continuous one (e.g., `sub-01_task-rest_meg.fif`), so `read_epochs` and `Epochs.save` warned on valid BIDS files. `Epochs` now accept the same BIDS endings as raw files, from one list shared by reading and saving.

#### Additional information

<!-- Any additional information you think is important. -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `874535799172`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.