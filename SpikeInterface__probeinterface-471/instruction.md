# Issue

**Title:** OpenEphys: check channel maps on same signal chain as NP probe

## Description

This PR fixes an issue when there are multiple signal chains (e.g. 2 sources) and there is a channel map in a signal chain different than the one with the Neuropixels probe.

We had logic to apply the esixting channel map, but it was not checking if the channel map was actually applied to the NP probe or other sources!

This PR fixes it by keeping a signal chain index for the NP_PROBE and CHANNEL_MAP processors and only applies the mapping if they match. Added a test file and a small test for this new fix.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c3dae2217afb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.