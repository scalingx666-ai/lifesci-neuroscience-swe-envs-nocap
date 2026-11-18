# Issue

**Title:** Shade event durations that span the scroll window

## Description

eegplot and eegplotlegacy excluded events that start before and end after the visible window, so their durations were never shaded. Such events are now included, the latency line and label are drawn only when the onset is visible, and the shading is clipped to the window start. Verified headless on both implementations with a synthetic 10 s event.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2922a4cb05d3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.