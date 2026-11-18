# Issue

**Title:** BUG: Fix Islands effect clearing whole segment with editable area masking

## Description

Problem: Islands effect cleared the current segment when editable area was set to the current segment (https://discourse.slicer.org/t/island-tool-inside-a-segment-removes-the-whole-segment/47649).

Root cause: The Islands effect operations (Remove small islands, Keep largest island, Split islands to segments) erased the selected segment first and then added the surviving islands back. When the editable area was restricted to the current segment, the editable mask is regenerated from that segment on every modification, so once the segment was erased the editable area became empty and the islands could no longer be written back - clearing the entire segment.

Fix: Do not erase the segment up front. For the split operation, fill the new per-island segments first (while the selected segment still defines a full editable area), then replace the selected segment content last with a single Set operation. The empty result case (e.g. all islands smaller than the minimum size) is handled explicitly.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dc009bc74665`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.