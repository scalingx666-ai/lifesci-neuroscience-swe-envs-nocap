# Issue

**Title:** [MRG] FIX: only reserve acq-calibration/crosstalk for MEG datatype

## Description

PR Description
--------------

`BIDSPath` raises if `acquisition` is `"calibration"` or `"crosstalk"` and a `task` is set, whatever the datatype. In BIDS these labels are reserved only for MEG fine-calibration and crosstalk files ([MEG spec](https://bids-specification.readthedocs.io/en/stable/modality-specific-files/magnetoencephalography.html#cross-talk-and-fine-calibration-files)). For EEG they are ordinary acq labels, and some EEG datasets do have calibration runs with a task.

This PR keeps the check for `datatype="meg"` and when no datatype is set, so MEG behaviour is unchanged. It skips the check when the datatype is set to something other than MEG.

Test: one extra line in `test_write_meg_crosstalk`, checking that an EEG path with `acq-crosstalk` and a task is accepted. The existing MEG check in that test still raises.

Context: in MOABB we currently rename these labels on write and back on read to get around this check. This change would let us drop that.

AI disclosure: I used Claude (Anthropic) as a coding agent to draft the change, the test and the changelog entry. I reviewed and tested the result, and I can explain every line.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `49e960ff0442`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.