# Issue

**Title:** ENH: Multi frame filter to handle stack with multiple orientations

## Description

Some vendors produce enhanced DICOMs with (logical) frame groups of different orientations sharing the same Stack ID - this breaks in `image_shape`.

This filter groups frames by orientation and returns only the frames of the first logical stack.

Relevant for #1392
---

I basically hit #1392 with some XA70A localizer data from a recent Siemens scanner. Unfortunately filtering in downstream applications (heudiconv) is not possible for us, because we rely on the localizer name to set a session ID (reproin logic).

I'm aware this PR does not solve the issue. Still, it's super helpful for us and maybe to others as well. The code is emitting a warning that frames have been discarded, similar to the two existing filters. Also, I have trouble interpreting the [definition](https://dicom.nema.org/medical/dicom/current/output/html/part03.html#table_C.7.6.16-3) of the Stack ID and I'm still not 100% certain this is actually allowed in DICOM or if our data is non-conformant.

Be aware, that the method was drafted by claude/AI with me reviewing and testing it.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `09bdbf4c40a6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.