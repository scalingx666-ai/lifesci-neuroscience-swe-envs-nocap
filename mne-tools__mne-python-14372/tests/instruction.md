# Issue

**Title:** FIX: Fix reading evoked files with local channel information

## Description

#### Reference issue (if any)
None.

#### What does this implement/fix?
`read_evokeds` fails for older evoked FIFF files that store channel information directly in the evoked block (`FIFF_NCHAN`, `FIFF_SFREQ`, `FIFF_CH_INFO`), as written by older MNE-C tools:

`RuntimeError: chs cannot be set directly. Please use methods inst.add_channels(), ...`

The issue is that `_read_evoked` assigns `info["chs"]` and `info["sfreq"]` while `Info` is locked.

This PR moves these assignments into `info._unlock(update_redundant=True)`. This also updates `nchan` and `ch_names` from the local channel definitions. Without this update, files with one `FIFF_EPOCH` tag per channel can later fail with `"Number of epoch tags is unreasonable"` when the local channel count differs from the measurement info.

`test_io_evoked` now covers this case by writing a file with local channel information, a different sampling rate in the measurement info, and one epoch tag per channel. It verifies that sampling rate, channel names, and data are read back correctly.

#### Additional information
Found while cross-validating the MNE-CPP FIFF reader against MNE-Python.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dfa1e352c3cf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.