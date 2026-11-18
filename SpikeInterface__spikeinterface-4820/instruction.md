# Issue

**Title:** Build one probe per electrode group in NwbRecordingExtractor

## Description

.

`NwbRecordingExtractor` builds a single probe from the `rel_x` and `rel_y` of every channel in the ElectricalSeries. The NWB schema defines those coordinates relative to the electrode group, so they only need to be unique within a group. When one ElectricalSeries holds several probes of the same type, each one its own electrode group (as in the Frank lab files from the issue), the channels of different probes share positions and loading the recording fails with "Contact positions must be unique within a probe". I now build one probe per electrode group and attach them with `check_overlap=False`, since overlapping groups are valid NWB. Users who want one recording per probe can call `recording.split_by("group")` after loading.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7d7bd2140b32`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.